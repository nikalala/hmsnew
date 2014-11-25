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
 * Listener that is notified of tax table changes.
 */
public interface TaxListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a TaxBean record into the database.
     *
     * @param pObject the TaxBean that is about to be inserted
     */
    public void beforeInsert(TaxBean pObject) throws SQLException;


    /**
     * Invoked just after a TaxBean record is inserted in the database.
     *
     * @param pObject the TaxBean that was just inserted
     */
    public void afterInsert(TaxBean pObject) throws SQLException;


    /**
     * Invoked just before updating a TaxBean record in the database.
     *
     * @param pObject the TaxBean that is about to be updated
     */
    public void beforeUpdate(TaxBean pObject) throws SQLException;


    /**
     * Invoked just after updating a TaxBean record in the database.
     *
     * @param pObject the TaxBean that was just updated
     */
    public void afterUpdate(TaxBean pObject) throws SQLException;


// class+ 

// class- 

}