    select distinct profile_id, a.score as home, b.score as athome
    from t_profile
         outer join t_event a on profile_id = a.profile_id
    where a.profile_id = b.event_id
    AND (a."eventtype.internalname" = 'conversation_answer'
    AND a."eventtype.question" = 'questionnaire_selfisolation_q1'
    AND a.modifieddate > '2020-03-21'
    AND a.score = 1)
    OR (b."eventtype.minternalname" = 'conversation_answer'
    AND b."eventtype.question" = 'questionnaire_selfisolation_q2'
    AND b.modifieddate > '2020-03-21'
    AND b.score = 20)



select answer, count (distinct profile_id)
from t_event
where "eventtype.internalname" = 'conversation_answer'
and "eventtype.question" = 'questionnaire_COVID_test_q1'
group by answer
order by answer

