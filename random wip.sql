select distinct "eventtype.conversation" from t_event where "eventtype.internalname" = 'conversation'


join t_user





SELECT distinct t_event.profile_id, createddate
from t_event
WHERE t_event."eventtype.internalname"::text = 'conversation'::text AND t_event."eventtype.conversation"::text = 'questionnaire_community'::text
GROUP BY t_event."eventtype.internalname", t_event.profile_id, createddate
order by createddate desc

    select distinct event_type from t_sessiondata



SELECT distinct t_event.profile_id, createddate
from t_event
WHERE t_event."eventtype.internalname"::text = 'conversation'::text AND t_event."eventtype.conversation"::text = 'bdl_ons_check'::text
GROUP BY t_event."eventtype.internalname", t_event.profile_id, createddate
order by createddate desc

create view onebutnotall(profile_id) as
SELECT DISTINCT derived_table1.profile_id
FROM ((((((SELECT t_event.profile_id
           FROM reporting.t_event
           WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                  ((t_event."eventtype.conversation")::text = 'bdl_gp'::text))
           GROUP BY t_event."eventtype.internalname", t_event.profile_id
           UNION
           SELECT t_event.profile_id
           FROM reporting.t_event
           WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                  ((t_event."eventtype.conversation")::text = 'bdl_fitness_activity'::text))
           GROUP BY t_event."eventtype.internalname", t_event.profile_id)
          UNION
          SELECT t_event.profile_id
          FROM reporting.t_event
          WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                 ((t_event."eventtype.conversation")::text = 'bdl_dietcheck'::text))
          GROUP BY t_event."eventtype.internalname", t_event.profile_id)
         UNION
         SELECT t_event.profile_id
         FROM reporting.t_event
         WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                ((t_event."eventtype.conversation")::text = 'bdl_shs'::text))
         GROUP BY t_event."eventtype.internalname", t_event.profile_id)
        UNION
        SELECT t_event.profile_id
        FROM reporting.t_event
        WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
               ((t_event."eventtype.conversation")::text = 'bdl_ons_check'::text))
        GROUP BY t_event."eventtype.internalname", t_event.profile_id)
       UNION
       SELECT t_event.profile_id
       FROM reporting.t_event
       WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
              ((t_event."eventtype.conversation")::text = 'bdl_healthindicators'::text))
       GROUP BY t_event."eventtype.internalname", t_event.profile_id)
      UNION
      SELECT t_event.profile_id
      FROM reporting.t_event
      WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
             ((t_event."eventtype.conversation")::text = 'bdl_alcohol_consumption'::text))
      GROUP BY t_event."eventtype.internalname", t_event.profile_id) derived_table1
WHERE (NOT (derived_table1.profile_id IN (SELECT DISTINCT allbd.profile_id
                                          FROM ((((((SELECT t_event.profile_id
                                                     FROM reporting.t_event
                                                     WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                            ((t_event."eventtype.conversation")::text = 'bdl_ons_check'::text))
                                                     GROUP BY t_event."eventtype.internalname", t_event.profile_id
                                                     INTERSECT
                                                     SELECT t_event.profile_id
                                                     FROM reporting.t_event
                                                     WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                            ((t_event."eventtype.conversation")::text = 'bdl_shs'::text))
                                                     GROUP BY t_event."eventtype.internalname", t_event.profile_id)
                                                    INTERSECT
                                                    SELECT t_event.profile_id
                                                    FROM reporting.t_event
                                                    WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                           ((t_event."eventtype.conversation")::text = 'bdl_dietcheck'::text))
                                                    GROUP BY t_event."eventtype.internalname", t_event.profile_id)
                                                   INTERSECT
                                                   SELECT t_event.profile_id
                                                   FROM reporting.t_event
                                                   WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                          ((t_event."eventtype.conversation")::text = 'bdl_gp'::text))
                                                   GROUP BY t_event."eventtype.internalname", t_event.profile_id)
                                                  INTERSECT
                                                  SELECT t_event.profile_id
                                                  FROM reporting.t_event
                                                  WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                         ((t_event."eventtype.conversation")::text =
                                                          'bdl_fitness_activity'::text))
                                                  GROUP BY t_event."eventtype.internalname", t_event.profile_id)
                                                 INTERSECT
                                                 SELECT t_event.profile_id
                                                 FROM reporting.t_event
                                                 WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                        ((t_event."eventtype.conversation")::text =
                                                         'bdl_alcohol_consumption'::text))
                                                 GROUP BY t_event."eventtype.internalname", t_event.profile_id)
                                                INTERSECT
                                                SELECT t_event.profile_id
                                                FROM reporting.t_event
                                                WHERE (((t_event."eventtype.internalname")::text = 'conversation'::text) AND
                                                       ((t_event."eventtype.conversation")::text =
                                                        'bdl_healthindicators'::text))
                                                GROUP BY t_event."eventtype.internalname", t_event.profile_id) allbd)))
ORDER BY random();

alter table onebutnotall owner to tableau;


