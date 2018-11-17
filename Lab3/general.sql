/* Adding general constraints to table */

ALTER TABLE Orders
ADD CONSTRAINT positive_quanity CHECK (quantity >= 0);

ALTER TABLE Books
ADD CONSTRAINT recent_order CHECK (lastOrderDate >= pubDate);

ALTER TABLE Members
ADD CONSTRAINT member_status CHECK ((joinDate IS NOT NULL AND isCurrentMember IS NOT NULL) OR (joinDate IS NULL AND isCurrentMember IS NULL));

