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
 * Listener that is notified of extrachargetax table changes.
 */
public interface ExtrachargetaxListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a ExtrachargetaxBean record into the database.
     *
     * @param pObject the ExtrachargetaxBean that is about to be inserted
     */
    public void beforeInsert(ExtrachargetaxBean pObject) throws SQLException;


    /**
     * Invoked just after a ExtrachargetaxBean record is inserted in the database.
     *
     * @param pObject the ExtrachargetaxBean that was just inserted
     */
    public void afterInsert(ExtrachargetaxBean pObject) throws SQLException;


    /**
     * Invoked just before updating a ExtrachargetaxBean record in the database.
     *
     * @param pObject the ExtrachargetaxBean that is about to be updated
     */
    public void beforeUpdate(ExtrachargetaxBean pObject) throws SQLException;


    /**
     * Invoked just after updating a ExtrachargetaxBean record in the database.
     *
     * @param pObject the ExtrachargetaxBean that was just updated
     */
    public void afterUpdate(ExtrachargetaxBean pObject) throws SQLException;


// class+ 

// class- 
}
