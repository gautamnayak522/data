USE myDB

SELECT 6/4
SELECT 6/0

SELECT 7.0/3.0
SELECT DATEPART(DAY,GETDATE())
SELECT ROUND(5.0/6.0,2) 


BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO



DECLARE @Number INT,
	@Result INT
BEGIN TRY
    PRINT N'This Message is From Start of the TRY BLOCK'
    SET @Number = 255;
    PRINT N'Value Stored in @Number Variable = ' + CAST(@Number AS VARCHAR)
    SET @Result = @Number + 1;
	PRINT N'Value add 1 in @Number Variable result = ' + CAST(@result AS VARCHAR)
	SET @Result = @Result / 1;
	PRINT N'Value divide by 1 in @result Variable = ' + CAST(@result AS VARCHAR)

	--generating error
	SET @Result = @Result / 0;
	PRINT N'Value divide by 0 in @result Variable = ' + CAST(@result AS VARCHAR)
    
	PRINT N'This Message is From End of the TRY BLOCK'

		SELECT @Number AS Number,	
       @Result AS Result;
END TRY

BEGIN CATCH
    PRINT N'This Message is From Start of the CATCH BLOCK'
    PRINT N'Error Message = ' + ERROR_MESSAGE()
    PRINT N'Error Number = ' + CAST(ERROR_NUMBER() AS VARCHAR)
    PRINT N'Error Line = ' + CAST(ERROR_LINE() AS VARCHAR)
    PRINT N'This Message is From End of the CATCH BLOCK'
END CATCH