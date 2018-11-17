/* Creating indexes over Orders bookID and memberID */

CREATE INDEX LookUpOrders ON Orders (bookID, memberID);
