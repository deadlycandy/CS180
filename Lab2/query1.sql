/* 
Find the authorID and authorName for each author whose name doesn't begin
with the letter S. 
Your result should appear in descending order of authorName, and no duplicates should appear in your result.
*/

SELECT DISTINCT authorID, authorName
FROM Authors a
WHERE a.authorName NOT LIKE "S%" OR a.authorName NOT LIKE "s%"
ORDER BY authorName DESC;
