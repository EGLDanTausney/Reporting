select profile_id                                   as "Evergreen ID",
       count(profile_id)                            as "Order Count",
       listaggdistinct(orderreferencenumber, ',')
       within group (order by orderreferencenumber) as "P2U Order Refs",
       listagg((CAST(status_date as date)), ',')
       within group (order by orderreferencenumber) as "Order Dates"
from t_order_prescription_status
where status_value = 'RECEIVED'
  and (CAST(status_date as date)) > '2020-04-03'
 -- and (CAST(status_date as date)) < '2020-04-01'
group by profile_id
--having count(profile_id) > 2
order by profile_id



select * from t_medication


select * from t_order_prescription_status order by status_date desc

select * from t_order_prescription

