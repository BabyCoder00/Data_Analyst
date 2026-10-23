with skills_demand as (
    select 
        s.skill_id,
        skills,
        count(s.job_id) as demand_count
    from job_postings_fact as j
    inner join skills_job_dim as s
    on j.job_id = s.job_id
    inner join skills_dim as sd
    on sd.skill_id = s.skill_id
    where job_title_short = 'Data Analyst' and 
        job_work_from_home = True
        and salary_year_avg is not null
    group by 
        s.skill_id,skills
), average_salary as (
    select 
        s.skill_id,
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
        s.skill_id,skills
)

select 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from skills_demand
inner join average_salary
on skills_demand.skill_id = average_salary.skill_id
where demand_count > 10
order by 
    avg_salary DESC,
    demand_count desc
limit 25;