select *
from t_wellnessscore_sections
join t_user on t_user.profile_id = t_wellnessscore_sections.profile_id
where scores_section = 'WELLNESS'
  and scores_accrued > 0
and "linkedaccounts.gp.ods" = 'P89014'


select distinct summary from t_user


select distinct "linkedaccounts.gp.registered" from t_user

select count (*) from t_user
where "linkedaccounts.gp.registered" = 'true'
or summary = 'linked_with_access'
or summary = 'linked_only'


select count (*) from t_user
where "linkedaccounts.gp.ods" <> 'null'

select count (*) from t_user
limit 500

select * from t_profile
limit 500

select * from t_wellnessscore_sections where scores_section = 'WELLNESS' order by scores_potential desc






