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
 * Listener that is notified of folio table changes.
 */
public interface FolioListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a FolioBean record into the database.
     *
     * @param pObject the FolioBean that is about to be inserted
     */
    public void beforeInsert(FolioBean pObject) throws SQLException;


    /**
     * Invoked just after a FolioBean record is inserted in the database.
     *
     * @param pObject the FolioBean that was just inserted
     */
    public void afterInsert(FolioBean pObject) throws SQLException;


    /**
     * Invoked just before updating a FolioBean record in the database.
     *
     * @param pObject the FolioBean that is about to be updated
     */
    public void beforeUpdate(FolioBean pObject) throws SQLException;


    /**
     * Invoked just after updating a FolioBean record in the database.
     *
     * @param pObject the FolioBean that was just updated
     */
    public void afterUpdate(FolioBean pObject) throws SQLException;


// class+ 

// class- 

}
