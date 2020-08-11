USE [SEDCHome]

--Class03 Homework

--Homework requirement 1/3

--Calculate the count of all grades in the system
select 
	count(g.ID) as AllGrades
from dbo.Grade as g
GO

--Calculate the count of all grades per Teacher in the system
select 
	count(g.Id) as TotalGrades, t.ID as Teacher
from 
	dbo.Grade as g 
	inner join dbo.Teacher t on g.TeacherID = t.ID
group by t.ID
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
select 
	count(g.Id) as TotalGrades, t.ID as Teacher
from 
	dbo.Grade as g
	inner join dbo.Teacher t on g.TeacherID = t.ID
where g.StudentID < 100
group by t.ID
GO


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
select s.ID as StudentId, max(g.Grade) as MaxGrade, avg(g.Grade) as AveregeGrade
from
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
group by s.ID
GO


--Homework requirement 2/3

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
select 
	count(g.Id) as TotalGrades, t.ID as TeacherId
from 
	dbo.Grade as g 
	inner join dbo.Teacher t on g.TeacherID = t.ID
group by t.ID
having count(g.Id) > 200
GO


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
select t.ID as TeacherId, count(g.Id) as TotalGrades
from 
	dbo.Grade as g
	inner join dbo.Teacher t on g.TeacherID = t.ID
where g.StudentID < 100
group by t.ID
having count(g.Id) > 50
GO


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
select s.ID as Student, max(g.Grade) as MaxGrade, avg(g.Grade) as AverageGrade, count(g.Id) as TotalGrades
from
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
group by s.ID
having max(g.Grade) = avg(g.Grade)
GO


--List Student First Name and Last Name next to the other details from previous query
select s.ID as StudentId, FirstName + s.LastName as Student, max(g.Grade) as MaxGrade, avg(g.Grade) as AverageGrade, count(g.Id) as TotalGrades
from
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
group by s.ID, s.FirstName + s.LastName
having max(g.Grade) = avg(g.Grade)
GO

--Homework requirement 3/3
--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
create view vv_StudentGrades
as
select s.ID as StudentId, count(g.Id) as TotalGrades
from 
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
group by s.ID
GO

select * from vv_StudentGrades
GO


--Change the view to show Student First and Last Names instead of StudentID
alter view vv_StudentGrades
as
select s.FirstName, s.LastName, count(g.Id) as TotalGrades
from 
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
group by s.ID, s.FirstName, s.LastName
GO

select * from vv_StudentGrades
GO


--List all rows from view ordered by biggest Grade Count
select * 
from
	vv_StudentGrades
order by TotalGrades DESC
GO


--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)
create view vv_StudentGradeDetails
as
select s.FirstName, s.LastName, count(gd.AchievementTypeID) as CourssesCount
from
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
	inner join dbo.GradeDetails gd on g.ID = gd.GradeID
	inner join dbo.AchievementType acT on gd.AchievementTypeID = acT.ID
	where gd.AchievementTypeID = 5
group by s.ID, s.FirstName, s.LastName
GO

select * from vv_StudentGradeDetails
GO
