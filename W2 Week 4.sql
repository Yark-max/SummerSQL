With CTE as (
Select *,  '04/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_APRIL
Union all
Select *, '08/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_AUGUST 
Union all
Select *, '12/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_DECEMBER
Union all
Select * , '02/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_FEBRUARY
Union all
Select * , '01/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_JANUARY
Union all
Select *  , '07/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_JULY
Union all
Select * , '06/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_JUNE
Union all
Select *  , '03/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_MARCH
Union all
Select * , '05/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_MAY
Union all
Select * , '11/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_NOVEMBER
Union all
Select * , '10/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_OCTOBER
Union all
Select * , '09/2023' as Month from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK04_SEPTEMBER)

Select ID, "'Ethnicity'" as Ethnicity, To_Date ("'Date of Birth'", 'mm/dd/yyyy') as Date_of_Birth,"'Account Type'" as Account_Type,
TO_DATE((concat(to_varchar(joining_day), '/', Month)),'dd/mm/yyyy')  as J_Day,
ROW_NUMBER() OVER (PARTITION BY  ID, Ethnicity,Account_Type, Date_of_Birth  ORDER BY J_Day) AS Rownumber
From CTE
PIVOT(MAX(Value) FOR Demographic IN ('Date of Birth', 'Ethnicity', 'Account Type'))
QUALIFY Rownumber = 1

