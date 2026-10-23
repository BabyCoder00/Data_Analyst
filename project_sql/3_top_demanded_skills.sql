
select 
    skills,
    count(s.job_id) as demand_count
from job_postings_fact as j
inner join skills_job_dim as s
on j.job_id = s.job_id
inner join skills_dim as sd
on sd.skill_id = s.skill_id
where job_title_short = 'Data Analyst' and 
    job_work_from_home = True
group by 
    skills
order by 
    demand_count desc
limit 5;