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
 * Listener that is notified of reservationdiscount table changes.
 */
public interface ReservationdiscountListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a ReservationdiscountBean record into the database.
     *
     * @param pObject the ReservationdiscountBean that is about to be inserted
     */
    public void beforeInsert(ReservationdiscountBean pObject) throws SQLException;


    /**
     * Invoked just after a ReservationdiscountBean record is inserted in the database.
     *
     * @param pObject the ReservationdiscountBean that was just inserted
     */
    public void afterInsert(ReservationdiscountBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ReservationdiscountBean record in the database.
     *
     * @param pObject the ReservationdiscountBean that is about to be updated
     */
    public void beforeUpdate(ReservationdiscountBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ReservationdiscountBean record in the database.
     *
     * @param pObject the ReservationdiscountBean that was just updated
     */
    public void afterUpdate(ReservationdiscountBean pObject) throws SQLException;


// class+ 

// class- 

}
