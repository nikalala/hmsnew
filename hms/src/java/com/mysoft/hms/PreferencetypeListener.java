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
 * Listener that is notified of preferencetype table changes.
 */
public interface PreferencetypeListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a PreferencetypeBean record into the database.
     *
     * @param pObject the PreferencetypeBean that is about to be inserted
     */
    public void beforeInsert(PreferencetypeBean pObject) throws SQLException;


    /**
     * Invoked just after a PreferencetypeBean record is inserted in the database.
     *
     * @param pObject the PreferencetypeBean that was just inserted
     */
    public void afterInsert(PreferencetypeBean pObject) throws SQLException;


    /**
     * Invoked just before updating a PreferencetypeBean record in the database.
     *
     * @param pObject the PreferencetypeBean that is about to be updated
     */
    public void beforeUpdate(PreferencetypeBean pObject) throws SQLException;


    /**
     * Invoked just after updating a PreferencetypeBean record in the database.
     *
     * @param pObject the PreferencetypeBean that was just updated
     */
    public void afterUpdate(PreferencetypeBean pObject) throws SQLException;


// class+ 

// class- 
}
