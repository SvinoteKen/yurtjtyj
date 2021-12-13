/*2*/
SET DATEFIRST 1
SELECT @@DATEFIRST
GO;
/*6*/
DECLARE @Perem1 CHAR(30), @Perem2 NUMERIC(10,3)
SELECT @Perem1, @Perem2
GO;
/*12*/
USE TRAVEL
DECLARE @A1 int SET @A1 = (SELECT COUNT(*) FROM COMPANY)
SELECT @A1
GO;
/*16*/
SET DATEFORMAT dmy
DECLARE @Date1 DateTime
SET @Date1 = '31.12.2016 13:23:15'
SELECT @Date1
GO;

/*22*/
DECLARE @TEMP table
(
	someDate datetime,
	someInt bigint,
	someChar nvarchar(max)

)
insert into @temp values ('14.11.2021 13:23:15',454646,'Hello'),('04.05.2021 20:11:45',47879452,'World')
SELECT * FROM @temp
GO;
/*26*/
DECLARE @P1 NUMERIC(5,2),@P2 VARCHAR(20), @P3 DATETIME, @P4 FLOAT, @P5 CHAR(20), @P6 BIGINT
SET @P1 = 10.5
SET @P2 = 'Hello'
SET @P3 = '14.11.2021 16:28:45'
SET @P4 = CAST(@P1 AS FLOAT)
SET @P5 = CAST(@P2 AS CHAR(20))
SET @P6 = CAST(@P3 AS BIGINT)
SELECT @P4, @P5,@P6
GO;
/*32*/
USE TRAVEL
DECLARE @С int SET @С = (SELECT COUNT(*) FROM HOTEL_CATEGORY)
WHILE (SELECT COUNT(*) FROM HOTEL_CATEGORY) < 15
BEGIN
	insert into HOTEL_CATEGORY values('1')
END
/*36*/
USE TRAVEL
DECLARE @CURSOR CURSOR
DECLARE @N CHAR(20), @C INT, @CAT CHAR(20)
/*Заполняем курсор*/
SET @CURSOR  = CURSOR SCROLL FOR
SELECT HOTEL.HOTEL_NAME, HOTEL.COUNTRY_ID, HOTEL_CATEGORY.CATEGORY
FROM  HOTEL_CATEGORY JOIN HOTEL ON HOTEL_CATEGORY.ID = HOTEL.HOTELCATEGORY_ID
WHERE HOTEL.HOTELCATEGORY_ID = 1
/*Открываем курсор*/
OPEN @CURSOR
FETCH FIRST FROM @CURSOR INTO @N, @C, @CAT
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM @CURSOR INTO @N, @C, @CAT
PRINT @N
PRINT @C
PRINT @CAT
END
CLOSE @CURSOR
DEALLOCATE @CURSOR
/*42*/
declare @test varchar(100) , @count int, @test2 varchar(100)
set @test = 'this   is  a    test'
set @test2 = @test
while charindex('  ',@test  ) > 0
begin
   set @test = replace(@test, '  ', ' ')
end
SET @count = len(@test2)- LEN(@test)
select @test, @count
/*46*/
DECLARE @SSS varchar(10) SET @SSS = ' .,!?:;'
DECLARE @Text varchar(1024)
DECLARE @ChangesCnt int
SET @ChangesCnt= 0 
SET @Text = 'В этом тексте.нужно  ,убрать пробелы,до знаков препинания!и вставить их после ?'
DECLARE @I int SET @I = 1
DECLARE @J int
 
WHILE @I <= LEN(@SSS) BEGIN 
  -- убираем лишние пробелы. В первой итерации несколько пробелов заменятся одним
  SET @J = 1
  WHILE @J > 0 BEGIN  
    SET @J = CHARINDEX(' ' + SUBSTRING(@SSS, @I, 1), @Text, @J)
    IF @J > 0 BEGIN
      SET @ChangesCnt = @ChangesCnt + 1
      SET @Text = SUBSTRING(@Text, 1, @J - 1) + SUBSTRING(@Text, @J + 1, LEN(@Text))    
    END
  END
  SET @I = @I + 1
END
 
SET @I = 2 --исключая пробел
WHILE @I <= LEN(@SSS) BEGIN 
  -- вставляем пробел, если его нет.
  SET @J = 1
  WHILE @J > 0 AND @J < LEN(@Text) BEGIN  
    SET @J = CHARINDEX(SUBSTRING(@SSS, @I, 1), @Text, @J)
    IF @J > 1 AND @J < LEN(@Text) AND Substring(@Text, @J + 1, 1) <> ' ' BEGIN
      SET @ChangesCnt = @ChangesCnt + 1
      SET @Text = SUBSTRING(@Text, 1, @J) + ' ' + SUBSTRING(@Text, @J + 1, LEN(@Text))  
      SET @J = @J + 1   
    END
    
  END
  SET @I = @I + 1
END
 
SELECT @ChangesCnt, @Text
/*52*/
DECLARE @txt nvarchar(MAX),@newtxt nvarchar(MAX), @space int, @first nvarchar(MAX), @last nvarchar(MAX), @I2 int
SET @txt = 'Поменять местами первое и последнее слова'
SET @I2 = len(@txt)
DECLARE @F INT, @L INT
SET @F = CHARINDEX(' ', @txt)
SET @first = SUBSTRING(@txt,0,@F)
SET @L = 0
WHILE @I2 >=1 BEGIN 
	SET @L = @L+1
	SET @I2= @I2-1
	IF SUBSTRING(@txt,@I2,1) = ' '
	BEGIN
		SET @last = SUBSTRING(@txt,@I2+1,@L)
		BREAK
	END
END
SET @newtxt = @last + SUBSTRING(@txt,@F,@I2-@F+1) + @first

SELECT @txt, @newtxt

/*56*/
use Car
DECLARE @y bigint, @num int, @a int, @In int
SET @num = 1
SET @a = 2
SET @y = 0
WHILE @num<11
BEGIN
SET @In =(SELECT F FROM Exp WHERE C = @num)
SET @y = @y+@In*@a
SET @num = @num+1
END
SELECT @y
/*62*/
	
PRINT DATENAME(M, CURRENT_TIMESTAMP) + ' ' + CONVERT(VARCHAR, CURRENT_TIMESTAMP, 14)
DECLARE @h int, @date2 date
SET @date2 = '12.03.2000'
SET @h = 0
DECLARE @TEMP2 table
(
	someDate2 date
)
while @h<5
begin
insert into @TEMP2 values (@date2)
SET @h = @h + 1
end
select someDate2 from @TEMP2