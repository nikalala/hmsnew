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
 * Listener that is notified of tariffroomtype table changes.
 */
public interface TariffroomtypeListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a TariffroomtypeBean record into the database.
     *
     * @param pObject the TariffroomtypeBean that is about to be inserted
     */
    public void beforeInsert(TariffroomtypeBean pObject) throws SQLException;


    /**
     * Invoked just after a TariffroomtypeBean record is inserted in the database.
     *
     * @param pObject the TariffroomtypeBean that was just inserted
     */
    public void afterInsert(TariffroomtypeBean pObject) throws SQLException;


    /**
     * Invoked just before updating a TariffroomtypeBean record in the database.
     *
     * @param pObject the TariffroomtypeBean that is about to be updated
     */
    public void beforeUpdate(TariffroomtypeBean pObject) throws SQLException;


    /**
     * Invoked just after updating a TariffroomtypeBean record in the database.
     *
     * @param pObject the TariffroomtypeBean that was just updated
     */
    public void afterUpdate(TariffroomtypeBean pObject) throws SQLException;


// class+ 

// class- 

}
