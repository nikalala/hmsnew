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
 * Listener that is notified of room table changes.
 */
public interface RoomListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a RoomBean record into the database.
     *
     * @param pObject the RoomBean that is about to be inserted
     */
    public void beforeInsert(RoomBean pObject) throws SQLException;


    /**
     * Invoked just after a RoomBean record is inserted in the database.
     *
     * @param pObject the RoomBean that was just inserted
     */
    public void afterInsert(RoomBean pObject) throws SQLException;


    /**
     * Invoked just before updating a RoomBean record in the database.
     *
     * @param pObject the RoomBean that is about to be updated
     */
    public void beforeUpdate(RoomBean pObject) throws SQLException;


    /**
     * Invoked just after updating a RoomBean record in the database.
     *
     * @param pObject the RoomBean that was just updated
     */
    public void afterUpdate(RoomBean pObject) throws SQLException;


// class+ 

// class- 

}
