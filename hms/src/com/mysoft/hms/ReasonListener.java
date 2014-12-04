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
 * Listener that is notified of reason table changes.
 */
public interface ReasonListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ReasonBean record into the database.
     *
     * @param pObject the ReasonBean that is about to be inserted
     */
    public void beforeInsert(ReasonBean pObject) throws SQLException;


    /**
     * Invoked just after a ReasonBean record is inserted in the database.
     *
     * @param pObject the ReasonBean that was just inserted
     */
    public void afterInsert(ReasonBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ReasonBean record in the database.
     *
     * @param pObject the ReasonBean that is about to be updated
     */
    public void beforeUpdate(ReasonBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ReasonBean record in the database.
     *
     * @param pObject the ReasonBean that was just updated
     */
    public void afterUpdate(ReasonBean pObject) throws SQLException;


// class+ 

// class- 

}
