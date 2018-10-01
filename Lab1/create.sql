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
mostRecentPubDate DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Books(
bookID VARCHAR (6) PRIMARY KEY,
authorID INTEGER REFERENCES Authors(authorID),
bookName VARCHAR (30) NOT NULL,
publisherID INTEGER REFERENCES Publishers(publisherID),
pubDate DATE NOT NULL DEFAULT CURRENT_DATE,
price NUMERIC (4,2) NOT NULL,
category CHAR (1) NOT NULL,
lastOrderDate DATE NOT NULL DEFAULT CURRENT_DATE,
totalOrder INTEGER CHECK (totalOrder >= 0)
);

CREATE TABLE Publishers(
publisherID INTEGER PRIMARY KEY,
publisherName VARCHAR (30) NOT NULL, 
address VARCHAR (30) NOT NULL
);




