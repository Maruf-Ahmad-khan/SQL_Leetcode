USE TREADMIL;
SELECT 
    *
FROM
    treadmil.`treadmil-users`;
SELECT 
    AVG(INCOME) AS INCOMEAVERAGE
FROM
    treadmil.`treadmil-users`;
SELECT  MaritalStatus , LEN(Age) AS LENGTHOFAge FROM treadmil.`treadmil-users`;
SELECT AVG(Age), VARIANCE(INCOME), STDDEV(Fitness) FROM treadmil.`treadmil-users`;
SELECT REGEXP_INSTR('ABBCDFFGR', 'B+C') FROM DUAL;
SELECT REGEXP_INSTR('abbccdf bbc', '(b+c)$') from dual;