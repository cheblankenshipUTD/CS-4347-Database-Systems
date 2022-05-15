
-- Find the members who have borrowed all the books wrote by the most popular author.
--
with t as (
select P.PID, CONCAT(P.fname, ' ', P.minitial, ' ', P.lname) as 'Name', BR.BID
from PERSON P, MEMBER M, BORROW BR
where P.PID=M.CID and M.CID=BR.PID and
BR.BID IN (
    select BID
    from WRITTEN_BY WB
    where WB.AID = (
        SELECT AUTHOR_ID
        FROM PopularAuthor
        WHERE Total_Number_of_Times_Borrowed =
        (
            SELECT MAX(Total_Number_of_Times_Borrowed) FROM PopularAuthor
        )
    )
)
Group by P.PID, BR.BID
)
select Name
from t
group by(PID)
Having COUNT(*) = (
    select COUNT(*)
    from WRITTEN_BY WB
    where WB.AID = (
        SELECT AUTHOR_ID
        FROM PopularAuthor
        WHERE Total_Number_of_Times_Borrowed =
        (
            SELECT MAX(Total_Number_of_Times_Borrowed) FROM PopularAuthor
        )
    )
    group by(WB.AID)
);
