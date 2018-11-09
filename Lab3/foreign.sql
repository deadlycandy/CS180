/* Adding foreign constraints to tables */

ALTER TABLE Books
ADD CONSTRAINT constrain_authorID FOREIGN KEY (authorID) REFERENCES Authors(authorID);

ALTER TABLE Orders
ADD CONSTRAINT constrain_bookID FOREIGN KEY (bookID) REFERENCES Books(bookID);

ALTER TABLE Reviews
ADD CONSTRAINT constrain_reviewerID FOREIGN KEY (reviewerID) REFERENCES Members(memberID);
