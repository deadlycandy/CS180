/* query GreatPublishers and BadBookTotals */


/* BEFORE DELETIONS 

 publisherid | numreviewedpublished | numbad
-------------+----------------------+--------
       17265 |                    4 |      2
       22139 |                    3 |      2
       22139 |                   12 |      2
       22778 |                    4 |      2
       25327 |                    4 |      2
       31725 |                    2 |      1
       31725 |                    8 |      1
       32326 |                    4 |      2
       55576 |                    4 |      2
       92152 |                    4 |      2
       93209 |                    4 |      2
       94519 |                    6 |      1
       94519 |                    6 |      2
       94519 |                   24 |      1
       94519 |                   24 |      2
       98035 |                    4 |      2
       98035 |                   16 |      2

*/


SELECT g.publisherID, numReviewedPublished, COUNT(bad.bookID) AS numBad
FROM GreatPublishers AS g, BadBookTotals AS bad, Books AS b
WHERE g.publisherID = b.publisherID AND b.bookID = bad.bookID
GROUP BY g.publisherID, numReviewedPublished, bad.bookID
HAVING COUNT(bad.bookID) >= 1;

DELETE FROM Orders
WHERE memberID = 8844 AND bookID = 'jgzhwq' AND orderDate = '2011-05-19';


DELETE FROM Orders
WHERE memberID = 2161 AND bookID = 'rrrrrr' AND orderDate = '2016-01-31';


SELECT g.publisherID, numReviewedPublished, COUNT(bad.bookID) AS numBad
FROM GreatPublishers AS g, BadBookTotals AS bad, Books AS b
WHERE g.publisherID = b.publisherID AND b.bookID = bad.bookID
GROUP BY g.publisherID, numReviewedPublished, bad.bookID
HAVING COUNT(bad.bookID) >= 1;

/*

publisherid | numreviewedpublished | numbad
-------------+----------------------+--------
       17265 |                    4 |      2
       22139 |                    3 |      2
       22139 |                   12 |      2
       22778 |                    4 |      2
       25327 |                    4 |      2
       32326 |                    4 |      2
       55576 |                    4 |      2
       92152 |                    4 |      2
       93209 |                    4 |      2
       94519 |                    6 |      2
       94519 |                   24 |      2
       98035 |                    4 |      2
       98035 |                   16 |      2
*/
