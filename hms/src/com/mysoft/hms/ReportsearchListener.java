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
 * Listener that is notified of reportsearch table changes.
 */
public interface ReportsearchListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ReportsearchBean record into the database.
     *
     * @param pObject the ReportsearchBean that is about to be inserted
     */
    public void beforeInsert(ReportsearchBean pObject) throws SQLException;


    /**
     * Invoked just after a ReportsearchBean record is inserted in the database.
     *
     * @param pObject the ReportsearchBean that was just inserted
     */
    public void afterInsert(ReportsearchBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ReportsearchBean record in the database.
     *
     * @param pObject the ReportsearchBean that is about to be updated
     */
    public void beforeUpdate(ReportsearchBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ReportsearchBean record in the database.
     *
     * @param pObject the ReportsearchBean that was just updated
     */
    public void afterUpdate(ReportsearchBean pObject) throws SQLException;


// class+ 

// class- 

}
