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
 * Listener that is notified of housekeepingstatus table changes.
 */
public interface HousekeepingstatusListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a HousekeepingstatusBean record into the database.
     *
     * @param pObject the HousekeepingstatusBean that is about to be inserted
     */
    public void beforeInsert(HousekeepingstatusBean pObject) throws SQLException;


    /**
     * Invoked just after a HousekeepingstatusBean record is inserted in the database.
     *
     * @param pObject the HousekeepingstatusBean that was just inserted
     */
    public void afterInsert(HousekeepingstatusBean pObject) throws SQLException;


    /**
     * Invoked just before updating a HousekeepingstatusBean record in the database.
     *
     * @param pObject the HousekeepingstatusBean that is about to be updated
     */
    public void beforeUpdate(HousekeepingstatusBean pObject) throws SQLException;


    /**
     * Invoked just after updating a HousekeepingstatusBean record in the database.
     *
     * @param pObject the HousekeepingstatusBean that was just updated
     */
    public void afterUpdate(HousekeepingstatusBean pObject) throws SQLException;


// class+ 

// class- 

}
