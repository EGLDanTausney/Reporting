/* Latest response to daily COVID request */
SELECT count (distinct profile_id), (CAST(createddate as date)) as "date"
FROM t_event
WHERE "eventtype.question" = 'questionnaire_selfisolation_q5'
GROUP BY date

/* Nudge request entry by day - excluding those who have answered a previous monitoring request */
SELECT DISTINCT profile_id, internalname
FROM t_actionsbucket_items
WHERE internalname like 'nudge_h%'
AND status = 'outstanding'
AND date_added IN ('2020-04-21')
AND profile_id NOT IN (SELECT DISTINCT profile_id
                        FROM t_event
                        WHERE "eventtype.question" = 'questionnaire_selfisolation_q5'
                        AND answer IN ('No', 'Yes, Daily'))
GROUP BY profile_id, internalname

/* New Users who have yet to complete their daily check */
SELECT DISTINCT profile_id
FROM reporting.t_actionsbucket_items
WHERE internalname like 'questionnaire_healthyathome_final'
AND status != 'completed'
AND profile_id IN
    (SELECT profile_id
    FROM t_user
    WHERE createddate BETWEEN '2020-04-21 00:00:00.000001' AND '2020-04-21-23:59:59.999999')