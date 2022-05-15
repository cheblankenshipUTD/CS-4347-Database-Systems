-- Q6(e4) Find the name of publishers and the title of the most popular book for each publisher.
-- (i) Create temp table as t
-- (ii) select all from the temp table
-- (iii) Use correlated sub-query will execute by outer table
--       Author_ID and return the max(borrowed book)
with t as (
    select
        P.PubID as 'Publisher_ID',
	    P.Pub_name as 'Publisher_Name',
        B.BID as 'Book_ID',
        B.b_title as 'Book_Title',
        COUNT(*) as "Number_of_Borrowed"
    from PUBLISHER P
    inner join PUBLISH_BY PB on P.PubID = PB.PubID
    inner join BOOK B on B.BID = PB.BID
    inner join BORROW BR on B.BID = BR.BID
    group by P.PubID, B.BID
)
select *
from t as o
where Number_of_Borrowed = (
    select Max(Number_of_Borrowed)
    from t as i
    where i.Publisher_ID = o.Publisher_ID
);
