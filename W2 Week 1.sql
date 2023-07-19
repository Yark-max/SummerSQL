-- 1st output
SElECT Bank, sum(VALUE) as VALUE
FROM
(SELECT *,  split_part(TRANSACTION_CODE, '-', 1) as Bank, 
CONCAT(split_part(TRANSACTION_CODE, '-', 2), split_part(TRANSACTION_CODE, '-', 3), split_part(TRANSACTION_CODE, '-', 4)) as T_CODE,
Case (online_or_in_person) 
when 1 then 'Online'
when 2 then 'In-Person'
end
as Online_Inperson, 
--TO_DATE( transaction_date, 'dd/mm/yyyy hh:mi:ss' )
(DATE(split_part(transaction_date, ' ', 1), 'dd/mm/yyyy'))as Date, 
Dayname( Date) As Weekday
from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK01 
)
group by Bank;

-- 2nd output
SElECT Bank, Online_Inperson, Weekday, sum(VALUE) as VALUE
FROM
(SELECT *,  split_part(TRANSACTION_CODE, '-', 1) as Bank, 
CONCAT(split_part(TRANSACTION_CODE, '-', 2), split_part(TRANSACTION_CODE, '-', 3), split_part(TRANSACTION_CODE, '-', 4)) as T_CODE,
Case (online_or_in_person) 
when 1 then 'Online'
when 2 then 'In-Person'
end
as Online_Inperson, 
--TO_DATE( transaction_date, 'dd/mm/yyyy hh:mi:ss' )
(DATE(split_part(transaction_date, ' ', 1), 'dd/mm/yyyy'))as Date, 
Dayname( Date) As Weekday
from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK01 
)
group by Bank, Online_Inperson, Weekday;

-- 3rd output
SElECT Bank, customer_code,  sum(VALUE) as VALUE
FROM
(SELECT *,  split_part(TRANSACTION_CODE, '-', 1) as Bank, 
CONCAT(split_part(TRANSACTION_CODE, '-', 2), split_part(TRANSACTION_CODE, '-', 3), split_part(TRANSACTION_CODE, '-', 4)) as T_CODE,
Case (online_or_in_person) 
when 1 then 'Online'
when 2 then 'In-Person'
end
as Online_Inperson, 
--TO_DATE( transaction_date, 'dd/mm/yyyy hh:mi:ss' )
(DATE(split_part(transaction_date, ' ', 1), 'dd/mm/yyyy'))as Date, 
Dayname( Date) As Weekday
from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK01 
)
group by Bank, customer_code;