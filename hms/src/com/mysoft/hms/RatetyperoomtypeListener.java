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
 * Listener that is notified of ratetyperoomtype table changes.
 */
public interface RatetyperoomtypeListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a RatetyperoomtypeBean record into the database.
     *
     * @param pObject the RatetyperoomtypeBean that is about to be inserted
     */
    public void beforeInsert(RatetyperoomtypeBean pObject) throws SQLException;


    /**
     * Invoked just after a RatetyperoomtypeBean record is inserted in the database.
     *
     * @param pObject the RatetyperoomtypeBean that was just inserted
     */
    public void afterInsert(RatetyperoomtypeBean pObject) throws SQLException;


    /**
     * Invoked just before updating a RatetyperoomtypeBean record in the database.
     *
     * @param pObject the RatetyperoomtypeBean that is about to be updated
     */
    public void beforeUpdate(RatetyperoomtypeBean pObject) throws SQLException;


    /**
     * Invoked just after updating a RatetyperoomtypeBean record in the database.
     *
     * @param pObject the RatetyperoomtypeBean that was just updated
     */
    public void afterUpdate(RatetyperoomtypeBean pObject) throws SQLException;


// class+ 

// class- 

}
