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
 * Listener that is notified of salutation table changes.
 */
public interface SalutationListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a SalutationBean record into the database.
     *
     * @param pObject the SalutationBean that is about to be inserted
     */
    public void beforeInsert(SalutationBean pObject) throws SQLException;


    /**
     * Invoked just after a SalutationBean record is inserted in the database.
     *
     * @param pObject the SalutationBean that was just inserted
     */
    public void afterInsert(SalutationBean pObject) throws SQLException;


    /**
     * Invoked just before updating a SalutationBean record in the database.
     *
     * @param pObject the SalutationBean that is about to be updated
     */
    public void beforeUpdate(SalutationBean pObject) throws SQLException;


    /**
     * Invoked just after updating a SalutationBean record in the database.
     *
     * @param pObject the SalutationBean that was just updated
     */
    public void afterUpdate(SalutationBean pObject) throws SQLException;


// class+ 

// class- 

}
