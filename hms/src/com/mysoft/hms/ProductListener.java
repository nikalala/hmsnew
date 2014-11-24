// --------------------------------------------------------
// Generated by sql2java - http://sql2java.sourceforge.net/
// jdbc driver used at code generation time: org.postgresql.Driver
// 
// Please help us improve this tool by reporting:
//    problems,
//    suggestions,
//    feedbacks,
//    ideas,
//  to http://sourceforge.net/projects/sql2java/
// --------------------------------------------------------

package com.mysoft.hms;

import java.sql.SQLException;
// imports+ 

// imports- 



/**
 * Listener that is notified of product table changes.
 */
public interface ProductListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ProductBean record into the database.
     *
     * @param pObject the ProductBean that is about to be inserted
     */
    public void beforeInsert(ProductBean pObject) throws SQLException;


    /**
     * Invoked just after a ProductBean record is inserted in the database.
     *
     * @param pObject the ProductBean that was just inserted
     */
    public void afterInsert(ProductBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ProductBean record in the database.
     *
     * @param pObject the ProductBean that is about to be updated
     */
    public void beforeUpdate(ProductBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ProductBean record in the database.
     *
     * @param pObject the ProductBean that was just updated
     */
    public void afterUpdate(ProductBean pObject) throws SQLException;


// class+ 

// class- 

}
