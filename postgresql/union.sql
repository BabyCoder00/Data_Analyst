select
    job_title_short,
    company_id,
    job_location
from january_jobs
UNION
select
    job_title_short,
    company_id,
    job_location
from feb_jobs
UNION
select
    job_title_short,
    company_id,
    job_location
from march_jobs;

select
    job_title_short,
    company_id,
    job_location
from january_jobs
UNION all
select
    job_title_short,
    company_id,
    job_location
from feb_jobs
UNION all
select
    job_title_short,
    company_id,
    job_location
from march_jobs;


select 
    q1.job_title_short,
    q1.job_location,
    q1.job_via,
    q1.job_posted_date::date,
    q1.salary_year_avg
from (
    select * from january_jobs
    union ALL
    select * FROM feb_jobs
    UNION ALL
    select * FROM march_jobs
) as q1
where 
    q1.salary_year_avg > 70_000 and 
    q1.job_title_short = 'Data Analyst'
order by 
    q1.salary_year_avg desc;