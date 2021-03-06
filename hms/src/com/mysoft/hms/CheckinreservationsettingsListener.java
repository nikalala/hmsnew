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
 * Listener that is notified of checkinreservationsettings table changes.
 */
public interface CheckinreservationsettingsListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a CheckinreservationsettingsBean record into the database.
     *
     * @param pObject the CheckinreservationsettingsBean that is about to be inserted
     */
    public void beforeInsert(CheckinreservationsettingsBean pObject) throws SQLException;


    /**
     * Invoked just after a CheckinreservationsettingsBean record is inserted in the database.
     *
     * @param pObject the CheckinreservationsettingsBean that was just inserted
     */
    public void afterInsert(CheckinreservationsettingsBean pObject) throws SQLException;


    /**
     * Invoked just before updating a CheckinreservationsettingsBean record in the database.
     *
     * @param pObject the CheckinreservationsettingsBean that is about to be updated
     */
    public void beforeUpdate(CheckinreservationsettingsBean pObject) throws SQLException;


    /**
     * Invoked just after updating a CheckinreservationsettingsBean record in the database.
     *
     * @param pObject the CheckinreservationsettingsBean that was just updated
     */
    public void afterUpdate(CheckinreservationsettingsBean pObject) throws SQLException;


// class+ 

// class- 

}
