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
 * Listener that is notified of roomrate table changes.
 */
public interface RoomrateListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a RoomrateBean record into the database.
     *
     * @param pObject the RoomrateBean that is about to be inserted
     */
    public void beforeInsert(RoomrateBean pObject) throws SQLException;


    /**
     * Invoked just after a RoomrateBean record is inserted in the database.
     *
     * @param pObject the RoomrateBean that was just inserted
     */
    public void afterInsert(RoomrateBean pObject) throws SQLException;


    /**
     * Invoked just before updating a RoomrateBean record in the database.
     *
     * @param pObject the RoomrateBean that is about to be updated
     */
    public void beforeUpdate(RoomrateBean pObject) throws SQLException;


    /**
     * Invoked just after updating a RoomrateBean record in the database.
     *
     * @param pObject the RoomrateBean that was just updated
     */
    public void afterUpdate(RoomrateBean pObject) throws SQLException;


// class+ 

// class- 

}
