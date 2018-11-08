/* 
Find the memberID and joinDate for each member who reviewed a book that was published after April 1, 2010, and that book was also written by an author
who has the exact same name as the reviewer. No duplicates should appear in your result.
*/

SELECT DISTINCT MemberID AS "Member ID", joinDate "Join Date"
FROM Members AS m, Reviews
WHERE memberID IN 
    (SELECT DISTINCT reviewerID
     FROM Books AS b, Reviews AS r
     WHERE b.pubDate > '2010-04-01' AND b.bookID = r.bookID AND b.authorID IN 
        (SELECT DISTINCT authorID
         FROM Authors AS a
         WHERE a.authorName = m.memberName));
