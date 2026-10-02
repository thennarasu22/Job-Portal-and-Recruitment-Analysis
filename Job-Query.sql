select*from candidates where gender="female"
select* from candidates where city="chennai"
select*from offers where offer_status="Accepted"
select*from hires where employment_status = "active"
use job
select*from candidates order by first_name
select company_name, founded_year from companies order by founded_year desc limit 1
select max(salary_max) as highest_salary_package,job_title from job_postings group by job_title 
order by highest_salary_package desc limit 1

select*from candidates where registration_date>"2025-1-1"
select*from job_postings where salary_min>600000
select*from payments where amount>50000
select*from job_postings where experience_required >= 3

select*from applications where status="selected"
select*from login_activity where device_type="mobile"
select*from interview_feedback where rating=5
select*from recruiters where company_id=1

select count(candidate_id) as total_candidate from candidates
select count(company_id) as total_company from companies
select avg(offered_salary) as avg_salary from offers
select max(offered_salary) as highest_salary from offers
select min(offered_salary) as lowest_salary from offers
select sum(amount) as amt from payments 
select count(job_id) as total_job_posting from job_postings
select count(application_id) as sno ,status from applications group by status having status="selected"
select avg(rating) as avg_rating from interview_feedback
select count(hire_id) as no_id ,employment_status from hires 
group by employment_status having employment_status="Active"
select count(candidate_id) as no_of_candidate,gender from candidates group by gender 
select count(candidate_id) as no_of_candidate,city from candidates group by city
select count(job_id) as no_job ,job_title from job_postings group by job_title
select count(recruiter_id) as no_of_rec,company_id from recruiters group by company_id
select count(registration_date) as total_reg , city from candidates group by city having total_reg>5

select b.profile_id,a.first_name,b.current_job_title,b.highest_qualification,b.current_company,b.expected_salary,b.total_experience from candidates  as a inner join 
candidate_profiles as b  on a.candidate_id=b.candidate_id

select b.profile_id,a.first_name,b.current_job_title,b.highest_qualification,b.current_company,b.expected_salary,b.total_experience from candidates  as a inner join 
candidate_profiles as b  on a.candidate_id=b.candidate_id

select a.first_name,c.skill_name from candidates as a 
inner join candidate_skills as b 
on a.candidate_id=b.candidate_id 
inner join skills as c
on c.skill_id=b.skill_id


select a.recruiter_name,b.company_name from recruiters as a 
inner join companies as b 
on a.company_id=b.company_id

select a.company_name,b.job_title from companies as a 
inner join job_postings as b
on a.company_id = b.company_id

select a.first_name,b.application_date,b.job_id,b.status,b.application_id  from candidates as a
inner join applications as b
on a.candidate_id = b.candidate_id

select b.round_name,a.interview_date,a.interview_id,a.interviewer_name from interviews as a 
inner join interview_rounds as b
on a.round_id = b.round_id

select a.interviewer_name,b.rating,b.comments,b.result from  interviews as a 
inner join interview_feedback as b
on a.interview_id=b.interview_id

select a.offered_salary,a.offer_date,a.offer_status,b.candidate_id from offers as a
inner join applications as b 
on a.application_id = b.application_id

select a.offer_status,b.hire_id,b.joining_date,b.employment_status from offers as a
inner join hires  as b 
on a.offer_id = b.offer_id

select a.amount,b.company_name from payments as a
inner join companies as b 
on a.company_id = b.company_id

select*from candidate_profiles where expected_salary
=( select max(expected_salary) from candidate_profiles)

use job
SELECT *
FROM companies
WHERE company_id = (
    SELECT company_id
    FROM payments
    ORDER BY amount DESC
    LIMIT 1
);

select * from job_postings 
where salary_max>(
select avg(salary_max) 
from job_postings)

select * from candidates
where candidate_id in (select candidate_id from applications)

select*from companies where company_id 
in(select distinct company_id from job_postings)


select*from  candidates
select*from  job_postings