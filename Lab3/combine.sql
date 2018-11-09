/* Combining tuples from NewMemberships into Memebers */

/* checking for existing members*/

UPDATE Members
SET memberName = newM.memberName, renewalDate = newM.renewalDate, isCurrentMember = TRUE
FROM NewMemberships AS newM
WHERE Members.memberID = newM.memberID;

/*checking for new members*/
INSERT INTO Members(memberID, memberName, joinDate, renewalDate, isCurrentMember)
SELECT memberID, memberName, CURRENT_DATE, renewalDate, TRUE
FROM NewMemberships AS newM
WHERE memberID NOT IN 
                (SELECT memberID
                 FROM Members);
