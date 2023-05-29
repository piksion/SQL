
-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name AS CoursesName, a.Name AS AchivementName
FROM Courses C
CROSS JOIN AchievementType a

--List all Teachers without exam Grade

SELECT t.FirstName, t.LastName
FROM Teacher t
LEFT JOIN Grade g
on t.Id = g.TeacherId
WHERE g.TeacherId IS NULL

--Calculate the count of all grades per Teacher in the system
SELECT TeacherID, COUNT(Grade) as TotalCount
FROM Grade
GROUP BY TeacherId

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT TeacherId,COUNT(GRADE) GradesFor100Students
FROM Grade
WHERE StudentId < 100
GROUP BY TeacherId

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentId, MAX(Grade) as MaxGrade, AVG(Grade) as AVGGrade
FROM Grade g
GROUP BY StudentId

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT TeacherID, SUM(Grade) as TotalGrade
FROM Grade
GROUP BY TeacherID
HAVING COUNT(Grade) > 200

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade]
SELECT StudentId,COUNT(GRADE) AS GradeCount,MAX(GRADE)AS MaxGrade,AVG(GRADE) AS AvgGrade
FROM Grade
GROUP BY StudentId
HAVING MAX(Grade) = AVG(GRADE)

--List Student First Name and Last Name next to the other details from previous query
SELECT StudentId, S.FirstName as FirstName,S.LastName as LastName, COUNT(Grade) as GradeCount, MAX(Grade) as MaxGrade, AVG(Grade) as AvgGrade
FROM Grade g
INNER JOIN Student s
on s.Id = G.StudentId
Group by StudentId, s.FirstName, s.LastName
HAVING MAX(Grade) = AVG(Grade)