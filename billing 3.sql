with repeat_customers as (
    select profile_id                                                   as "Evergreen ID",
           order_prescription_id as "P2U Order Ref",
           orderreferencenumber,
           row_number() over
               (partition by profile_id order by status_date::date asc) as "Repeat Order Count"
    from t_order_prescription_status
    where status_value = 'RECEIVED'
    and (CAST(status_date as date)) >= '2020-02-01'
    and (CAST(status_date as date)) < '2020-04-01'
    group by profile_id, order_prescription_id ,orderreferencenumber, status_date
)
select repeat_customers."Evergreen ID",repeat_customers."P2U Order Ref",repeat_customers."Repeat Order Count", count(items_id) as "No of Items"
--into p2u_repeat_billed
from repeat_customers
join t_order_prescription on repeat_customers.orderreferencenumber = t_order_prescription.orderreferencenumber
where repeat_customers."Repeat Order Count" >= 3
--and repeat_customers.orderreferencenumber not in (select orderreferencenumber from p2u_repeat_billed)
group by "Evergreen ID", repeat_customers."P2U Order Ref", repeat_customers.orderreferencenumber,repeat_customers."Repeat Order Count"




