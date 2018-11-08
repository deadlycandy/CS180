/* 
Output the quantity and orderDate for each order that was made by a member 
whose isCurrentMember is TRUE. 
The second attribute in your result should appear as oDate. Duplicates may appear in your result. 
*/

SELECT quantity AS "Quanitity", orderDate AS "Order Date"
FROM Members AS m, Orders AS o
WHERE m.isCurrentMember AND (m.memberID = o.memberID);




