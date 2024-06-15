-- Запрос находит топ-10 самых высокооплачиваемых вакансий 'Data Analyst' с местоположением 'Anywhere', а затем дополняет каждую из этих вакансий информацией о требуемых навыках.


WITH top_paing_jobs AS (
    SELECT
        job_id, 
        job_title, 
        salary_year_avg, 
        name AS company_name 
    FROM
        job_postings_fact 
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL 
    ORDER BY 
    salary_year_avg DESC 
    LIMIT 10
)
SELECT 
    top_paing_jobs.*,
    skills
FROM top_paing_jobs
INNER JOIN skills_job_dim ON top_paing_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC