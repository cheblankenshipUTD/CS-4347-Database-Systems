-- Find the average number of books borrowed by the top five gold members in the library.

with temp as (
	SELECT M.CID, COUNT(BR.BID) as books_borrow
    FROM BORROW BR, MEMBER M
    WHERE BR.PID = M.CID AND M.mem_level = 'Gold'
    GROUP BY M.CID
    ORDER BY books_borrow DESC
    LIMIT 5
)
select AVG(books_borrow) as 'Average # of books borrowed by top 5 GOLD members'
from temp;
