/* Combining tuples from NewMemberships into Memebers */

/* updating for existing members*/
BEGIN;
UPDATE Members
SET memberName = newM.memberName, renewalDate = newM.renewalDate, isCurrentMember = TRUE
FROM NewMemberships AS newM
WHERE Members.memberID = newM.memberID;
COMMIT;

/*inserting new members*/
BEGIN;
INSERT INTO Members(memberID, memberName, joinDate, renewalDate, isCurrentMember)
SELECT memberID, memberName, CURRENT_DATE, renewalDate, TRUE
FROM NewMemberships AS newM
WHERE memberID NOT IN 
                (SELECT memberID
                 FROM Members);
COMMIT;
