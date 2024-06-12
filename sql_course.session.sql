SELECT 
count(job_id) as job_posted_count,
EXTRACT (MONTH FROM job_posted_date) as date
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
GROUP BY date
ORDER BY job_posted_count ASC;