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
 * Listener that is notified of v_sharer_2 table changes.
 */
public interface VSharer2Listener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a VSharer2Bean record into the database.
     *
     * @param pObject the VSharer2Bean that is about to be inserted
     */
    public void beforeInsert(VSharer2Bean pObject) throws SQLException;


    /**
     * Invoked just after a VSharer2Bean record is inserted in the database.
     *
     * @param pObject the VSharer2Bean that was just inserted
     */
    public void afterInsert(VSharer2Bean pObject) throws SQLException;


    /**
     * Invoked just before updating a VSharer2Bean record in the database.
     *
     * @param pObject the VSharer2Bean that is about to be updated
     */
    public void beforeUpdate(VSharer2Bean pObject) throws SQLException;


    /**
     * Invoked just after updating a VSharer2Bean record in the database.
     *
     * @param pObject the VSharer2Bean that was just updated
     */
    public void afterUpdate(VSharer2Bean pObject) throws SQLException;


// class+ 

// class- 

}
