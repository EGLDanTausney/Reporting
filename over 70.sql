SELECT count (DISTINCT profile_id) AS profile_id
                         FROM reporting.t_profile
                         WHERE dateofbirth_year < 1950