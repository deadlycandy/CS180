/* create.sql is a script to create the schema and tables required for lab 1*/

DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

ALTER ROLE rabhatna SET SEARCH_PATH to Lab1;

/*Defining tables for Niles Books: Authors, Books, Publishers, Memebers, Orders, and Review */

CREATE TABLE Authors(
authorID INTEGER PRIMARY KEY,
authorName VARCHAR (30) NOT NULL,
address VARCHAR (30) NOT NULL,
numBooksWritten INTEGER CHECK (numBooksWritten >= 0),
mostRecentPubDate DATE NOT NULL
);

CREATE TABLE Books(
bookID VARCHAR (6) PRIMARY KEY,
authorID INTEGER REFERENCES Authors(authorID),
bookName VARCHAR (30) NOT NULL,
publisherID INTEGER REFERENCES Publishers(publisherID),
pubDate DATE NOT NULL,
price DECIMAL (6,2) NOT NULL,
category CHAR (1) NOT NULL,
lastOrderDate DATE NOT NULL,
totalOrder INTEGER CHECK (totalOrder >= 0)
);

CREATE TABLE Publishers(
publisherID INTEGER PRIMARY KEY,
publisherName VARCHAR (30) NOT NULL, 
address VARCHAR (30) NOT NULL
);

CREATE TABLE Members(
memberID INTEGER PRIMARY KEY,
memberName VARCHAR (30) NOT NULL, 
joinDate DATE NOT NULL,
renewalDate DATE NOT NULL,
isCurrentMember BOOLEAN NOT NULL
);

CREATE TABLE Order(
memberID INTEGER REFERENCES Members(memberID),
bookID INTEGER REFERENCES Books(bookID),
orderDate DATE NOT NULL,
quantity INTEGER NOT NULL,
PRIMARY KEY (memberID, bookID, orderDate)
);

CREATE TABLE Review(
reviewerID INTEGER REFERENCES Members(memberID),
bookID INTEGER REFERENCES Books(bookID),
reviewDate DATE NOT NULL,
reviewStars INTEGER CHECK (0 <= reviewStars <= 5)
);



