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
 * Listener that is notified of templatecategory table changes.
 */
public interface TemplatecategoryListener
// extends+ 

// extends- 
{
    /**
     * Invoked just before inserting a TemplatecategoryBean record into the database.
     *
     * @param pObject the TemplatecategoryBean that is about to be inserted
     */
    public void beforeInsert(TemplatecategoryBean pObject) throws SQLException;


    /**
     * Invoked just after a TemplatecategoryBean record is inserted in the database.
     *
     * @param pObject the TemplatecategoryBean that was just inserted
     */
    public void afterInsert(TemplatecategoryBean pObject) throws SQLException;


    /**
     * Invoked just before updating a TemplatecategoryBean record in the database.
     *
     * @param pObject the TemplatecategoryBean that is about to be updated
     */
    public void beforeUpdate(TemplatecategoryBean pObject) throws SQLException;


    /**
     * Invoked just after updating a TemplatecategoryBean record in the database.
     *
     * @param pObject the TemplatecategoryBean that was just updated
     */
    public void afterUpdate(TemplatecategoryBean pObject) throws SQLException;


// class+ 

// class- 
}
