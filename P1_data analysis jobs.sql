-- 1. How many rows are in the data_analyst_jobs table?
-- select count(*)
-- from data_analyst_jobs;
--1793 rows

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- select *
-- from data_analyst_jobs
-- limit 10;
--ExxonMobil

-- 3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky? 
-- select count (*) as TN_jobs
-- from data_analyst_jobs
-- where location = 'TN';

-- select count (*) as tn_ky_jobs
-- from data_analyst_jobs
-- where location = 'TN' 
-- 	or location = 'KY';
-- 21 in TN, 6 in KY, 27 in both

-- 4. How many postings in Tennessee have a star rating above 4?
-- select count (*)
-- from data_analyst_jobs
-- where location = 'TN'
-- 	and star_rating > 4;
-- 3 TN jobs with about 4 stars

-- 5. How many postings in the dataset have a review count between 500 and 1000?
-- select count (*)
-- from data_analyst_jobs
-- where review_count >= 500 and review_count <=  1000;
-- 151 entries with more than 500 but less than 100 reviews.

-- 6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
-- select location as state, avg(star_rating) as avg_rating
-- from data_analyst_jobs
-- where star_rating is not null
-- group by state
-- order by avg_rating desc;
--NE seems to have the highest average rating at 4.2

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?
-- select count(distinct title) as unique_job_titles
-- from data_analyst_jobs;
--881 unique job titles

-- 8. How many unique job titles are there for California companies?
-- select count(distinct title) as unique_CA_job_titles
-- from data_analyst_jobs
-- where location = 'CA';
-- 230 unique job titles in California

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- select company, avg(star_rating) as avg_rating
-- from data_analyst_jobs
-- where review_count > 5000
-- group by company;
-- 41 distinct companies with more than 5000 reviews

-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- select company, avg(star_rating) as avg_rating
-- from data_analyst_jobs
-- where review_count > 5000
-- group by company
-- order by avg_rating desc;
--General Motors seems to have the highest avg_rating at 4.2, though that goes for many entires

-- 11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
-- select count(*) as analyst_titles
-- from data_analyst_jobs
-- where title ilike '%analyst%';

-- select count(distinct title) as analyst_titles
-- from data_analyst_jobs
-- where title ilike '%analyst%';
--1669 analyst jobs, 774 distinct titles

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-- select title as non_analyst_jobs
-- from data_analyst_jobs
-- where title not ilike '%analyst%'
-- 	and title not ilike '%analytics%';
-- 4 non-analyst and non-analytics jobs. These 4 are all involved with Tableau.

-- BONUS
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

-- Disregard any postings where the domain is NULL.
-- Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
-- Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
-- select domain, count(skill) as sql_skill
-- from data_analyst_jobs
-- where days_since_posting > 21
-- 	and domain is not null
-- 	and skill ilike '%sql%'
-- group by domain
-- order by sql_skill desc;
-- Top industries are Internet & Software at 62 jobs, Banks & Financial Services at 61 jobs, Consulting & Business Services at 57 jobs, and Health Care at 52 jobs.