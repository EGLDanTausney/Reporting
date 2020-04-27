--Fitness covid answers who have not completed the BDL questionnaire
select distinct profile_id,
from Content_COVID_Ending_IDs
where
answer = 'Fitness'
and
      profile_id
          not in
      (
          select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'bdl_fitness_activity'
      )

--Sleep
select distinct profile_id
from Content_COVID_Ending_IDs
where
answer = 'Sleep'
and
      profile_id
          not in
      (
          select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'questionnaire_sleep'
      )
--Diet
select distinct profile_id
from Content_COVID_Ending_IDs
where
answer = 'Diet'
and
      profile_id
          not in
      (
          select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'bdl_dietcheck'
      )

--Happiness
select distinct profile_id
from Content_COVID_Ending_IDs
where
answer = 'Happiness'
and
      profile_id
          not in
      (
          select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'bdl_shs'
      )




--alcohol
select distinct profile_id
from Content_COVID_Ending_IDs
where
answer = 'Happiness'
and
      profile_id
          not in
      (
          select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'bdl_alcohol_consumption'
      )