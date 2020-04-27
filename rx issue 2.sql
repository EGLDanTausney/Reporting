SELECT distinct display
            FROM t_medication
where profile_id in (select profile_id from t_contact_users)
order by display

select * from t_contact_users


select distinct from 