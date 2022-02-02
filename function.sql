


DROP FUNCTION TESTING;
CREATE OR REPLACE FUNCTION TESTING() 
RETURNS TABLE ( 
user_id_9 INT,
username_9 VARCHAR
) AS $$
DECLARE 
    var_r record;
    var_r2 record;
BEGIN
 FOR var_r IN(
SELECT USER_ID_23, USERNAME_23
FROM
testing_11)
 LOOP
 FOR var_r2 IN(
 SELECT distinct(user_id_1),username_1
 FROM TESTING1(var_r.USERNAME_23))
 LOOP
 user_id_9 := var_r2.user_id_1;
 username_9 := var_r2.username_1;  
 RETURN NEXT;
END LOOP;
 END LOOP;
END; $$
LANGUAGE 'plpgsql';

==============================

DROP FUNCTION TESTING1;
CREATE OR REPLACE FUNCTION TESTING1(XCD regclass) 
RETURNS TABLE ( 
user_id_1 INT,
username_1 VARCHAR
) AS $$
declare value1 varchar;
BEGIN
value1 = XCD;
RETURN QUERY EXECUTE format('(SELECT  USER_ID,USERNAME
FROM %I )',value1);
END; $$
LANGUAGE 'plpgsql';


=========================
CREATE TABLE testing_11 (
  user_id_23 INT NOT NULL,
  username_23 VARCHAR ( 50 )
);

SELECT * FROM TESTING_11;

insert into TESTING_11 values (1,'test1');
insert into TESTING_11 values (2,'test22');
========================

CREATE TABLE TEST22 (
  user_id INT NOT NULL,
  username VARCHAR ( 50 )
);

select * from test22;

insert into test22 values (2,'test12');
insert into test22 values (3,'test13');
insert into test22 values (4,'test14');

======================

DROP TABLE TEST1;

CREATE TABLE TEST1 (
  user_id INT NOT NULL,
  username VARCHAR ( 50 )
);

SELECT * FROM TEST1;

insert into TEST1 values (1,'test1');
insert into TEST1 values (2,'test6');
insert into TEST1 values (3,'test7');
insert into TEST1 values (4,'test8');
