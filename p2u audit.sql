select * from t_order_prescription_status
where profile_id =
'5b9cc3d8781b840ee37aba54'

select * from r_allusers where profile_id =
'59195dacb3992f037b600a67'

select *
  from reporting.t_contact_users where profile_id =
'59195dacb3992f037b600a67'

select * from t_user where user_id = '5c9bae135bcf756953ca340b'

select *
from reporting.t_prescription_request
--where modifieddate>'2020-01-01'
where profile_id =
'5b9cc3d8781b840ee37aba54'
order by modifieddate desc