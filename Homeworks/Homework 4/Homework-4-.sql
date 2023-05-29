CREATE VIEW vv_StudentGrades
AS
SELECT StudentId, COUNT(Grade) as GradesPerStudent
FROM Grade
GROUP BY StudentId
GO


ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName, s.LastName, COUNT(Grade) as GradesPerStudent
from Student s
INNER JOIN Grade g
ON g.StudentId = s.Id
GROUP BY s.FirstName,s.LastName
GO

SELECT * 
FROM vv_StudentGrades
ORDER BY GradesPerStudent DESC 

DECLARE @FirstName NVARCHAR (100)
SET @FirstName = 'Antonio'

Select * 
FROM Student
WHERE FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
-- Fill the table variable with all Female students

DECLARE @STUDENTS TABLE
(StudentId int,StudentName nvarchar(100), DateOfBirth date)

INSERT INTO @STUDENTS(StudentId,StudentName,DateOfBirth)
VALUES(25,'Petar Bozinoski','2001-07-21')

Select ID, FirstName,DateOfBirth
FROM Student
WHERE Gender = 'F'

Select *
From @STUDENTS


CREATE TABLE #MaleEmployeeList(LastName nvarchar(100),EnrolledDate date)

INSERT INTO #MaleEmployeeList

select LastName, EnrolledDate
FROM Student
Where Gender = 'M' and FirstName like 'A%'

select *
FROM #MaleEmployeeList
Where Len(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same

CREATE TABLE #TeacherNameList(FirstName nvarchar(100), LastName nvarchar(100))

INSERT INTO #TeacherNameList

SELECT FirstName, LastName
FROM Teacher
WHERE SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3) and LEN(FirstName) < 5

SELECT * 
FROM #TeacherNameList

