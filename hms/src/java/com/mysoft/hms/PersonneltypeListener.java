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
 * Listener that is notified of personneltype table changes.
 */
public interface PersonneltypeListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a PersonneltypeBean record into the database.
     *
     * @param pObject the PersonneltypeBean that is about to be inserted
     */
    public void beforeInsert(PersonneltypeBean pObject) throws SQLException;


    /**
     * Invoked just after a PersonneltypeBean record is inserted in the database.
     *
     * @param pObject the PersonneltypeBean that was just inserted
     */
    public void afterInsert(PersonneltypeBean pObject) throws SQLException;


    /**
     * Invoked just before updating a PersonneltypeBean record in the database.
     *
     * @param pObject the PersonneltypeBean that is about to be updated
     */
    public void beforeUpdate(PersonneltypeBean pObject) throws SQLException;


    /**
     * Invoked just after updating a PersonneltypeBean record in the database.
     *
     * @param pObject the PersonneltypeBean that was just updated
     */
    public void afterUpdate(PersonneltypeBean pObject) throws SQLException;


// class+ 

// class- 

}