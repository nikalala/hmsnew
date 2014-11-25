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
 * Listener that is notified of sproduct table changes.
 */
public interface SproductListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a SproductBean record into the database.
     *
     * @param pObject the SproductBean that is about to be inserted
     */
    public void beforeInsert(SproductBean pObject) throws SQLException;


    /**
     * Invoked just after a SproductBean record is inserted in the database.
     *
     * @param pObject the SproductBean that was just inserted
     */
    public void afterInsert(SproductBean pObject) throws SQLException;


    /**
     * Invoked just before updating a SproductBean record in the database.
     *
     * @param pObject the SproductBean that is about to be updated
     */
    public void beforeUpdate(SproductBean pObject) throws SQLException;


    /**
     * Invoked just after updating a SproductBean record in the database.
     *
     * @param pObject the SproductBean that was just updated
     */
    public void afterUpdate(SproductBean pObject) throws SQLException;


// class+ 

// class- 

}