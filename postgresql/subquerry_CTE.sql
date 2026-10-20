-- select *
-- from (SELECT *
--     from job_postings_fact
--     where extract(month from job_posted_date) = 1
--     ) as jan_jobs;

-- with january_jobs as (
--     select *
--     from job_postings_fact
--     where extract(month from job_posted_date) = 1
-- )
-- select * from january_jobs;

-- select
--     company_id,
--     name as company_name                 
-- from company_dim
-- where company_id in (
--     select 
--         company_id
--     from 
--         job_postings_fact
--     where 
--         job_no_degree_mention = true
--     ORDER BY
--         company_id
--     );

with company_job_count as (
    select 
        company_id,
        count(*) as total_jobs
    from 
        job_postings_fact
    GROUP BY
        company_id
)
select company_dim.name as company_name,
    company_job_count.total_jobs
FROM company_dim
left join company_job_count on company_job_count.company_id = company_dim.company_id;



WITH remote_job_skills AS (
    SELECT
        s.skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim AS s
    INNER JOIN job_postings_fact AS j
        ON j.job_id = s.job_id
    WHERE j.job_work_from_home = TRUE AND
        j.job_title_short = 'Data Analyst'
    GROUP BY s.skill_id
)
SELECT
    sk.skill_id,
    sk.skills AS skill_name,
    rj.skill_count
FROM remote_job_skills AS rj
INNER JOIN skills_dim AS sk
    ON sk.skill_id = rj.skill_id
ORDER BY rj.skill_count DESC
limit 5;


