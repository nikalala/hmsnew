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
 * Listener that is notified of folioitem table changes.
 */
public interface FolioitemListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a FolioitemBean record into the database.
     *
     * @param pObject the FolioitemBean that is about to be inserted
     */
    public void beforeInsert(FolioitemBean pObject) throws SQLException;


    /**
     * Invoked just after a FolioitemBean record is inserted in the database.
     *
     * @param pObject the FolioitemBean that was just inserted
     */
    public void afterInsert(FolioitemBean pObject) throws SQLException;


    /**
     * Invoked just before updating a FolioitemBean record in the database.
     *
     * @param pObject the FolioitemBean that is about to be updated
     */
    public void beforeUpdate(FolioitemBean pObject) throws SQLException;


    /**
     * Invoked just after updating a FolioitemBean record in the database.
     *
     * @param pObject the FolioitemBean that was just updated
     */
    public void afterUpdate(FolioitemBean pObject) throws SQLException;


// class+ 

// class- 

}
