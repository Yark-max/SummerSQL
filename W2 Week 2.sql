Select TRANSACTION_ID, IBAN
from
(SelecT *,  REPLACE(sort_code, '-', '') as sortcode , CONCAT('GB', check_digits, swift_code, sortcode, to_varchar(account_number)) as IBAN
from TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK02_TRANSACTIONS as TRS
join TIL_PLAYGROUND.PREPPIN_DATA_INPUTS.PD2023_WK02_SWIFT_CODES as Swift
on TRS.BANK=Swift.BANK)