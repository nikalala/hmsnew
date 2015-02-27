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
 * Listener that is notified of workorderlog table changes.
 */
public interface WorkorderlogListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a WorkorderlogBean record into the database.
     *
     * @param pObject the WorkorderlogBean that is about to be inserted
     */
    public void beforeInsert(WorkorderlogBean pObject) throws SQLException;


    /**
     * Invoked just after a WorkorderlogBean record is inserted in the database.
     *
     * @param pObject the WorkorderlogBean that was just inserted
     */
    public void afterInsert(WorkorderlogBean pObject) throws SQLException;


    /**
     * Invoked just before updating a WorkorderlogBean record in the database.
     *
     * @param pObject the WorkorderlogBean that is about to be updated
     */
    public void beforeUpdate(WorkorderlogBean pObject) throws SQLException;


    /**
     * Invoked just after updating a WorkorderlogBean record in the database.
     *
     * @param pObject the WorkorderlogBean that was just updated
     */
    public void afterUpdate(WorkorderlogBean pObject) throws SQLException;


// class+ 

// class- 

}
