select * from Content_COVID_Ending_IDs




create view Content_COVID_Ending_IDs as
(


/* Latest response to daily COVID request */
SELECT distinct profile_id, answer, max (createddate) as "date"
FROM t_event
WHERE "eventtype.question" = 'questionnaire_selfisolation_q4'
group by profile_id, answer
    )


SELECT distinct answer, count(distinct profile_id) as "Users"
    from Content_COVID_Endings


select distinct t_event."eventtype.conversation"
from t_event
order by createddate desc


bdl_fitness_activity
bdl_shs
bdl_dietcheck
questionnaire_sleep


select * from Content_COVID_Endings