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
 * Listener that is notified of v_guestdblist table changes.
 */
public interface VGuestdblistListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a VGuestdblistBean record into the database.
     *
     * @param pObject the VGuestdblistBean that is about to be inserted
     */
    public void beforeInsert(VGuestdblistBean pObject) throws SQLException;


    /**
     * Invoked just after a VGuestdblistBean record is inserted in the database.
     *
     * @param pObject the VGuestdblistBean that was just inserted
     */
    public void afterInsert(VGuestdblistBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VGuestdblistBean record in the database.
     *
     * @param pObject the VGuestdblistBean that is about to be updated
     */
    public void beforeUpdate(VGuestdblistBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VGuestdblistBean record in the database.
     *
     * @param pObject the VGuestdblistBean that was just updated
     */
    public void afterUpdate(VGuestdblistBean pObject) throws SQLException;


// class+ 

// class- 

}
