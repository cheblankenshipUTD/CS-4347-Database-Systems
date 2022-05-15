-- PopularAuthor – This view returns details of authors whose books have been borrowed the most.

CREATE VIEW PupularAuthor AS
with t as (
	select
		A.AID as 'Author_ID',
		A.A_name as "Author_Name",
		B.BID as 'Book_ID',
		B.b_title as "Book_Title",
		COUNT(*) as "Total_Number_of_Times_Borrowed"
	from AUTHOR A
	inner join WRITTEN_BY WB on A.AID = WB.AID
	inner join BOOK B on B.BID = WB.BID
	inner join BORROW BR on B.BID = BR.BID
	group by A.AID, B.BID
	order by COUNT(*) DESC
) select *
  from t as o
  where Total_Number_of_Times_Borrowed = (
	  select Max(Total_Number_of_Times_Borrowed)
	  from t as i
	  where i.Author_ID=o.Author_ID
);
