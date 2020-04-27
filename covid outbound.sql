select * from  content_covid_followup_auditlog

as
    (


--Fitness covid answers who have not completed the BDL questionnaire
        select distinct profile_id, 'bdl_fitness_activity' as "questionnaire", getdate() as "sent"
        from Content_COVID_Ending_IDs
        where answer = 'Fitness'
          and profile_id
            not in
              (
                  select distinct t_event.profile_id
                  from t_event
                  where "eventtype.conversation" = 'bdl_fitness_activity'
              )
        union
--Sleep
        select distinct profile_id, 'questionnaire_sleep' as "questionnaire", getdate() as "sent"
        from Content_COVID_Ending_IDs
        where answer = 'Sleep'
          and profile_id
            not in
              (
                  select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'questionnaire_sleep'
              )
        union
--Diet
        select distinct profile_id, 'bdl_dietcheck' as "questionnaire", getdate() as "sent"
        from Content_COVID_Ending_IDs
        where answer = 'Diet'
          and profile_id
            not in
              (
                  select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'bdl_dietcheck'
              )
        union
--Happiness
        select distinct profile_id, 'bdl_shs' as "questionnaire", getdate() as "sent"
        from Content_COVID_Ending_IDs
        where answer = 'Happiness'
          and profile_id
            not in
              (
                  select distinct t_event.profile_id from t_event where "eventtype.conversation" = 'bdl_shs'
              )
    )