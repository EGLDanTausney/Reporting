select answer, count (distinct profile_id)
from t_event
where "eventtype.internalname" = 'conversation_answer'
and "eventtype.question" = 'questionnaire_COVID_test_q1'
group by answer
order by answer