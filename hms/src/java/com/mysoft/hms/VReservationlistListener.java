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
 * Listener that is notified of v_reservationlist table changes.
 */
public interface VReservationlistListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a VReservationlistBean record into the database.
     *
     * @param pObject the VReservationlistBean that is about to be inserted
     */
    public void beforeInsert(VReservationlistBean pObject) throws SQLException;


    /**
     * Invoked just after a VReservationlistBean record is inserted in the database.
     *
     * @param pObject the VReservationlistBean that was just inserted
     */
    public void afterInsert(VReservationlistBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VReservationlistBean record in the database.
     *
     * @param pObject the VReservationlistBean that is about to be updated
     */
    public void beforeUpdate(VReservationlistBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VReservationlistBean record in the database.
     *
     * @param pObject the VReservationlistBean that was just updated
     */
    public void afterUpdate(VReservationlistBean pObject) throws SQLException;


// class+ 

// class- 
}
