--create table GP_practices_Apr20 (ODS varchar(6), name varchar(100), postcode varchar(10), phone varchar(20));
select * from
GP_practices_Apr20

ALTER TABLE GP_practices_Apr20 ALTER COLUMN name TYPE varchar (255)


copy p2u_new_billed ("evergreen id", "order count", "p2u order refs", "order dates")
from 's3://egl-prod-reporting-bucket/prod/OneOff/p2u.csv'
iam_role 'arn:aws:iam::623759524580:role/redshift-reporting-role'
region 'eu-west-2'
CSV QUOTE AS '"' ;
DELIMITER AS ','


CSV QUOTE AS ',' ;

select * from stl_load_errors


select * from p2u_new_billed