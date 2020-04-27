


select profile_id as "Evergreen ID",
count(profile_id)    as "Order Count",
listagg(orderreferencenumber,',')
within group (order by orderreferencenumber) as "P2U Order Refs"
from t_order_prescription_status
group by profile_id
having count(profile_id) >1
order by profile_id;