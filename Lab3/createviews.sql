CREATE VIEW GreatePublishers
SELECT b.publisherID, COUNT(r.bookID) AS numReviewedPublisher
FROM Publisher AS p, Books AS b, Reviews AS r
WHERE b.bookID = r.bookID
GROUP BY b.publisherID, r.bookID
HAVING r.reviewStars > 3 AND COUNT(p.publisherID) >= 2;


CREATE VIEW BadBookTotals
SELECT bookID, totalOrdered, SUM(quantity) AS badQuantitySum
FROM Books, Orders
WHERE totalOrdered <> 
     (SELECT SUM(quantity)
      FROM Orders);

