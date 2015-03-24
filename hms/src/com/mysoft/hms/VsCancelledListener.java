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
 * Listener that is notified of vs_cancelled table changes.
 */
public interface VsCancelledListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a VsCancelledBean record into the database.
     *
     * @param pObject the VsCancelledBean that is about to be inserted
     */
    public void beforeInsert(VsCancelledBean pObject) throws SQLException;


    /**
     * Invoked just after a VsCancelledBean record is inserted in the database.
     *
     * @param pObject the VsCancelledBean that was just inserted
     */
    public void afterInsert(VsCancelledBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VsCancelledBean record in the database.
     *
     * @param pObject the VsCancelledBean that is about to be updated
     */
    public void beforeUpdate(VsCancelledBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VsCancelledBean record in the database.
     *
     * @param pObject the VsCancelledBean that was just updated
     */
    public void afterUpdate(VsCancelledBean pObject) throws SQLException;


// class+ 

// class- 

}