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
 * Listener that is notified of v_deplist table changes.
 */
public interface VDeplistListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a VDeplistBean record into the database.
     *
     * @param pObject the VDeplistBean that is about to be inserted
     */
    public void beforeInsert(VDeplistBean pObject) throws SQLException;


    /**
     * Invoked just after a VDeplistBean record is inserted in the database.
     *
     * @param pObject the VDeplistBean that was just inserted
     */
    public void afterInsert(VDeplistBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VDeplistBean record in the database.
     *
     * @param pObject the VDeplistBean that is about to be updated
     */
    public void beforeUpdate(VDeplistBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VDeplistBean record in the database.
     *
     * @param pObject the VDeplistBean that was just updated
     */
    public void afterUpdate(VDeplistBean pObject) throws SQLException;


// class+ 

// class- 
}