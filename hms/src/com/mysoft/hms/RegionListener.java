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
 * Listener that is notified of region table changes.
 */
public interface RegionListener
// extends+ 

// extends- 

{
    /**
     * Invoked just before inserting a RegionBean record into the database.
     *
     * @param pObject the RegionBean that is about to be inserted
     */
    public void beforeInsert(RegionBean pObject) throws SQLException;


    /**
     * Invoked just after a RegionBean record is inserted in the database.
     *
     * @param pObject the RegionBean that was just inserted
     */
    public void afterInsert(RegionBean pObject) throws SQLException;


    /**
     * Invoked just before updating a RegionBean record in the database.
     *
     * @param pObject the RegionBean that is about to be updated
     */
    public void beforeUpdate(RegionBean pObject) throws SQLException;


    /**
     * Invoked just after updating a RegionBean record in the database.
     *
     * @param pObject the RegionBean that was just updated
     */
    public void afterUpdate(RegionBean pObject) throws SQLException;


// class+ 

// class- 

}
