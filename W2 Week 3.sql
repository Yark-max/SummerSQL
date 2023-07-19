With CTE as (Select   CONCAT('Q',TO_VARCHAR( Quarter(TO_DATE( transaction_date, 'dd/mm/yyyy hh:mi:ss')))) as Quart,
sum(VALUE) as VALUE,
Case (ONLINE_OR_IN_PERSON)
When 1 then 'Online'
when 2 then 'In-Person'
end as Online_Inperson
from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK01 as TR
Where TRANSACTION_CODE like 'DSB%'
Group by Online_Inperson, Quart)
 SELECT online_or_in_person,Quarter, Value, Targets, Value-Targets as Variance_to_Target
    FROM TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK03_TARGETS As TAR
    UNPIVOT (Targets FOR Quarter IN (Q1, Q2, Q3, Q4))
    join CTE 
    on TAR.online_or_in_person=CTE.Online_Inperson
    and to_varchar(TAR.Quarter)=to_varchar(CTE.Quart)