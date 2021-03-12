ACTIVITY 2-3


--1. How many copies of the book titled The Lost Tribe are owned by the library branch whose name is "Sharpstown".


SELECT SUM( no_of_copies ) AS COPIES FROM BOOK_COPIES
inner JOIN  LIBRARY_BRANCH
ON LIBRARY_BRANCH.Branchild= BOOK_COPIES.Branchild
INNER JOIN BOOK
ON BOOK_COPIES.BookId=book.BookId
WHERE book.Title = 'The Lost Tribe' AND LIBRARY_BRANCH.BranchName='Sharpstown'

--2. How many copies of the book titled The Lost Tribe are owned by each library branch?

SELECT book.Title,LIBRARY_BRANCH.BranchName, no_of_copies  FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH
ON LIBRARY_BRANCH.Branchild=BOOK_COPIES.Branchild
INNER JOIN BOOK
ON BOOK_COPIES.BookId=BOOK.BookId
WHERE book.Title= 'The Lost Tribe'

--3. Retrieve the names of all borrowers who do not have any books checked out .


SELECT NAME FROM BORROWER
INNER JOIN BOOK_LOANS
ON borrower.CardNo=BOOK_LOANS.CardNo
WHERE BOOK_LOANS.DateOut IS NULL

SELECT NAME FROM BORROWER
WHERE Borrower.CardNo
NOT IN(SELECT BOOK_LOANS.CardNo FROM BOOK_LOANS)


--4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.



SELECT Title, BORROWER.Name, BORROWER.Address  FROM BOOK
INNER JOIN BOOK_LOANS
ON BOOK.BookId=BOOK_LOANS.BookId
INNER JOIN LIBRARY_BRANCH
ON BOOK_LOANS.Branchild=Library_Branch.Branchild
INNER JOIN BORROWER
ON BOOK_LOANS.CardNo=BORROWER.CardNo
WHERE LIBRARY_BRANCH.BranchName='Sharpstown' AND BOOK_LOANS.DueDate='2018/04/03'



--5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

SELECT branchname , count(book_loans.BookId) AS TOTAL FROM LIBRARY_BRANCH 
right JOIN BOOK_LOANS
ON LIBRARY_BRANCh.Branchild=BOOK_LOANS.Branchild
GROUP BY branchname 


--6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. 

SELECT name, address, count (book_loans.BookId) AS TOTAL FROM BORROWER
INNER JOIN BOOK_LOANS
ON BORROWER.CardNo=BOOK_LOANS.CardNo
GROUP BY name, address
HAVING count (BOOK_LOANS.BookId)>5


--7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central"

SELECT title , BOOK_COPIES.No_of_Copies FROM BOOK
INNER JOIN BOOK_COPIES
ON book.BookId = BOOK_COPIES.BookId
left  JOIN LIBRARY_BRANCH
ON BOOK_COPIES.Branchild=LIBRARY_BRANCH.Branchild
INNER  JOIN BOOK_AUTHORS 
ON BOOK.BookId=BOOK_AUTHORS.BookId
WHERE LIBRARY_BRANCH.BranchName='Central' AND BOOK_AUTHORS.AuthorName='Stephen King'

--8. Retrieve the names of employees in department 5 who work more than 10 hours per week on the 'ProductX' project.


SELECT fname + '  ' + minit + ' ' + lname  AS NAME FROM EMPLOYEE
INNER JOIN WORKS_ON
ON employee.SSN=WORKS_ON.ESSN
WHERE WORKS_ON.HOURS>10 AND DNO=5

--9. For each project, list the project name and the total hours per week (by all employees) spent on that project.

SELECT PNAME , sum(WORKS_ON.HOURS)*7 AS Totalhours FROM PROJECT 
INNER JOIN WORKS_ON 
ON PROJECT.PNUMBER=WORKS_ON.PNO
GROUP BY PNAME


--10. Retrieve the names of employees who work on every project.


SELECT fname + '  ' + minit + ' ' + lname  AS NAME  , PROJECT.PNAME  FROM EMPLOYEE
INNER JOIN WORKS_ON
ON employee.SSN=WORKS_ON.ESSN
INNER JOIN PROJECT
ON WORKS_ON.PNO=PROJECT.PNUMBER

OR 


SELECT FNAME, MINIT ,LNAME FROM EMPLOYEE
WHERE SSN IN (SELECT ESSN FROM WORKS_ON)


--11. Retrieve the names of employees who do not work on any project.
 
SELECT fname + '  ' + minit + ' ' + lname    AS NAME  FROM EMPLOYEE
LEFT JOIN WORKS_ON
ON employee.SSN=WORKS_ON.ESSN
WHERE WORKS_ON.ESSN IS NULL


---OR 


SELECT FNAME, MINIT ,LNAME FROM EMPLOYEE
WHERE SSN NOT IN (SELECT ESSN  FROM WORKS_ON)


--12. Find the names and addresses of employees who work on at least one project located in Houston but whose department has no location in Houston. 

SELECT  employee.fname + '  ' + employee.minit + ' ' + employee.lname AS NAME , employee.address, WORKS_ON.ESSN,DEPARTMENT.DNUMBER , PROJECT.PNUMBER FROM EMPLOYEE
INNER JOIN WORKS_ON
ON EMPLOYEE.SSN=WORKS_ON.ESSN
inner JOIN PROJECT
ON WORKS_ON.PNO=PROJECT.PNUMBER
INNER JOIN DEPARTMENT
ON PROJECT.DNUM=DEPARTMENT.DNUMBER
INNER JOIN DEPT_LOCATIONS
ON DEPARTMENT.DNUMBER=DEPT_LOCATIONS.DNUMBER

WHERE PROJECT.PLOCATION='Houston' AND DEPT_LOCATIONS.DLOCATION !='Houston'


13. List the last names of department managers who have no dependents. 


SELECT lname  FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON employee.SSN=DEPARTMENT.MGRSSN
left JOIN DEPENDENT
ON EMPLOYEE.SSN=DEPENDENT.ESSN
WHERE DEPENDENT.ESSN IS NULL


--OR


SELECT lname  FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON employee.SSN=DEPARTMENT.MGRSSN
left JOIN DEPENDENT
ON EMPLOYEE.SSN=DEPENDENT.ESSN
WHERE SSN NOT IN (SELECT  ESSN FROM DEPENDENT)


14. Find details of those employees whose salary is > the average salary for all employees. Output salary in descending order. 

SELECT fname , minit, lname,ssn,bdate,address,sex, dno, salary FROM EMPLOYEE
GROUP BY fname , minit, lname,ssn,bdate,address,sex, dno, salary
HAVING EMPLOYEE.SALARY > (SELECT avg(EMPLOYEE.SALARY) FROM EMPLOYEE )
ORDER BY salary DESC


SELECT fname , minit, lname,ssn,bdate,address,sex, dno, salary FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(EMPLOYEE.SALARY ) FROM EMPLOYEE ORDER BY salary DESC


15. Find details of those employees whose salary is > the average salary for all employees in his/her department. Output salary in ascending order.

SELECT fname , dno, salary FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON DEPARTMENT.DNUMBER=EMPLOYEE.DNO
WHERE  DEPARTMENT.DNUMBER IN (SELECT dnumber FROM DEPARTMENT)
AND EMPLOYEE.SALARY > (SELECT avg(EMPLOYEE.SALARY )  FROM EMPLOYEE WHERE  dno IN(SELECT dnumber FROM DEPARTMENT) 
ORDER BY salary ASC





