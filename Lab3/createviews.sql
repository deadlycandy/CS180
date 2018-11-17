CREATE VIEW GreatPublishers AS
SELECT DISTINCT b.publisherID, COUNT(r.bookID) AS numReviewedPublished
FROM Books AS b, Reviews AS r
GROUP BY b.publisherID, r.bookID, r.reviewStars
HAVING r.reviewStars >= 3 AND COUNT(b.publisherID) >= 2;


CREATE VIEW BadBookTotals AS
SELECT DISTINCT o.bookID, totalOrdered, SUM(quantity) AS badQuantitySum
FROM Books AS b, Orders AS o
WHERE b.bookID = o.bookID
GROUP BY o.bookID, totalOrdered, quantity
HAVING totalOrdered <> SUM(quantity);

