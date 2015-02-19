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
 * Listener that is notified of reservationroompickdrop table changes.
 */
public interface ReservationroompickdropListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a ReservationroompickdropBean record into the database.
     *
     * @param pObject the ReservationroompickdropBean that is about to be inserted
     */
    public void beforeInsert(ReservationroompickdropBean pObject) throws SQLException;


    /**
     * Invoked just after a ReservationroompickdropBean record is inserted in the database.
     *
     * @param pObject the ReservationroompickdropBean that was just inserted
     */
    public void afterInsert(ReservationroompickdropBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ReservationroompickdropBean record in the database.
     *
     * @param pObject the ReservationroompickdropBean that is about to be updated
     */
    public void beforeUpdate(ReservationroompickdropBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ReservationroompickdropBean record in the database.
     *
     * @param pObject the ReservationroompickdropBean that was just updated
     */
    public void afterUpdate(ReservationroompickdropBean pObject) throws SQLException;


// class+ 

// class- 
}
