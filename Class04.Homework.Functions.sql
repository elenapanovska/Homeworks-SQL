USE [SEDCHome]
GO

-- Class04 homework

--Homework requirement 1/2
--Declare scalar variable for storing FirstName values
	--Assign value ‘Antonio’ to the FirstName variable
	--Find all Students having FirstName same as the variable


declare @FirstName nvarchar(20)
set @FirstName = 'Antonio' 

select * 
from 
	dbo.Student s
where s.FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
	--Fill the table variable with all Female students

declare @Students table
(
	StudnetId int,
	StudentName nvarchar(50),
	DateOfBirth date
)

insert into @Students
select 
	s.ID, s.FirstName, s.DateOfBirth
from
	dbo.Student s
where s.Gender = 'F'

select * from @Students
GO

--Declare temp table that will contain LastName and EnrolledDate columns
	--Fill the temp table with all Male students having First Name starting with ‘A’
	--Retrieve the students from the table which last name is with 7 characters

create table #TempTable 
(
	LastName nvarchar(50),
	EnrolledDate date,
)

insert into #TempTable
select
	s.LastName, s.EnrolledDate
from dbo.Student s
where s.FirstName like 'A%' and s.Gender = 'M'

select * from #TempTable

select *
from #TempTable t
where  len(t.LastName) = 7

--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same

select *
from dbo.Teacher t
where len(t.FirstName) < 5 and left(t.FirstName, 3) = left(t.LastName,3)
GO

--Homework requirement 2/2

--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
--StudentCardNumber without “sc-”
--“ – “
--First character of student FirstName
--“.”
--Student LastName

create function fn_FormatStudentName (@StudentId int)
returns nvarchar(50)
as
begin
declare @Result nvarchar(50)
select  @Result = substring(s.StudentCardNumber,4, len(s.StudentCardNumber)) + '-' + left(s.FirstName,1) + '.' + s.LastName
from dbo.Student s
where ID = @StudentId
return @Result
end
GO

select dbo.fn_FormatStudentName(2) as  FuncOutput

select *, dbo.fn_FormatStudentName(Student.ID) as FuncOutput
from dbo.Student
GO
