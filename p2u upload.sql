

insert into p2u_new_billed ("evergreen id", "order count", "p2u order refs", "order dates")
from 's3://egl-prod-reporting-bucket/prod/OneOff/p2u_April.csv'
iam_role 'arn:aws:iam::623759524580:role/redshift-reporting-role'
region 'eu-west-2'
CSV QUOTE AS '"' ;
DELIMITER AS ','