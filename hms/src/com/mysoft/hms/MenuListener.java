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
 * Listener that is notified of menu table changes.
 */
public interface MenuListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a MenuBean record into the database.
     *
     * @param pObject the MenuBean that is about to be inserted
     */
    public void beforeInsert(MenuBean pObject) throws SQLException;


    /**
     * Invoked just after a MenuBean record is inserted in the database.
     *
     * @param pObject the MenuBean that was just inserted
     */
    public void afterInsert(MenuBean pObject) throws SQLException;


    /**
     * Invoked just before updating a MenuBean record in the database.
     *
     * @param pObject the MenuBean that is about to be updated
     */
    public void beforeUpdate(MenuBean pObject) throws SQLException;


    /**
     * Invoked just after updating a MenuBean record in the database.
     *
     * @param pObject the MenuBean that was just updated
     */
    public void afterUpdate(MenuBean pObject) throws SQLException;


// class+ 

// class- 

}
