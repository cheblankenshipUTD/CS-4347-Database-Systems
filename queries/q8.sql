-- 8. Find the year with the maximum number of books borrowed.

SELECT 
    EXTRACT(YEAR FROM BR.borrow_date) as 'year', COUNT(*) as '# of borrowed books'
FROM
    BORROW BR
GROUP BY
    (year)
ORDER BY
    COUNT(*) DESC
LIMIT 1;
