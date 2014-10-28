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
 * Listener that is notified of payment table changes.
 */
public interface PaymentListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a PaymentBean record into the database.
     *
     * @param pObject the PaymentBean that is about to be inserted
     */
    public void beforeInsert(PaymentBean pObject) throws SQLException;


    /**
     * Invoked just after a PaymentBean record is inserted in the database.
     *
     * @param pObject the PaymentBean that was just inserted
     */
    public void afterInsert(PaymentBean pObject) throws SQLException;


    /**
     * Invoked just before updating a PaymentBean record in the database.
     *
     * @param pObject the PaymentBean that is about to be updated
     */
    public void beforeUpdate(PaymentBean pObject) throws SQLException;


    /**
     * Invoked just after updating a PaymentBean record in the database.
     *
     * @param pObject the PaymentBean that was just updated
     */
    public void afterUpdate(PaymentBean pObject) throws SQLException;


// class+ 

// class- 
}
