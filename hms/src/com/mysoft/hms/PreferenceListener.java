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
 * Listener that is notified of preference table changes.
 */
public interface PreferenceListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a PreferenceBean record into the database.
     *
     * @param pObject the PreferenceBean that is about to be inserted
     */
    public void beforeInsert(PreferenceBean pObject) throws SQLException;


    /**
     * Invoked just after a PreferenceBean record is inserted in the database.
     *
     * @param pObject the PreferenceBean that was just inserted
     */
    public void afterInsert(PreferenceBean pObject) throws SQLException;


    /**
     * Invoked just before updating a PreferenceBean record in the database.
     *
     * @param pObject the PreferenceBean that is about to be updated
     */
    public void beforeUpdate(PreferenceBean pObject) throws SQLException;


    /**
     * Invoked just after updating a PreferenceBean record in the database.
     *
     * @param pObject the PreferenceBean that was just updated
     */
    public void afterUpdate(PreferenceBean pObject) throws SQLException;


// class+ 

// class- 

}
