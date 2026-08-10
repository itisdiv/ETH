{{ config(group = 'fraud_risk', access='private') }}
select
*
from {{ ref('int_transactions_enriched')}}

where from_address in ('0xf756cfd84c157fb0beb2b381ffc5d639e4577096', '0x80d04079ffc53eb14edbeeb37279d126f45552df')