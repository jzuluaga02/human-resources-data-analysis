# Data Analysis - Human Resources

Introducing a project encompassing a comprehensive data processing and analysis endeavor. The project comprises several stages, each contributing to a thorough understanding of the dataset at hand, in this case, the data is for human resources in a given company. Beginning with meticulous data cleaning, carried out using Excel and SQL, this phase ensures accuracy and integrity, setting a solid foundation for subsequent analysis.


# Dataset

Data - Human resources data with over 22000 rows from the year 2000 to 2020.

Data Cleaning - MySQL Workbench

Data Exploration - Jupyter Notebook

Data Visualization - PowerBI

# Data Cleaning

The main issue in this dataset was with the date fields since the format was not consistent throughout the rows and the type needed to be changed to Date so that operations in the query can be performed. On the other hand, the term date column had values that included dates that still hadn't happened. Lastly, some of the ages were negative which is clearly imposible.

![cleaning_1_solved](https://github.com/jzuluaga02/human-resources-data-analysis/assets/114960212/9d9d1d2b-995d-47a4-8e1f-e6bc44e5297f)


![cleaning_2_solved](https://github.com/jzuluaga02/human-resources-data-analysis/assets/114960212/edc05e92-b1d5-42c9-85f6-b8c70769d80c)


![cleaning_3](https://github.com/jzuluaga02/human-resources-data-analysis/assets/114960212/45d6d15d-b96d-483b-abdc-4d7964c863be)


# Queries for Data Exploration

What is the gender breakdown of employees in the company?
What is the race/ethnicity breakdown of employees in the company?
What is the age distribution of employees in the company?
How many employees work at headquarters versus remote locations?
What is the average length of employment for employees who have been terminated?
How does the gender distribution vary across departments and job titles?
What is the distribution of job titles across the company?
Which department has the highest turnover rate?
What is the distribution of employees across locations by state?
How has the company's employee count changed over time based on hire and term dates?
What is the tenure distribution for each department?

# Findings after performing Data Exploration with SQL

-  Male employees constitute the majority.
-  The dominant racial group is White, while Native Hawaiian and American Indian groups are underrepresented.
-  Employee ages span from 20 to 57 years.
-  Data is categorized into five age groups: 18-24, 25-34, 35-44, 45-54, and 55-64.
-  The 25-34 age group has the highest employee representation, followed by 35-44, while the 55-64 group is the smallest.
-  Headquarters hosts the majority of employees, with a smaller number working remotely.
-  Terminated employees have an average employment length of approximately 7 years.
-  Gender distribution across departments is relatively balanced, with a male predominance.
-  Marketing has the highest turnover, followed by Training, while Research and Development, Support, and Legal have the lowest.
-  A notable proportion of employees originate from Ohio.
-  Net employee changes have shown an upward trend over time.
-  Average department tenure is about 8 years, with Legal and Auditing having the highest and Services, Sales, and Marketing the lowest.


# Final dashboard

![Power BI REPORT](https://github.com/jzuluaga02/human-resources-data-analysis/assets/114960212/8da880ce-7e89-46dc-8bc8-8bad0132179e)
