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
 * Listener that is notified of report table changes.
 */
public interface ReportListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ReportBean record into the database.
     *
     * @param pObject the ReportBean that is about to be inserted
     */
    public void beforeInsert(ReportBean pObject) throws SQLException;


    /**
     * Invoked just after a ReportBean record is inserted in the database.
     *
     * @param pObject the ReportBean that was just inserted
     */
    public void afterInsert(ReportBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ReportBean record in the database.
     *
     * @param pObject the ReportBean that is about to be updated
     */
    public void beforeUpdate(ReportBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ReportBean record in the database.
     *
     * @param pObject the ReportBean that was just updated
     */
    public void afterUpdate(ReportBean pObject) throws SQLException;


// class+ 

// class- 

}