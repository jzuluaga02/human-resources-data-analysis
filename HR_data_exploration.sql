#Questions answering

USE human_resources;
#  What is the gender breakdown of employees in the company

SELECT gender, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY gender;

#  What is the race breakdown of employees in the company
SELECT race, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY race;

# What is the age distribution of employees in the company?

SELECT 
	CASE
	  WHEN age >= 18 AND age < 23 THEN '18-22'
	  WHEN age >= 23 AND age < 27 THEN '23-26'
	  WHEN age >= 27 AND age < 31 THEN '27-30'
	  WHEN age >= 30 AND age < 34 THEN '30-33'
	  WHEN age >= 34 AND age < 40 THEN '34-39'
	  WHEN age >= 40 AND age < 50 THEN '40-49'
      WHEN age >= 50 AND age < 60 THEN '50-59'
      ELSE '60+'
	END AS age_group,gender,
    COUNT(*) as count
FROM 
  hr
WHERE
 age >= 18
GROUP BY age_group, gender
ORDER BY age_group, gender;

SELECT 
  MIN(age) AS youngest,
  MAX(age) AS oldest
FROM hr
WHERE age >= 18;



-- 4. How many employees work at headquarters versus remote locations?

SELECT location, COUNT(*) as location_count
FROM hr
WHERE age >= 18
GROUP BY location;


-- 5. What is the average length of employment for employees who have been terminated?

SELECT  ROUND(AVG(datediff(termdate,hire_date))/365,0) as average_employment_lenght
FROM hr 
WHERE termdate <> '0000-00-00' AND termdate > curdate() AND age >= 18;

-- 6. How does the gender distribution vary across departments and job titles?

SELECT department,gender, COUNT(*) as count_gender_department
FROM hr
GROUP BY department,gender
ORDER BY department;

SELECT jobtitle,gender, COUNT(*) as count_gender_department
FROM hr
GROUP BY jobtitle,gender
ORDER BY jobtitle;


-- 7. What is the distribution of job titles across the company?

SELECT jobtitle, COUNT(*) as job_titles_distribution
FROM hr
WHERE age >= 18
GROUP BY jobtitle
ORDER BY jobtitle DESC; 


-- 8. Which department has the highest turnover rate?

SELECT department, COUNT(*) as total_count, 
    SUM(CASE WHEN termdate <= CURDATE() AND termdate <> '0000-00-00' THEN 1 ELSE 0 END) as terminated_count, 
    SUM(CASE WHEN termdate = '0000-00-00' THEN 1 ELSE 0 END) as active_count,
    (SUM(CASE WHEN termdate <= CURDATE() THEN 1 ELSE 0 END) / COUNT(*)) as termination_rate
FROM hr
WHERE age >= 18
GROUP BY department
ORDER BY termination_rate DESC;


-- 9. What is the distribution of employees across locations by city and state?

SELECT location_state, COUNT(*) as count
FROM hr
WHERE age >= 18
GROUP BY location_state
ORDER BY count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?

SELECT YEAR(hire_date), 
COUNT(*) as total_count, SUM(CASE WHEN termdate <= curdate() AND termdate <> '0000-00-00' THEN 1 ELSE 0 END) as terminations,
COUNT(*) - SUM(CASE WHEN termdate <= curdate() AND termdate <> '0000-00-00' THEN 1 ELSE 0 END) as net_change,
ROUND((COUNT(*) - SUM(CASE WHEN termdate <= curdate()  THEN 1 ELSE 0 END)))/COUNT(*) as net_change_percent
FROM 
	hr
WHERE age >=18
GROUP BY
	YEAR(hire_date)
ORDER BY
	YEAR(hire_date) ASC;


-- 11. What is the tenure distribution for each department?

SELECT department, ROUND(AVG(DATEDIFF(CURDATE(), termdate)/365),0) as avg_tenure
FROM hr
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00' AND age >= 18
GROUP BY department