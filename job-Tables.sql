CREATE DATABASE job_portal;
USE job_portal;


-- 1. Candidate Profiles
CREATE TABLE candidate_profiles (
    profile_id INT PRIMARY KEY,
    candidate_id INT,
    highest_qualification VARCHAR(100),
    total_experience DECIMAL(3,1),
    current_job_title VARCHAR(100),
    current_company VARCHAR(100),
    expected_salary DECIMAL(12,2),
    resume_link VARCHAR(255)
);


-- 2. Skills
CREATE TABLE skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(100)
);


-- 3. Certifications
CREATE TABLE certifications (
    certification_id INT PRIMARY KEY,
    certification_name VARCHAR(150),
    provider VARCHAR(100)
);


-- 4. Candidate Certifications
CREATE TABLE candidate_certifications (
    id INT PRIMARY KEY,
    candidate_id INT,
    certification_id INT,
    completion_date DATE,

    FOREIGN KEY (certification_id)
    REFERENCES certifications(certification_id)
);


-- 5. Companies
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(150),
    industry VARCHAR(100),
    founded_year INT,
    website VARCHAR(255)
);


-- 6. Company Locations
CREATE TABLE company_locations (
    location_id INT PRIMARY KEY,
    company_id INT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),

    FOREIGN KEY (company_id)
    REFERENCES companies(company_id)
);


-- 7. Recruiters
CREATE TABLE recruiters (
    recruiter_id INT PRIMARY KEY,
    company_id INT,
    recruiter_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(20),

    FOREIGN KEY (company_id)
    REFERENCES companies(company_id)
);


-- 8. Job Categories
CREATE TABLE job_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);


-- 9. Job Postings
CREATE TABLE job_postings (
    job_id INT PRIMARY KEY,
    company_id INT,
    recruiter_id INT,
    category_id INT,
    job_title VARCHAR(150),
    job_type VARCHAR(50),
    experience_required INT,
    salary_min DECIMAL(12,2),
    salary_max DECIMAL(12,2),
    posted_date DATE,

    FOREIGN KEY (company_id)
    REFERENCES companies(company_id),

    FOREIGN KEY (recruiter_id)
    REFERENCES recruiters(recruiter_id),

    FOREIGN KEY (category_id)
    REFERENCES job_categories(category_id)
);


-- 10. Job Skills
CREATE TABLE job_skills (
    job_skill_id INT PRIMARY KEY,
    job_id INT,
    skill_id INT,

    FOREIGN KEY (job_id)
    REFERENCES job_postings(job_id),

    FOREIGN KEY (skill_id)
    REFERENCES skills(skill_id)
);


-- 11. Job Applications
CREATE TABLE job_applications (
    application_id INT PRIMARY KEY,
    candidate_id INT,
    job_id INT,
    application_date DATE,
    application_status VARCHAR(50),

    FOREIGN KEY (job_id)
    REFERENCES job_postings(job_id)
);


-- 12. Candidate Skills
CREATE TABLE candidate_skills (
    candidate_skill_id INT PRIMARY KEY,
    candidate_id INT,
    skill_id INT,
    proficiency_level VARCHAR(50),

    FOREIGN KEY (skill_id)
    REFERENCES skills(skill_id)
);


-- 13. Interview Rounds
CREATE TABLE interview_rounds (
    round_id INT PRIMARY KEY,
    round_name VARCHAR(100)
);


-- 14. Interviews
CREATE TABLE interviews (
    interview_id INT PRIMARY KEY,
    application_id INT,
    round_id INT,
    interview_date DATE,
    interviewer_name VARCHAR(100),

    FOREIGN KEY (application_id)
    REFERENCES job_applications(application_id),

    FOREIGN KEY (round_id)
    REFERENCES interview_rounds(round_id)
);


-- 15. Interview Feedback
CREATE TABLE interview_feedback (
    feedback_id INT PRIMARY KEY,
    interview_id INT,
    rating INT,
    comments VARCHAR(500),
    result VARCHAR(50),

    FOREIGN KEY (interview_id)
    REFERENCES interviews(interview_id)
);


-- 16. Offers
CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    application_id INT,
    offered_salary DECIMAL(12,2),
    offer_date DATE,
    offer_status VARCHAR(50),

    FOREIGN KEY (application_id)
    REFERENCES job_applications(application_id)
);


-- 17. Hires
CREATE TABLE hires (
    hire_id INT PRIMARY KEY,
    offer_id INT,
    joining_date DATE,
    employment_status VARCHAR(50),

    FOREIGN KEY (offer_id)
    REFERENCES offers(offer_id)
);


-- 18. Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    company_id INT,
    amount DECIMAL(12,2),
    payment_date DATE,
    payment_type VARCHAR(50),

    FOREIGN KEY (company_id)
    REFERENCES companies(company_id)
);


-- 19. Login Activity
CREATE TABLE login_activity (
    login_id INT PRIMARY KEY,
    candidate_id INT,
    login_time DATETIME,
    device_type VARCHAR(50),
    ip_address VARCHAR(50)
);


-- 20. Applications
CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    candidate_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(50)
);