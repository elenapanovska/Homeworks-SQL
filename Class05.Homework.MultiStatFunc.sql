--Class 05 Homework

select 
	s.FirstName as StudentFirstName, s.LastName as StudentLastName, g.Grade as Grade, g.CreatedDate 
from
	dbo.Grade as g
	inner join dbo.Student s on g.StudentID = s.ID
	inner join dbo.Teacher t on g.TeacherID = t.ID
	inner join dbo.Course c on g.CourseID = c.ID
	inner join dbo.GradeDetails gd on g.ID = gd.GradeID
where gd.AchievementTypeID = 5
GO


create function dbo.fn_ListOfStudents(@TeacherID int, @CourseID int)
returns @Students table (StudentFirstName nvarchar(100), StudentLastName nvarchar(100), Grade int, CreadtedDate date)
as 
begin
	insert into @Students 
	select 
		s.FirstName as StudentFirstName, s.LastName as StudentLastName, g.Grade as Grade, g.CreatedDate 
	from
		dbo.Grade as g
		inner join dbo.Student s on g.StudentID = s.ID
		inner join dbo.Teacher t on g.TeacherID = t.ID
		inner join dbo.Course c on g.CourseID = c.ID
		inner join dbo.GradeDetails gd on g.ID = gd.GradeID
	where gd.AchievementTypeID = 5 and t.ID = @TeacherID and c.ID = @CourseID
	return
end
GO

select * from dbo.fn_ListOfStudents(9,9)

