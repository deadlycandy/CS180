/*
Category is 'N’ for non-fiction books and 'F' for fiction books. Find the 
authorName and publisherName for each non-fiction book whose price is 
greater than or equal to 19.99; no duplicates should appear in your
result.
*/


SELECT DISTINCT  authorName AS "Author", publisherName AS "Publisher"
FROM Books AS b, Authors AS a, Publishers AS p
WHERE category = 'N' and (b.authorID = a.authorID) and (b.publisherID = p.publisherID) and b.price >= 19.99;
