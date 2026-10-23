select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
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
limit 10;