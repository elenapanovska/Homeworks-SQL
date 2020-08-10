USE [SEDCHome]
GO

--Homework requirement 1/6

select * from dbo.Student where FirstName = 'Antonio'
select *  from dbo.Student where DateOfBirth > '1999-01-01'
select * from dbo.Student where Gender = 'M'
select * from dbo.Student where LastName like 'T%'
select * from dbo.Student where EnrolledDate >= '1998-01-01' and EnrolledDate <= '1998-01-31'
select * from dbo.Student where LastName like 'J%' and EnrolledDate >= '1998-01-01' and EnrolledDate <= '1998-01-31'

--Homework requirement 2/6

select * from dbo.Student 
where FirstName = 'Antonio'
order by LastName ASC

select * from dbo.Student
order by FirstName ASC

select * from dbo.Student 
where Gender = 'M'
order by EnrolledDate DESC


--Homework requirement 3/6

select FirstName  from dbo.Teacher 
Union All
select FirstName from dbo.Student 

select LastName  from dbo.Teacher 
Union
select LastName from dbo.Student 

select FirstNAme from dbo.Teacher
Intersect
select FirstName from dbo.Student 


--Homework requirement 4/6

alter table GradeDetails
add constraint Df_Achievment_Max_Points
Default 100 for [AchievementMaxPoints]
GO

alter table GradeDetails With Check
add constraint Chk_AchievementPoints
Check (AchievementPoints <= AchievementMaxPoints);
GO

alter table AchievementType With Check
add constraint Uc_Name Unique (Name)
GO


--Homework requirement 5/6
--Created from diagram


--Homework requirement 6/6

select c.Name as CourseName, a.Name as AchievmentTypeName
from dbo.Course c
cross join dbo.AchievementType a
GO

select Distinct t.*
from dbo.Grade g
inner join dbo.Teacher t on t.ID = g.TeacherID
GO

select t.*
from dbo.Teacher t
left join dbo.Grade g on g.TeacherID = t.ID
where g.TeacherID is null
GO

select s.*
from dbo.Grade g
right join dbo.Student s on g.StudentID = s.ID
where g.StudentID is null
GO
