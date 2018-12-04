CREATE FUNCTION increasePricesFunction(thePublisherID int, theCount int) RETURNS int AS $$
DECLARE
    counter int := 0;
    bID varchar(6);
    c CURSOR FOR
        SELECT bookID
        FROM Books
        WHERE publisherID = thePublisherID;
BEGIN
OPEN c;

FOR counter IN 1..theCount LOOP
    FETCH c INTO bID;
    RAISE NOTICE '%',bID;
END LOOP;
RETURN counter;

END; $$
LANGUAGE PLPGSQL;
