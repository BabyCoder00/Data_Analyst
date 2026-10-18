-- date and time

select 
    '2023-02-19':: date,
    '123':: integer,
    'true':: boolean,
    '3.14':: real;

select
    job_title_short as title,
    job_location as location,
    job_posted_date:: date as date
from 
    job_postings_fact;

select
    job_title_short as title,
    job_location as location,
    job_posted_date at time zone 'UTC' at time zone 'EST'as date_time
from 
    job_postings_fact
limit 5;


select
    job_title_short as title,
    job_location as location,
    job_posted_date at time zone 'UTC' at time zone 'EST'as date_time,
    extract(month from job_posted_date) as month
from 
    job_postings_fact
limit 5;

select 
    count(job_id) as job_posted_count,
    extract(month from job_posted_date) as month 
from 
    job_postings_fact
where 
    job_title_short = 'Data Analyst'
group BY
    month 
order by 
    job_posted_count desc
limit 5;


create table january_jobs as 
    select * FROM job_postings_fact
    where extract(month from job_posted_date) = 1;


create table feb_jobs as 
    select * FROM job_postings_fact
    where extract(month from job_posted_date) = 2;


create table march_jobs as 
    select * FROM job_postings_fact
    where extract(month from job_posted_date) = 3;

select job_posted_date 
from march_jobs;

-- Case expression

select 
    job_title_short,
    job_location
from 
    job_postings_fact;


