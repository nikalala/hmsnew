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
 * Listener that is notified of nationality table changes.
 */
public interface NationalityListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a NationalityBean record into the database.
     *
     * @param pObject the NationalityBean that is about to be inserted
     */
    public void beforeInsert(NationalityBean pObject) throws SQLException;


    /**
     * Invoked just after a NationalityBean record is inserted in the database.
     *
     * @param pObject the NationalityBean that was just inserted
     */
    public void afterInsert(NationalityBean pObject) throws SQLException;


    /**
     * Invoked just before updating a NationalityBean record in the database.
     *
     * @param pObject the NationalityBean that is about to be updated
     */
    public void beforeUpdate(NationalityBean pObject) throws SQLException;


    /**
     * Invoked just after updating a NationalityBean record in the database.
     *
     * @param pObject the NationalityBean that was just updated
     */
    public void afterUpdate(NationalityBean pObject) throws SQLException;


// class+ 

// class- 

}