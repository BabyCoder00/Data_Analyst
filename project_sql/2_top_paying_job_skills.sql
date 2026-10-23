with top_paying_jobs as(
select 
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date, 
    name as company_name
FROM job_postings_fact as j
left join company_dim as c
    on j.company_id = c.company_id
where 
    job_title_short = 'Data Analyst' and 
    job_location = 'Anywhere' and 
    salary_year_avg is not null 
order by 
    salary_year_avg desc
limit 10
)
select 
    t.*,
    sd.skills
from top_paying_jobs as t
inner join skills_job_dim as s
on t.job_id = s.job_id
inner join skills_dim as sd
on sd.skill_id = s.skill_id
order by 
    salary_year_avg desc;