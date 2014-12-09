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
 * Listener that is notified of taxsequence table changes.
 */
public interface TaxsequenceListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a TaxsequenceBean record into the database.
     *
     * @param pObject the TaxsequenceBean that is about to be inserted
     */
    public void beforeInsert(TaxsequenceBean pObject) throws SQLException;


    /**
     * Invoked just after a TaxsequenceBean record is inserted in the database.
     *
     * @param pObject the TaxsequenceBean that was just inserted
     */
    public void afterInsert(TaxsequenceBean pObject) throws SQLException;


    /**
     * Invoked just before updating a TaxsequenceBean record in the database.
     *
     * @param pObject the TaxsequenceBean that is about to be updated
     */
    public void beforeUpdate(TaxsequenceBean pObject) throws SQLException;


    /**
     * Invoked just after updating a TaxsequenceBean record in the database.
     *
     * @param pObject the TaxsequenceBean that was just updated
     */
    public void afterUpdate(TaxsequenceBean pObject) throws SQLException;


// class+ 

// class- 

}