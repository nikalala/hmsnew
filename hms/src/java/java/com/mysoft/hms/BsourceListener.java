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
 * Listener that is notified of bsource table changes.
 */
public interface BsourceListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a BsourceBean record into the database.
     *
     * @param pObject the BsourceBean that is about to be inserted
     */
    public void beforeInsert(BsourceBean pObject) throws SQLException;


    /**
     * Invoked just after a BsourceBean record is inserted in the database.
     *
     * @param pObject the BsourceBean that was just inserted
     */
    public void afterInsert(BsourceBean pObject) throws SQLException;


    /**
     * Invoked just before updating a BsourceBean record in the database.
     *
     * @param pObject the BsourceBean that is about to be updated
     */
    public void beforeUpdate(BsourceBean pObject) throws SQLException;


    /**
     * Invoked just after updating a BsourceBean record in the database.
     *
     * @param pObject the BsourceBean that was just updated
     */
    public void afterUpdate(BsourceBean pObject) throws SQLException;


// class+ 

// class- 

}
