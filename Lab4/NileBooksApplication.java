import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the NileBooks database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class NileBooksApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public NileBooksApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    /**
     * Takes as argument an integer called numberReviewedBooks.
     * Returns the authorID for each author in Authors that has at least numberReviewedBooks
     * different books that have at least one review.
     * If numberReviewedBooks is not positive, that's an error.
     */

    public List<Integer> getAuthorsWithManyReviewedBooks(int numberReviewedBooks)
    {
        //Throws Java error if numberReviewedBooks is less than 1 (aka not positive)
        if( numberReviewedBooks < 1)
        throw new java.lang.Error("numberReviewedBooks should be positive");
        List<Integer> result = new ArrayList<Integer>();

        //TRY Creating SQL query statement
        try{
            PreparedStatement AWMRB = connection.prepareStatement(
            "SELECT DISTINCT authorID "+
            "FROM Books AS b, Reviews AS r "+
            "WHERE b.bookID = r.bookID "+
            "GROUP BY  authorID "+
            "HAVING" + " COUNT(DISTINCT r.bookID) >= " + numberReviewedBooks
            );
            ResultSet authors = AWMRB.executeQuery();
            while(authors.next()){
                result.add(authors.getInt(1));
            }

        }catch(SQLException se){
            se.printStackTrace();
        }

        return result;
    }


    /**
     * The fixTotalOrdered method has one integer argument, aPublisherIDtoFix, which is a publisherID.
     * fixTotalOrdered should change the totalOrdered values for each “bad book” that was published
     * by aPublisherIDtoFix, updating totalOrdered so that it is correct, i.e., so that it’s equal
     * to the sum of the quantity values for the Orders of that book.
     * fixTotalOrdered should return the number of bad books whose totalOrdered values were “fixed”.
     *
     * This method is relatively easy to write if you use the BadBookTotals view from Lab3, which has
     * been provided to you in the lab4_create.sql script for this assignment.
     */

    public int fixTotalOrdered(int aPublisherIDtoFix)
    {
        int badBooksFixed = 0;

        //Uses BadBookTotals View to update Books table
        try{
            PreparedStatement bbt = connection.prepareStatement(
            "UPDATE Books b "+
            "SET totalOrdered = badQuantitySum "+
            "FROM BadBookTotals "+
            "WHERE b.bookID IN ( " +
            "SELECT bt.bookID "+
            "FROM BadBookTotals bt, Books b "+
            "WHERE publisherID = " + aPublisherIDtoFix + " AND bt.bookID = b.bookID)"
            );
            badBooksFixed = bbt.executeUpdate();

        }catch(SQLException se){
            se.printStackTrace();
        }
        return badBooksFixed;
    }


    /**
     * increasePublishersPrices has two integer parameters, thePublisherID and theCount, and invokes
     * a stored function increasePricesFunction that you will need to implement and store in the database
     * according to the description in Lab4 assignment.
     *
     * The increasePublishersPrices method must only invoke the stored function increasePricesFunction,
     * which does all of the assignment work; do not implement the increasePublishersPrices method using
     * a bunch of SQL statements through JDBC.  However, increasePublishersPrices should check to see
     * whether theCount is positive, and report an error if it’s not.
     *
     * increasePublishersPrices should return the same integer result as the increasePricesFunction
     * stored function.
     */

    public int increasePublishersPrices(int thePublisherID, int theCount)
    {
        // There's nothing special about the name storedFunctionResult
        if(theCount < 1)
        throw new java.lang.Error("theCount should be postive values")
        
        int storedFunctionResult = 0;

        // your code here


        // end of your code
        return storedFunctionResult;

    }

};
