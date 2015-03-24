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
 * Listener that is notified of vs_cityledger table changes.
 */
public interface VsCityledgerListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a VsCityledgerBean record into the database.
     *
     * @param pObject the VsCityledgerBean that is about to be inserted
     */
    public void beforeInsert(VsCityledgerBean pObject) throws SQLException;


    /**
     * Invoked just after a VsCityledgerBean record is inserted in the database.
     *
     * @param pObject the VsCityledgerBean that was just inserted
     */
    public void afterInsert(VsCityledgerBean pObject) throws SQLException;


    /**
     * Invoked just before updating a VsCityledgerBean record in the database.
     *
     * @param pObject the VsCityledgerBean that is about to be updated
     */
    public void beforeUpdate(VsCityledgerBean pObject) throws SQLException;


    /**
     * Invoked just after updating a VsCityledgerBean record in the database.
     *
     * @param pObject the VsCityledgerBean that was just updated
     */
    public void afterUpdate(VsCityledgerBean pObject) throws SQLException;


// class+ 

// class- 

}