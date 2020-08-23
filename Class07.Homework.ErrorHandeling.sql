USE [SEDCHome]
GO

--Class07 Homework

--Add error handling on CreateGradeDetail procedure
--Test the error handling by inserting not-existing values for AchievementTypeID

create or alter procedure dbo.usp_CreateGradeDetails
(@GradeId int, @AchievmentTypeId tinyint, @AchievementPoint tinyint, @AchievmentMaxPoints tinyInt, @AchievmentDate date)
as
begin
	begin try
	insert into dbo.GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
	values(@GradeId, @AchievmentTypeId, @AchievementPoint, @AchievmentMaxPoints, @AchievmentDate)

	select sum(cast(gd.AchievementPoints as decimal(5,2)) / cast(gd.AchievementMaxPoints as decimal(5,2)) * a.ParticipationRate) as GradePoints
	from 
		dbo.GradeDetails gd 
		inner join 
		dbo.AchievementType a on gd.AchievementTypeID = a.Id
	where gd.GradeID = @GradeId
	end try
	begin catch
		select 
			ERROR_NUMBER() as ErrorNumber,
			ERROR_LINE() as ErrorLine,
			ERROR_STATE() as ErrosState,
			ERROR_MESSAGE() as ErrorMessage,
			ERROR_PROCEDURE() as ErrorProcedure
	end catch
end

exec dbo.usp_CreateGradeDetails
	@GradeId = 20131,
	@AchievmentTypeId = 9,
	@AchievementPoint = 75, 
	@AchievmentMaxPoints = 100,
	@AchievmentDate = '2020-10-07'