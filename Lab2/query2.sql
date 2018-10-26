/* 
Output the quantity and orderDate for each order that was made by a member 
whose isCurrentMember is TRUE. 
The second attribute in your result should appear as oDate. Duplicates may appear in your result. 
*/

SELECT isCurrentMember AS "Current Member", orderDate AS "Order Date", quantity AS "Quantity"
FROM Members AS m, Orders AS o
WHERE m.isCurrentMember and (m.memberID = o.memberID);




