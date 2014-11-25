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
 * Listener that is notified of tariff table changes.
 */
public interface TariffListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a TariffBean record into the database.
     *
     * @param pObject the TariffBean that is about to be inserted
     */
    public void beforeInsert(TariffBean pObject) throws SQLException;


    /**
     * Invoked just after a TariffBean record is inserted in the database.
     *
     * @param pObject the TariffBean that was just inserted
     */
    public void afterInsert(TariffBean pObject) throws SQLException;


    /**
     * Invoked just before updating a TariffBean record in the database.
     *
     * @param pObject the TariffBean that is about to be updated
     */
    public void beforeUpdate(TariffBean pObject) throws SQLException;


    /**
     * Invoked just after updating a TariffBean record in the database.
     *
     * @param pObject the TariffBean that was just updated
     */
    public void afterUpdate(TariffBean pObject) throws SQLException;


// class+ 

// class- 

}