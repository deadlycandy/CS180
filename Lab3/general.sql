/* Adding general constraints to table */

ALTER TABLE Orders
ADD CONSTRAINT positive_quanity CHECK quanity >= 0;

ALTER TABLE Books
ADD CONSTRAINT recent_order CHECK lastOrderDate >= pubDate;

ALTER TABLE Members
ADD CONSTRAINT member_status CHECK joinDate is NULL AND isCurrentMember is NULL;
