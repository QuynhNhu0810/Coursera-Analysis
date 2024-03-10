**COURSERA DATASET**: https://www.kaggle.com/datasets/elvinrustam/coursera-dataset/data

- The Coursera dataset contains information regarding various courses available on the Coursera platform. Each row represents a different course and its attributes including title, rating, level, schedule, learning objectives, instructor details, offering institution, keywords, course URL, duration to complete, and the number of reviews.
- I use SQL for querying and Power BI for visualization.

**DATA CLEANING STEPS**
- Some of the course titles in the dataset are in the wrong format, so I exclude courses with characters "???"
- Check for mising values on Course_Title and Rating
- Remove duplicate rows

**MAIN CONCLUSION**

![image](https://github.com/QuynhNhu0810/Coursera-Analysis/assets/144129608/39b1657f-7cc6-4388-b608-5a04f7d66a51)

The majority of courses fall into the Beginner level category, indicating a high demand for introductory courses.

![image](https://github.com/QuynhNhu0810/Coursera-Analysis/assets/144129608/728fe5ec-f0f9-403a-aff5-a2346d196d63)

I categorize the courses based on their duration: Courses longer than 20 hours is considered Long, and less than 10 is Short. We can see that long courses are the most common on the platform, followed by Medium.

![image](https://github.com/QuynhNhu0810/Coursera-Analysis/assets/144129608/c1a768b8-ba56-4d6a-a688-55ad0c267e56)

I want to know what are the most teached skills on Coursera. Some of the most common skills are: Data Analysis, Python Programming, Machine Learning...

![image](https://github.com/QuynhNhu0810/Coursera-Analysis/assets/144129608/1ff0ca15-506d-443c-96b9-631ce107cc36)

I want to analyse the keywords associated with the courses by total reviews. Data Science and Computer Science received the most reviews.

![image](https://github.com/QuynhNhu0810/Coursera-Analysis/assets/144129608/7848bf57-17b2-4d4b-b483-daf04c2047d0)

Here's the top 10 institutions offering the most courses and their average rating. University of Colorado has more than 200 courses on the platform. But Google received the highest average rating from learners.



