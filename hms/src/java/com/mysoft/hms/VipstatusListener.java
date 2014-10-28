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
 * Listener that is notified of vipstatus table changes.
 */
public interface VipstatusListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a VipstatusBean record into the database.
     *
     * @param pObject the VipstatusBean that is about to be inserted
     */
    public void beforeInsert(VipstatusBean pObject) throws SQLException;


    /**
     * Invoked just after a VipstatusBean record is inserted in the database.
     *
     * @param pObject the VipstatusBean that was just inserted
     */
    public void afterInsert(VipstatusBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VipstatusBean record in the database.
     *
     * @param pObject the VipstatusBean that is about to be updated
     */
    public void beforeUpdate(VipstatusBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VipstatusBean record in the database.
     *
     * @param pObject the VipstatusBean that was just updated
     */
    public void afterUpdate(VipstatusBean pObject) throws SQLException;


// class+ 

// class- 
}
