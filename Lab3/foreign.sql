/* Adding foreign constraints to tables */

ALTER TABLE Books
ADD CONSTRAINT fk_authorID FOREIGN KEY (authorID) REFERENCES Authors(authorID);

ALTER TABLE Orders
ADD CONSTRAINT fk_bookID FOREIGN KEY (bookID) REFERENCES Books(bookID);

ALTER TABLE Reviews
ADD CONSTRAINT fk_reviewerID FOREIGN KEY (reviewerID) REFERENCES Members(memberID);
