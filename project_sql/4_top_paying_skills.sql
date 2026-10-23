
select 
    skills,
    round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact as j
inner join skills_job_dim as s
on j.job_id = s.job_id
inner join skills_dim as sd
on sd.skill_id = s.skill_id
where job_title_short = 'Data Analyst' 
    and salary_year_avg is not null
    and job_work_from_home = True
group by 
    skills
order by 
    avg_salary desc
limit 25;