-- Find the names of employees who are also a member and the books they have borrowed in the past month.

SELECT
     CONCAT(P.fname, ' ', P.minitial, ' ', P.lname) as 'Name', B.b_title
FROM
    PERSON P, EMPLOYEE E, MEMBER M, BORROW BR, BOOK B
WHERE
    P.PID = E.EID AND
    E.EID = M.CID AND
    BR.BID = B.BID AND
    DATE_ADD(SYSDATE(), INTERVAL -1 MONTH) < BR.borrow_date
Order by Name;
