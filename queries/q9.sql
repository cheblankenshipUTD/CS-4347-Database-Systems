-- Q9(e10) List all the employees that have enrolled into Gold membership within a month of being employed.
-- (i)  Join PERSON, EMPLOYEE, and MEMBER by id(pk)
-- (ii) Filter by member level 'Gold'
-- (iii)Keep only EMPLOYEE.start_date before MEMBER.date_of_issued
-- (iv) Use DATEDIFF function to get the difference btwn the two dates
-- (v)  Only keep the onse that have less than 31
SELECT
	E.EID as 'Employee ID',
	CONCAT(P.fname, ' ', P.minitial, ' ', P.lname) as 'Name',
	E.start_date as 'Hire Date',
	M.DoI as 'Memebr Entrollment Date',
	M.mem_level as 'Member Type'
FROM
	PERSON P, EMPLOYEE E, MEMBER M
WHERE
	P.PID = E.EID AND
	E.EID = M.CID AND
	M.mem_level='Gold' AND
	E.start_date < M.DoI AND
	ABS(DATEDIFF(E.start_date, M.DoI)) <= 31;
