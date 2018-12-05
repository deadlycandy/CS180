CREATE FUNCTION increasePricesFunction(thePublisherID int, theCount int) RETURNS int AS $$
DECLARE
    counter int := 0;
    booksUpdated int := 0;
    ctgry char;
    cost real;
    bID varchar(6);
    c CURSOR FOR
        SELECT bookID, category, price
        FROM Books
        WHERE publisherID = thePublisherID
        ORDER BY price DESC;

BEGIN
OPEN c;

FOR counter IN 1..theCount LOOP
    FETCH c INTO bID, ctgry, cost;
    RAISE NOTICE '%', bID;
    RAISE NOTICE '%', ctgry;
    RAISE NOTICE '%', cost;

    IF bID = NULL THEN EXIT; END IF;
    IF ctgry = 'F' THEN
        UPDATE Books
        SET price = price + 2.50
        WHERE bookID = bID;
        booksUpdated = booksUpdated + 1;
    ELSEIF ctgry = 'N' THEN
        UPDATE Books
        SET price = price + 1.50
        WHERE bookID = bID;
        booksUpdated = booksUpdated + 1;
    END IF;

END LOOP;

CLOSE c;

RETURN booksUpdated;

END; $$
LANGUAGE PLPGSQL;
