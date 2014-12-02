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
 * Listener that is notified of ratetype table changes.
 */
public interface RatetypeListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a RatetypeBean record into the database.
     *
     * @param pObject the RatetypeBean that is about to be inserted
     */
    public void beforeInsert(RatetypeBean pObject) throws SQLException;


    /**
     * Invoked just after a RatetypeBean record is inserted in the database.
     *
     * @param pObject the RatetypeBean that was just inserted
     */
    public void afterInsert(RatetypeBean pObject) throws SQLException;


    /**
     * Invoked just before updating a RatetypeBean record in the database.
     *
     * @param pObject the RatetypeBean that is about to be updated
     */
    public void beforeUpdate(RatetypeBean pObject) throws SQLException;


    /**
     * Invoked just after updating a RatetypeBean record in the database.
     *
     * @param pObject the RatetypeBean that was just updated
     */
    public void afterUpdate(RatetypeBean pObject) throws SQLException;


// class+ 

// class- 

}
