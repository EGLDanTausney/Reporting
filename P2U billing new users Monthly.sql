select distinct profile_id as "Evergreen ID",
       count(profile_id) as "Order Count",
       listaggdistinct(order_prescription_id, ',')
       within group (order by order_prescription_id) as "P2U Order Refs",
       listagg((CAST(status_date as date)), ',')
       within group (order by order_prescription_id) as "Order Dates"
--into p2u_new_billed
from t_order_prescription_status
where status_value = 'RECEIVED'
--  and (CAST(status_date as date)) >= '2020-04-01'
--  and (CAST(status_date as date)) < '2020-04-30'
  and "Evergreen ID" not in (select distinct "evergreen id" from p2u_new_billed)
group by profile_id
having count(profile_id) =2
order by "Order Count" desc



/* first time orders
select distinct profile_id as "Evergreen ID",
       count(profile_id) as "Order Count",
       listaggdistinct(order_prescription_id, ',')
       within group (order by order_prescription_id) as "P2U Order Refs",
       listagg((CAST(status_date as date)), ',')
       within group (order by order_prescription_id) as "Order Dates"
--into p2u_new_billed
from t_order_prescription_status
where status_value = 'RECEIVED'
--  and (CAST(status_date as date)) >= '2020-04-01'
--  and (CAST(status_date as date)) < '2020-04-30'
  and "Evergreen ID" not in (select distinct "evergreen id" from p2u_new_billed)
group by profile_id
having count(profile_id) =1
order by "Order Count" desc
*/