CREATE DATABASE SEDCACADEMYDB



CREATE TABLE Student(
Id int identity(1,1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date null,
EnrolledDate date not null,
Gender nchar(1) not null,
NationalIdNumber nvarchar(30) not null,
StudentCardNumber nvarchar(20) not null
)

CREATE TABLE Teacher(
Id int identity(1,1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date null,
AcademicRank nvarchar(30) not null,
HireDate date not null
)
CREATE TABLE Grade(
Id int identity(1,1) not null,
StudentId int not null,
CourseId int  not null,
TeacherId int  not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate date not null
)

CREATE TABLE Courses(
Id int identity(1,1) not null,
[Name] nvarchar(100) not null,
Credit nvarchar (10) not null,
AcademicYear smallint not null,
Semester nvarchar(5) not null
)

CREATE TABLE AchievementType(
Id int identity(1,1) not null,
[Name] nvarchar (100) not null,
[Description] nvarchar(max) null,
ParticipationRate tinyint not null
)

CREATE TABLE GradeDetails(
Id int identity(1,1) not null,
GradeID int not null,
AchievementTypeID int not null,
AchievementPoints int not null,
AchievementMaxPoints int not null,
AchievementDate date null
)
