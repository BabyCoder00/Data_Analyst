create table job_applied (
    job_id int,
    application_sent_date date,
    custom_resume boolean,
    resume_file_name varchar(255),
    cover_letter_file_sent boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);

insert into job_applied
    (
        job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_file_sent,
        cover_letter_file_name,
        status
    )
VALUES
(1, '2026-10-01', TRUE, 'resume_data_analyst.pdf', TRUE, 'cover_letter_1.pdf', 'Applied'),
(2, '2026-10-03', FALSE, 'resume_default.pdf', FALSE, NULL, 'Pending'),
(3, '2026-10-05', TRUE, 'resume_software_dev.pdf', TRUE, 'cover_letter_3.pdf', 'Interview'),
(4, '2026-10-08', TRUE, 'resume_python_dev.pdf', FALSE, NULL, 'Rejected'),
(5, '2026-10-10', FALSE, 'resume_default.pdf', TRUE, 'cover_letter_5.pdf', 'Applied');

select * FROM job_applied;

alter table job_applied
add contact varchar(50);

UPDATE job_applied
SET contact = CASE
    WHEN job_id = 1 THEN '9876543210'
    WHEN job_id = 2 THEN '9876543211'
    WHEN job_id = 3 THEN '9876543212'
    WHEN job_id = 4 THEN '9876543213'
    WHEN job_id = 5 THEN '9876543214'
END
WHERE job_id IN (1, 2, 3, 4, 5);

alter table job_applied
rename column contact to contact_name;

ALTER TABLE job_applied
alter column contact_name type text;

alter table job_applied
drop column contact_name;

drop TABLE job_applied;

select count(*) from company_dim;
select count(*) from skills_dim;
select count(*) from job_postings_fact;
select count(*) from skills_job_dim;
