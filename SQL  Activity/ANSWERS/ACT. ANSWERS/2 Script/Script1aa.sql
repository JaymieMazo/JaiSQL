create table Student
(
snum int,
sname varchar(20),
major varchar(20),
level varchar(10),
age int
primary key (snum)
)
-------------------------------------------
create table Class
(
name VARCHAR(10),
meets_at varchar(10),
room varchar(10),
fid int,

primary key  (name),
FOREIGN KEY (Fid) REFERENCES FACULTY (fid)
)
--------------------------------------------

create table Enrolled
(
snum int,
cname varchar(10),

FOREIGN KEY (snum) REFERENCES Student (snum),
FOREIGN KEY (cname) REFERENCES Class (name)
)

--------------------------------------------
create table Faculty
(
fid int,
fname varchar(10),
dept_id INT,

PRIMARY KEY (FID)
)


--------------------------------------------

ALTER TABLE Class ALTER COLUMN name VARCHAR(20)


ALTER TABLE Class DROP CONSTRAINT FK__Class__fid__71D1E811

ALTER TABLE Class ADD  CONSTRAINT FK__Class__fid__72D1E811 PRIMARY KEY (NAME)


------------------------------FACULTY-------------------------------------------------
INSERT INTO Faculty (fid, fname, dept_id )
VALUES (5, 'V', 55)

SELECT * FROM Faculty


UPDATE Faculty 
SET fname = 'V. Teach'
WHERE fid=5


UPDATE Faculty
SET fname= 'I.Teach'
WHERE fid=1
------------------------------STUDENTS-------------------------------------------------
INSERT INTO Student  (snum, sname, major, level, age )
VALUES (109, 'Norma Chui' , 'ComScie','SR', 21)

SELECT * FROM Student


UPDATE Student
SET major= 'Science'
WHERE snum = 106


DELETE  FROM student WHERE snum=106

-------------------------------CLASS--------------------------------------------------

INSERT INTO Class  (name, meets_at, room, fid )
VALUES ('TurboD','3:00 PM' , 'R218', 2)

SELECT * FROM Class


UPDATE Class
SET room='R128'
WHERE NAME='PhilHis'

------------------------------ENROLLED-----------------------------------------------------

INSERT INTO Enrolled  (snum, cname )
VALUES (108, 'PhilHis')



SELECT * FROM Enrolled


UPDATE Enrolled
SET cname='HistoryBBB'
WHERE snum=101
----------------------------QUESTION#1--------------------------------------------------------
SELECT enrolled.snum, student.sname FROM Student 
INNER JOIN Enrolled
ON Student.snum=Enrolled.snum
INNER JOIN Class
ON Enrolled.cname=Class.name
INNER JOIN Faculty
ON class.fid=Faculty.fid
WHERE student.level='JR' AND  faculty.fname='I.Teach'



----------------------------QUESTION#2--------------------------------------------------------
SELECT sname, max(age) AS Age  FROM Student 
INNER JOIN Enrolled
ON Student.snum=Enrolled.snum
INNER JOIN Class
ON Enrolled.cname=Class.name
INNER JOIN Faculty
ON Class.fid=Faculty.fid

WHERE  student.major='History' or Faculty.fname='I.Teach'
GROUP BY sname

----------------------------QUESTION#3---------------------------------------------------

SELECT name  FROM Class
INNER JOIN Enrolled
ON Class.name=Enrolled.cname
INNER JOIN Student
ON Enrolled.snum=Student.snum
WHERE room ='R128' 
GROUP BY name
HAVING count (Enrolled.snum)>=5


----------------------------QUESTION#4--------------------------------------------------------

SELECT student.sname , count (enrolled.snum ) AS Classes_at_same_time FROM  Enrolled
INNER JOIN Student 
ON Enrolled.snum=student.snum
INNER JOIN Class
ON Enrolled.cname=Class.name
WHERE class.meets_at='3:00 PM'
GROUP BY student.sname
HAVING count(Enrolled.cname)=2

----------------------------QUESTION#5xxxxx---------------------------------------------------

SELECT TOP 1 fname ,count (class.room) AS no_of_some_class  FROM Faculty 
INNER JOIN Class
ON Faculty.fid=class.fid
GROUP BY faculty.fname ORDER BY no_of_some_class DESC

----------------------------QUESTION#6xxxx---------------------------------------------------
SELECT TOP 3 fname, count(class.fid)  AS Classes FROM Faculty 
INNER JOIN Class
ON faculty.fid=Class.fid
INNER JOIN Enrolled
ON Class.name=Enrolled.cname
GROUP BY fname ORDER BY classes DESC



HAVING count(class.fid) < 5



----------------------------QUESTION#7--------------------------------------------------------

SELECT level , avg(age) FROM Student
GROUP BY level


-----------------------------QUESTION#8--

SELECT level , avg(age) FROM Student
WHERE level !='JR'
GROUP BY level

-----------------------------QUESTION#9--
SELECT fname , count (class.fid) AS  Total_Classes  FROM Faculty 
INNER JOIN Class 
ON faculty.fid=class.fid
WHERE class.room='R128' 
GROUP BY fname 
-----------------------------QUESTION#10--

SELECT TOP 1 student.snum , student.sname, count(student.snum) AS Number_of_Classes FROM Student
INNER JOIN Enrolled
ON student.snum=enrolled.snum
INNER JOIN Class
ON Enrolled.cname=Class.name
WHERE student.snum IN (SELECT enrolled.snum FROM Enrolled WHERE enrolled.cname IN (SELECT name from Class)) 
GROUP BY Student.snum, student.sname 
HAVING count(student.snum)>1 ORDER BY  count(student.snum)  DESC 


-----------------------------QUESTION#11--
SELECT sname FROM Student
where snum NOT IN (SELECT snum FROM Enrolled)




-----------------------------QUESTION#12--
SELECT TOP 1 convert (VARCHAR(10), age  ) + ',  ' + level AS pair, count(age) AS Age_Count FROM Student 
GROUP BY convert (VARCHAR(10), age) + ',  ' + level 
ORDER BY Age_Count  DESC

or

SELECT TOP 1 convert (VARCHAR(10), age  ) + ',  ' + level AS pair FROM Student 
GROUP BY convert (VARCHAR(10), age) + ',  ' + level 
ORDER BY  count(age)   DESC
