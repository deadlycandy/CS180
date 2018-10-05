/* create.sql is a script to create the schema and tables required for lab 1*/

DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;


/*Defining tables for Niles Books: Authors, Books, Publishers, Memebers, Orders, and Review */

CREATE TABLE Authors(
authorID INTEGER PRIMARY KEY,
authorName VARCHAR (30),
address VARCHAR (30),
numBooksWritten INTEGER,
mostRecentPubDate DATE
);

CREATE TABLE Books(
bookID VARCHAR (6) PRIMARY KEY,
authorID INTEGER,
bookName VARCHAR (30),
publisherID INTEGER,
pubDate DATE,
price DECIMAL (6,2),
category CHAR (1),
lastOrderDate DATE,
totalOrder INTEGER
);

CREATE TABLE Publishers(
publisherID INTEGER PRIMARY KEY,
publisherName VARCHAR (30), 
address VARCHAR (30)
);

CREATE TABLE Members(
memberID INTEGER PRIMARY KEY,
memberName VARCHAR (30), 
joinDate DATE,
renewalDate DATE,
isCurrentMember BOOLEAN
);

CREATE TABLE Orders(
memberID INTEGER,
bookID VARCHAR (6),
orderDate DATE,
quantity INTEGER,
PRIMARY KEY (memberID, bookID, orderDate)
);

CREATE TABLE Reviews(
reviewerID INTEGER,
bookID VARCHAR(6),
reviewDate DATE,
reviewStars INTEGER
);



