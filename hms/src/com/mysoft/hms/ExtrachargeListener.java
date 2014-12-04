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
 * Listener that is notified of extracharge table changes.
 */
public interface ExtrachargeListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ExtrachargeBean record into the database.
     *
     * @param pObject the ExtrachargeBean that is about to be inserted
     */
    public void beforeInsert(ExtrachargeBean pObject) throws SQLException;


    /**
     * Invoked just after a ExtrachargeBean record is inserted in the database.
     *
     * @param pObject the ExtrachargeBean that was just inserted
     */
    public void afterInsert(ExtrachargeBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ExtrachargeBean record in the database.
     *
     * @param pObject the ExtrachargeBean that is about to be updated
     */
    public void beforeUpdate(ExtrachargeBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ExtrachargeBean record in the database.
     *
     * @param pObject the ExtrachargeBean that was just updated
     */
    public void afterUpdate(ExtrachargeBean pObject) throws SQLException;


// class+ 

// class- 

}
