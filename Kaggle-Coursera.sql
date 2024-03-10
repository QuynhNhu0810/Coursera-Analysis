--delete courses with wrong format--
delete from dbo.[CourseraDataset-Clean]
where Course_Title like '%???%'
  
--round rating values to 2 decimals places--
update dbo.[CourseraDataset-Clean]
set Rating= ROUND(Rating, 2)

--check for null or blank--
delete from dbo.[CourseraDataset-Clean]
where Course_Title is null or Course_Title = ' '

delete from dbo.[CourseraDataset-Clean]
where Rating is null or Rating = ' ' 

--count total rows and columns of dataset--
select count(*) as TotalRows from dbo.[CourseraDataset-Clean]

select count(*) as TotalColumns
from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA = 'dbo' and TABLE_NAME = 'CourseraDataset-Clean';

--remove duplicate rows--
with CTE as (
    select *,
           ROW_NUMBER() OVER (PARTITION BY Course_Title ORDER BY (SELECT NULL)) AS RowNum
    FROM dbo.[CourseraDataset-Clean]
)
delete from CTE
where RowNum > 1;

--Course Difficulty Count--
create table CourseDifficulty (
    Level VARCHAR(100),
    totalcourse INT
)

Insert into CourseDifficulty (Level, totalcourse)
select Level, count(*) AS totalcourse
FROM dbo.[CourseraDataset-Clean]
where Level != 'Not specified'
GROUP BY Level;


--Course Duration vs. Popularity--
create table CourseDuration (
    DurationCategory VARCHAR(100),
    TotalCourse INT)

Insert into CourseDuration (DurationCategory, TotalCourse)
SELECT 
    CASE 
        WHEN Duration_to_complete_Approx <= 10 THEN 'Short'
        WHEN Duration_to_complete_Approx > 10 AND Duration_to_complete_Approx <= 20 THEN 'Medium'
        ELSE 'Long'
    END AS DurationCategory,
    COUNT(*) AS TotalCourse
FROM dbo.[CourseraDataset-Clean]
GROUP BY 
    CASE 
        WHEN Duration_to_complete_Approx <= 10 THEN 'Short'
        WHEN Duration_to_complete_Approx > 10 AND Duration_to_complete_Approx <= 20 THEN 'Medium'
        ELSE 'Long'
    END;

--Keyword Analysis--
CREATE TABLE KeywordAnalysis (
    Keyword VARCHAR(100),
    TotalReviews INT,
	Frequency INT)

Insert into KeywordAnalysis(Keyword,TotalReviews,Frequency )

SELECT 
    Keyword,
	SUM(Number_of_Review) AS TotalReviews,
    COUNT(*) AS Frequency,
FROM dbo.[CourseraDataset-Clean]
GROUP BY Keyword
ORDER BY TotalReviews DESC;

--Institution Analysis--
CREATE TABLE InstitutionAnalysis (
    Offered_By VARCHAR(MAX),
    AverageRating DECIMAL,
	TotalCourse INT);

Insert into InstitutionAnalysis (Offered_By,AverageRating,TotalCourse)

SELECT TOP 10 Offered_By,
	ROUND(AVG(Rating),2) AS AverageRating, 
	COUNT(*) AS TotalCourse
FROM dbo.[CourseraDataset-Clean]
GROUP BY Offered_By
ORDER BY 3 DESC;

--Most Teached Skills in Coursera--
CREATE TABLE SkillsAnalysis (
    Skill VARCHAR(100),
    TotalCourse INT)

SELECT TOP 10
    TRIM(value) AS Skill,
    COUNT(*) AS TotalCourse
FROM (
    SELECT 
        value
    FROM dbo.[CourseraDataset-Clean]
    CROSS APPLY STRING_SPLIT(Skill_gain, ',')
) AS SkillList
WHERE TRIM(value) <> 'Not specified'
GROUP BY TRIM(value)
ORDER BY TotalCourse DESC;
