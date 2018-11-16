/* Unit tests to check contraints */

/* foreign key tests: sharks and 2020 represent incorrect values*/

INSERT INTO table Books (bookID, authorID, bookName, publisherID, pubDate, price, category, lastOrderDate, totalOrdered)
VALUES
    (sharks, 2020, 'Best book', 8080, CURRENT_DATE, 20.00, CURRENT_DATE, 2000);

INSERT INTO Orders (memberID, bookID, orderDate, quantity)
VALUES
    (0000, sharks, CURRENT_DATE, 2000);

INSERT INTO Reviews (reviewerID, bookID, reviewDate, reviewStars)
VALUES
    (2020, ccfyls, CURRENT_DATE, 5);


/* general contraint test */

UPDATE Orders
SET quantity = 100
WHERE memberID = 4843;

UPDATE Orders
SET quantity = -1
WHERE memberID = 4444;

UPDATE Books
SET lastOrderDate = CURRENT_DATE
WHERE bookID = ccfyls;

UPDATE Books
SET lastOrderDate = 2017-09-20
WHERE bookID = paudhc;

UPDATE Members
SET joinDate = NULL, isCurrentMember = NULL
WHERE memberID = 8000;

UPDATE Members
SET joinDate = CURRENT_DATE, isCurrentMember = NULL
WHERE memberID = 9315;
