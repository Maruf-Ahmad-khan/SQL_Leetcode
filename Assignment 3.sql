USE DEMO;
CREATE TABLE ADVERTISEMENT (
    REFCODE INT NOT NULL,
    MEDIANAME VARCHAR(20),
    PAGES INT,
    ADVDATE DATE NOT NULL,
    AMOUNT NUMERIC(10 , 2 )
);
INSERT INTO ADVERTISEMENT(REFCODE, MEDIANAME, ADVDATE)
VALUES(1001, 'TIMES OF INDIA', '2002-03-12'),
      (1002, 'HINDUSTAN TIMES', '2001-04-15');
      
SELECT * FROM ADVERTISEMENT;
CREATE TABLE COURSES (
    COURSECODE NUMERIC(30) NOT NULL,
    COURSENAME VARCHAR(30),
    SYLLABUS VARCHAR(60),
    LASTNO NUMERIC(5)
);
INSERT INTO COURSES
            VALUES
            (10, 'ORACLE', 'SQL, PL SQL, JDBC ,JSP', 2),
            (20, 'JAVA', 'JAVA ,CORE JAVA ,SERVLETS ,JSP, EJB', 2);
SELECT * FROM COURSES;
CREATE TABLE BATCHES (
    BATCHCODE NUMERIC(5) NOT NULL,
    COURSECODE NUMERIC(5) NOT NULL,
    STARTINGDATE DATE NOT NULL,
    COURSEFEES NUMERIC(10 , 2 ) NOT NULL,
    NETINCOME NUMERIC(10 , 2 ),
    EXPECTEDINCOME NUMERIC(10 , 2 ),
    LASTNO NUMERIC(5)
);
INSERT INTO BATCHES
            VALUES
            (20002, 20, '2001-07-01', 180, 24000, 0,1),
            (10002, 10, '1999-01-23', 3, 4000, 2000, 2),
            (10001, 10, '1999-01-11', 2, 3000, 6000, 5),
            (10003, 10, '1999-01-25', 4, 3000,7000, 7);
SELECT * FROM BATCHES;
SELECT 
    COURSENAME, BATCHCODE, STARTINGDATE
FROM
    BATCHES,
    COURSES
WHERE
    BATCHES.COURSECODE = COURSES.COURSECODE
        AND BATCHES.BATCHCODE = 10001;

SELECT 
    COURSES.COURSENAME,
    BATCHES.BATCHCODE,
    BATCHES.STARTINGDATE,
    BATCHES.COURSEFEES,
    BATCHES.NETINCOME,
    BATCHES.EXPECTEDINCOME
FROM
    COURSES,
    BATCHES
WHERE
    COURSES.COURSECODE = BATCHES.COURSECODE;
    drop database gender;