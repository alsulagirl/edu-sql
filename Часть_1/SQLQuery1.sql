CREATE TABLE STUDENT
(STUDENT_ID 	INTEGER PRIMARY KEY,
[LAST NAME]          VARCHAR(20) NOT NULL,
NAME 		VARCHAR(20) NOT NULL,
SURNAME 		VARCHAR(20),
BIRTHDAY 		DATETIME,
ADDRESS 		VARCHAR(60),
UNIV_ID 		INTEGER)


CREATE TABLE LECTURER
(Lecturer_Id integer NOT NULL,
[LAST NAME]  VARCHAR(20),
NAME 		 VARCHAR(20),
SURNAME 	 VARCHAR(20),
BIRTHDAY 	 DATETIME,
ADDRESS 	 VARCHAR(60),
UNIV_ID 	 integer NOT NULL)


CREATE TABLE SUBJECT
(Subj_Id integer NOT NULL,
Subj_Name VARCHAR(20),
Hour integer,
Semester integer NOT NULL)

CREATE TABLE UNIVERSITY
(Univ_Id VARCHAR(20),
Univ_Name VARCHAR(20),
Rating integer NOT NULL,
City VARCHAR(20))

CREATE TABLE EXAM_MARKS
(Exam_Id integer NOT NULL,
Student_Id integer NOT NULL,
Subj_Id integer NOT NULL,
Mark INTEGER CHECK (MARK>0 AND MARK<=5),
Exam_Date datetime
CONSTRAINT 		EX_PR_KEY 
				PRIMARY KEY (EXAM_ID, STUDENT_ID))


CREATE TABLE SUBJ_LECT
(Lecturer_Id integer NOT NULL,
Subj_Id integer NOT NULL)


