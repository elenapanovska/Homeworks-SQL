--Class06 Homework

--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details)
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)

create or alter procedure dbo.usp_CreateGrade(@StudentId int, @CourseId smallint, @TeacherId smallint, @Grade tinyint, @Comment nvarchar(100), @CreatedDate datetime)
as
begin
	insert into dbo.Grade(StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
	values (@StudentId, @CourseId, @TeacherId, @Grade, @Comment, @CreatedDate)

	select count(*) as TotalGrades
	from dbo.Grade
	where StudentId = @StudentId

	select max(g.Grade) as MaxGrade
	from dbo.Grade as g
	where StudentId = @StudentId and TeacherId = @TeacherId

end
GO

delete from dbo.Grade where Id = 20130


exec dbo.usp_CreateGrade
	@StudentId = 4, 
	@CourseId = 3, 
	@TeacherId = 2, 
	@Grade = 10,
	@Comment = 'Test', 
	@CreatedDate = '2020.08.21'
GO

select * from dbo.Grade order by id  desc
GO

--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

create or alter procedure dbo.usp_CreateGradeDetails
(@GradeId int, @AchievmentTypeId tinyint, @AchievementPoint tinyint, @AchievmentMaxPoints tinyInt, @AchievmentDate date)
as
begin
	insert into dbo.GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
	values(@GradeId, @AchievmentTypeId, @AchievementPoint, @AchievmentMaxPoints, @AchievmentDate)

	select sum(cast(gd.AchievementPoints as decimal(5,2)) / cast(gd.AchievementMaxPoints as decimal(5,2)) * a.ParticipationRate) as GradePoints
	from 
		dbo.GradeDetails gd 
		inner join 
		dbo.AchievementType a on gd.AchievementTypeID = a.Id
	where gd.GradeID = @GradeId

end

exec dbo.usp_CreateGradeDetails
	@GradeId = 20131,
	@AchievmentTypeId = 4,
	@AchievementPoint = 75, 
	@AchievmentMaxPoints = 100,
	@AchievmentDate = '2020-10-07'

exec dbo.usp_CreateGradeDetails
	@GradeId = 20131,
	@AchievmentTypeId = 2,
	@AchievementPoint = 90, 
	@AchievmentMaxPoints = 100,
	@AchievmentDate = '2020-10-09'

exec dbo.usp_CreateGradeDetails
	@GradeId = 20131,
	@AchievmentTypeId = 1,
	@AchievementPoint = 64, 
	@AchievmentMaxPoints = 100,
	@AchievmentDate = '2020-10-11'

select * from dbo.GradeDetails order by id desc

