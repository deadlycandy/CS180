/*
Find the reviewerID and bookID for each review that has all of the followingthree properties:
• The number of reviewStars isn't 4.
• The book is named 'Jane Eyre'.
• The reviewer is a member whose name is 'John Smith'.
No duplicates should appear in your result.
*/


SELECT DISTINCT reviewerID AS "Reviewer ID", b.bookID AS "Book ID"
FROM Reviews AS r, Books AS b
WHERE r.reviewStars < 4 AND b.bookName = 'Jane Eyre' AND r.reviewerID IN 
    (SELECT memberID 
     FROM Members AS m 
     WHERE m.memberName = 'John Smith');
