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
 * Listener that is notified of v_bcancelled table changes.
 */
public interface VBcancelledListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a VBcancelledBean record into the database.
     *
     * @param pObject the VBcancelledBean that is about to be inserted
     */
    public void beforeInsert(VBcancelledBean pObject) throws SQLException;


    /**
     * Invoked just after a VBcancelledBean record is inserted in the database.
     *
     * @param pObject the VBcancelledBean that was just inserted
     */
    public void afterInsert(VBcancelledBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VBcancelledBean record in the database.
     *
     * @param pObject the VBcancelledBean that is about to be updated
     */
    public void beforeUpdate(VBcancelledBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VBcancelledBean record in the database.
     *
     * @param pObject the VBcancelledBean that was just updated
     */
    public void afterUpdate(VBcancelledBean pObject) throws SQLException;


// class+ 

// class- 

}