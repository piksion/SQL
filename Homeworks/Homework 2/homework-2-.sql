use SEDCACADEMYDB;

--Find all Students with FirstName = Antonio
SELECT *
FROM dbo.Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM dbo.Student
WHERE DateOfBirth >= '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * 
FROM dbo.Student
WHERE LastName like 'J%' and EnrolledDate >= '1998-01-01' and EnrolledDate <='1998-01-31'

--List all Students ordered by FirstName
SELECT *
FROM dbo.Student
ORDER BY FirstName

--List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates

SELECT LastName
FROM dbo.Student
UNION 
SELECT LastName
FROM dbo.Teacher

--Create Foreign key constraints as needed
ALTER TABLE dbo.AchievementType
ADD PRIMARY KEY (Id)

ALTER TABLE dbo.Courses
ADD PRIMARY KEY (Id)

ALTER TABLE dbo.Grade
ADD PRIMARY KEY (Id)

ALTER TABLE dbo.GradeDetails
ADD PRIMARY KEY (Id)

ALTER TABLE dbo.Student
ADD PRIMARY KEY (Id)

ALTER TABLE dbo.Teacher
ADD PRIMARY KEY (Id)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID)
REFERENCES AchievementType (ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Courses
FOREIGN KEY (CourseID)
REFERENCES Course (ID)

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID)
REFERENCES Grade (ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES Student (ID)

ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID)
REFERENCES Teacher (ID)


