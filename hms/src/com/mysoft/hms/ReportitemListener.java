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
 * Listener that is notified of reportitem table changes.
 */
public interface ReportitemListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ReportitemBean record into the database.
     *
     * @param pObject the ReportitemBean that is about to be inserted
     */
    public void beforeInsert(ReportitemBean pObject) throws SQLException;


    /**
     * Invoked just after a ReportitemBean record is inserted in the database.
     *
     * @param pObject the ReportitemBean that was just inserted
     */
    public void afterInsert(ReportitemBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ReportitemBean record in the database.
     *
     * @param pObject the ReportitemBean that is about to be updated
     */
    public void beforeUpdate(ReportitemBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ReportitemBean record in the database.
     *
     * @param pObject the ReportitemBean that was just updated
     */
    public void afterUpdate(ReportitemBean pObject) throws SQLException;


// class+ 

// class- 

}
