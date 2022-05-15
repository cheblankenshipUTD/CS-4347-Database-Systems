-- 3. PotentialGoldMember - This view returns the name, phone number and ID
--    of the silver members who borrowed books in every month in the past year.
-- It's ugly but works
CREATE VIEW PotentialGoldMember AS
select P.PID as 'Member ID', P.fname as 'First Name', P.lname as 'Last Name', C.phone_number, M.mem_level as 'Member Level'
from PERSON P
inner join MEMBER M on P.PID = M.CID
inner join BORROW BR on M.CID = BR.PID
inner join CONTACT C on P.PID = C.PID
where M.mem_level = 'Silver'
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -1 MONTH) and borrow_date < SYSDATE() group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -2 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -1 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -3 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -2 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -4 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -3 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -5 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -4 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -6 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -5 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -7 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -6 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -8 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -7 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -9 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -8 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -10 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -9 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -11 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -10 MONTH) group by (PID) having count(*) >= 1)
AND P.PID IN (select PID from BORROW where borrow_date >= DATE_ADD(SYSDATE(), INTERVAL -12 MONTH) and borrow_date < DATE_ADD(SYSDATE(), INTERVAL -11 MONTH) group by (PID) having count(*) >= 1)
Group by P.PID, C.phone_number;
