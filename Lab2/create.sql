-- Using lab 1 solution 

DROP SCHEMA Lab2 CASCADE ;
CREATE SCHEMA Lab2 ;

CREATE TABLE Authors (
  authorID          INTEGER 	NOT NULL PRIMARY KEY,
  authorName        VARCHAR(30),
  address           VARCHAR(30),
  numBooksWritten   INTEGER,
  mostRecentPubDate DATE
) ;


CREATE TABLE Books (
  bookID        CHAR(6) 	NOT NULL PRIMARY KEY,
  authorID      INTEGER 	NOT NULL,
  bookName      VARCHAR(30) 	UNIQUE,
  publisherID   INTEGER 	NOT NULL,
  pubDate       DATE,
  price         DECIMAL(6,2),
  category      CHAR(1),
  lastOrderDate DATE,
  totalOrdered  INTEGER
) ;


CREATE TABLE Publishers (
  publisherID   INTEGER		NOT NULL PRIMARY KEY,
  publisherName VARCHAR(30)	UNIQUE,
  address       VARCHAR(30)
) ;


CREATE TABLE Members (
  memberID        INTEGER 	NOT NULL PRIMARY KEY,
  memberName      VARCHAR(30)	UNIQUE,
  joinDate        DATE		UNIQUE,
  renewalDate     DATE,
  isCurrentMember BOOLEAN
) ;


CREATE TABLE Orders (
  memberID  INTEGER 		NOT NULL,
  bookID    CHAR(6)		NOT NULL,
  orderDate DATE		NOT NULL,
  quantity  INTEGER		NOT NULL,
  PRIMARY KEY (memberID, bookID, orderDate)
) ;


CREATE TABLE Reviews (
  reviewerID  INTEGER		NOT NULL,
  bookID      CHAR(6)		NOT NULL,
  reviewDate  DATE,
  reviewStars INTEGER		NOT NULL,
  PRIMARY KEY (reviewerID, bookID)
) ;


