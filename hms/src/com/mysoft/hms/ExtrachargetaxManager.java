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

import java.sql.*;
// imports+ 

// imports- 


/**
 * Handles database calls for the extrachargetax table.
 */
public class ExtrachargetaxManager
// extends+ 

// extends- 

{

    /**
     * Column extrachargeid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_EXTRACHARGEID = 0;
    public static final int TYPE_EXTRACHARGEID = Types.INTEGER;
    public static final String NAME_EXTRACHARGEID = "extrachargeid";

    /**
     * Column taxid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_TAXID = 1;
    public static final int TYPE_TAXID = Types.INTEGER;
    public static final String NAME_TAXID = "taxid";


    private static final String TABLE_NAME = "extrachargetax";

    /**
     * Create an array of type string containing all the fields of the extrachargetax table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "extrachargetax.extrachargeid"
        ,"extrachargetax.taxid"
    };

    /**
     * Field that contains the comma separated fields of the extrachargetax table.
     */
    private static final String ALL_FIELDS = "extrachargetax.extrachargeid"
                            + ",extrachargetax.taxid";

    private static ExtrachargetaxManager singleton = new ExtrachargetaxManager();

    /**
     * Get the ExtrachargetaxManager singleton.
     *
     * @return ExtrachargetaxManager 
     */
    synchronized public static ExtrachargetaxManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own ExtrachargetaxManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(ExtrachargetaxManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new ExtrachargetaxBean instance.
     *
     * @return the new ExtrachargetaxBean 
     */
    public ExtrachargetaxBean createExtrachargetaxBean()
    {
        return new ExtrachargetaxBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a ExtrachargetaxBean from the extrachargetax using its key fields.
     *
     * @return a unique ExtrachargetaxBean 
     */
    //12
    public ExtrachargetaxBean loadByPrimaryKey(Integer extrachargeid, Integer taxid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM extrachargetax WHERE extrachargetax.extrachargeid=? and extrachargetax.taxid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, extrachargeid);
            Manager.setInteger(ps, 2, taxid);
            ExtrachargetaxBean pReturn[] = loadByPreparedStatement(ps);
            if (pReturn.length < 1)
                return null;
            else
                return pReturn[0];
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }

    /**
     * Deletes rows according to its keys.
     *
     * @return the number of deleted rows
     */
    //60
    public int deleteByPrimaryKey(Integer extrachargeid, Integer taxid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from extrachargetax WHERE extrachargetax.extrachargeid=? and extrachargetax.taxid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, extrachargeid);
            Manager.setInteger(ps, 2, taxid);
            return ps.executeUpdate();
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }

    
    
    //////////////////////////////////////
    // FOREIGN KEY METHODS 
    //////////////////////////////////////

    /**
     * Loads ExtrachargetaxBean array from the extrachargetax table using its extrachargeid field.
     *
     * @return an array of ExtrachargetaxBean 
     */
    // LOAD BY IMPORTED KEY
    public ExtrachargetaxBean[] loadByExtrachargeid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM extrachargetax WHERE extrachargeid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, value);
            return loadByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }


    /**
     * Deletes from the extrachargetax table by extrachargeid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByExtrachargeid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM extrachargetax WHERE extrachargeid=?");
            Manager.setInteger(ps, 1, value);
            return ps.executeUpdate();
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }


    /**
     * Loads ExtrachargetaxBean array from the extrachargetax table using its taxid field.
     *
     * @return an array of ExtrachargetaxBean 
     */
    // LOAD BY IMPORTED KEY
    public ExtrachargetaxBean[] loadByTaxid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM extrachargetax WHERE taxid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, value);
            return loadByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }


    /**
     * Deletes from the extrachargetax table by taxid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByTaxid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM extrachargetax WHERE taxid=?");
            Manager.setInteger(ps, 1, value);
            return ps.executeUpdate();
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }



    //////////////////////////////////////
    // GET/SET FOREIGN KEY BEAN METHOD
    //////////////////////////////////////
    /**
     * Retrieves the ExtrachargeBean object from the extrachargetax.extrachargeid field.
     *
     * @param pObject the ExtrachargetaxBean 
     * @return the associated ExtrachargeBean pObject
     */
    // GET IMPORTED
    public ExtrachargeBean getExtrachargeBean(ExtrachargetaxBean pObject) throws SQLException
    {
        ExtrachargeBean other = ExtrachargeManager.getInstance().createExtrachargeBean();
        other.setExtrachargeid(pObject.getExtrachargeid());
        return ExtrachargeManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the ExtrachargetaxBean object to the ExtrachargeBean object.
     *
     * @param pObject the ExtrachargetaxBean object to use
     * @param pObjectToBeSet the ExtrachargeBean object to associate to the ExtrachargetaxBean 
     * @return the associated ExtrachargeBean pObject
     */
    // SET IMPORTED
    public ExtrachargetaxBean setExtrachargeBean(ExtrachargetaxBean pObject,ExtrachargeBean pObjectToBeSet)
    {
        pObject.setExtrachargeid(pObjectToBeSet.getExtrachargeid());
        return pObject;
    }

    /**
     * Retrieves the TaxBean object from the extrachargetax.taxid field.
     *
     * @param pObject the ExtrachargetaxBean 
     * @return the associated TaxBean pObject
     */
    // GET IMPORTED
    public TaxBean getTaxBean(ExtrachargetaxBean pObject) throws SQLException
    {
        TaxBean other = TaxManager.getInstance().createTaxBean();
        other.setTaxid(pObject.getTaxid());
        return TaxManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the ExtrachargetaxBean object to the TaxBean object.
     *
     * @param pObject the ExtrachargetaxBean object to use
     * @param pObjectToBeSet the TaxBean object to associate to the ExtrachargetaxBean 
     * @return the associated TaxBean pObject
     */
    // SET IMPORTED
    public ExtrachargetaxBean setTaxBean(ExtrachargetaxBean pObject,TaxBean pObjectToBeSet)
    {
        pObject.setTaxid(pObjectToBeSet.getTaxid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from extrachargetax.
     *
     * @return an array of ExtrachargetaxManager pObject
     */
    //38
    public ExtrachargetaxBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM extrachargetax",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            return loadByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }

    //////////////////////////////////////
    // SQL 'WHERE' METHOD
    //////////////////////////////////////
    /**
     * Retrieves an array of ExtrachargetaxBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting ExtrachargetaxBean table 
     */
    //49
    public ExtrachargetaxBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of ExtrachargetaxBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting ExtrachargetaxBean table 
     */
    //51
    public ExtrachargetaxBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from extrachargetax " + where;
        else
        {
            StringBuffer buff = new StringBuffer(128);
            buff.append("select ");
            for(int i = 0; i < fieldList.length; i++)
            {
                if(i != 0)
                    buff.append(",");
                buff.append(FIELD_NAMES[fieldList[i]]);
            }
            buff.append(" from extrachargetax ");
            buff.append(where);
            sql = buff.toString();
            buff = null;
        }
        Connection c = null;
        Statement pStatement = null;
        ResultSet rs =  null;
        java.util.ArrayList v = null;
        try 
        {
            c = getConnection();
            pStatement = c.createStatement();
            rs =  pStatement.executeQuery(sql);
            v = new java.util.ArrayList();
            while(rs.next())
            {
                if(fieldList == null)
                    v.add(decodeRow(rs));
                else
                    v.add(decodeRow(rs, fieldList));
            }

            return (ExtrachargetaxBean[])v.toArray(new ExtrachargetaxBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from extrachargetax table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the extrachargetax table using a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     * <br>Attention, if 'WHERE' is omitted it will delete all records. 
     *
     * @param where the sql 'where' clause
     * @return the number of deleted rows
     */
    public int deleteByWhere(String where) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;

        try
        {
            c = getConnection();
            String delByWhereSQL = "DELETE FROM extrachargetax " + where;
            ps = c.prepareStatement(delByWhereSQL);
            return ps.executeUpdate();
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }



    ///////////////////////////////////////////////////////////////////////
    // SAVE 
    ///////////////////////////////////////////////////////////////////////
    /**
     * Saves the ExtrachargetaxBean pObject into the database.
     *
     * @param pObject the ExtrachargetaxBean pObject to be saved
     */
    //100
    public ExtrachargetaxBean save(ExtrachargetaxBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                beforeInsert(pObject); // listener callback
                int _dirtyCount = 0;
                _sql = new StringBuffer("INSERT into extrachargetax (");
    
                if (pObject.isExtrachargeidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("extrachargeid");
                    _dirtyCount++;
                }

                if (pObject.isTaxidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("taxid");
                    _dirtyCount++;
                }

                _sql.append(") values (");
                if(_dirtyCount > 0) {
                    _sql.append("?");
                    for(int i = 1; i < _dirtyCount; i++) {
                        _sql.append(",?");
                    }
                }
                _sql.append(")");

                ps = c.prepareStatement(_sql.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                _dirtyCount = 0;

                if (pObject.isExtrachargeidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getExtrachargeid());
                }
    
                if (pObject.isTaxidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getTaxid());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE extrachargetax SET ");
                boolean useComma=false;

                if (pObject.isExtrachargeidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("extrachargeid").append("=?");
                }

                if (pObject.isTaxidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("taxid").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("extrachargetax.extrachargeid=? AND extrachargetax.taxid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isExtrachargeidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getExtrachargeid());
                }

                if (pObject.isTaxidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getTaxid());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getExtrachargeid());
                Manager.setInteger(ps, ++_dirtyCount, pObject.getTaxid());
                ps.executeUpdate();
                pObject.resetIsModified();
                afterUpdate(pObject); // listener callback
            }
    
            return pObject;
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }



    /**
     * Saves an array of ExtrachargetaxBean pObjects into the database.
     *
     * @param pObjects the ExtrachargetaxBean pObject table to be saved
     * @return the saved ExtrachargetaxBean array.
     */
    //65
    public ExtrachargetaxBean[] save(ExtrachargetaxBean[] pObjects) throws SQLException 
    {
        for (int iIndex = 0; iIndex < pObjects.length; iIndex ++){
            save(pObjects[iIndex]);
        }
        return pObjects;
    }



    ///////////////////////////////////////////////////////////////////////
    // USING TEMPLATE 
    ///////////////////////////////////////////////////////////////////////
    /**
     * Loads a unique ExtrachargetaxBean pObject from a template one giving a c
     *
     * @param pObject the ExtrachargetaxBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public ExtrachargetaxBean loadUniqueUsingTemplate(ExtrachargetaxBean pObject) throws SQLException
    {
         ExtrachargetaxBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of ExtrachargetaxBean from a template one.
     *
     * @param pObject the ExtrachargetaxBean template to look for
     * @return all the ExtrachargetaxBean matching the template
     */
    //88
    public ExtrachargetaxBean[] loadUsingTemplate(ExtrachargetaxBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from extrachargetax WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isExtrachargeidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("extrachargeid= ?");
             }
    
             if (pObject.isTaxidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("taxid= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isExtrachargeidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getExtrachargeid());
             }
    
             if (pObject.isTaxidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getTaxid());
             }
    
             ps.executeQuery();
             return loadByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }
    /**
     * Deletes rows using a ExtrachargetaxBean template.
     *
     * @param pObject the ExtrachargetaxBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(ExtrachargetaxBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM extrachargetax WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isExtrachargeidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("extrachargeid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isTaxidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("taxid").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isExtrachargeidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getExtrachargeid());
            }
    
            if (pObject.isTaxidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getTaxid());
            }
    
            int _rows = ps.executeUpdate();
            return _rows;
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }



    ///////////////////////////////////////////////////////////////////////
    // COUNT 
    ///////////////////////////////////////////////////////////////////////

    /**
     * Retrieves the number of rows of the table extrachargetax.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table extrachargetax with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from extrachargetax " + where;
        Connection c = null;
        Statement pStatement = null;
        ResultSet rs =  null;
        try 
        {
            int iReturn = -1;    
            c = getConnection();
            pStatement = c.createStatement();
            rs =  pStatement.executeQuery(sql);
            if (rs.next())
            {
                iReturn = rs.getInt("MCOUNT");
            }
            if (iReturn != -1)
                return iReturn;
        }
        finally
        {
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
       throw new SQLException("Error in countWhere");
    }

    /**
     * Retrieves the number of rows of the table extrachargetax with a prepared statement.
     *
     * @param ps the PreparedStatement to be used
     * @return the number of rows returned
     */
    //82
    int countByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        ResultSet rs =  null;
        try 
        {
            int iReturn = -1;
            rs = ps.executeQuery();
            if (rs.next())
                iReturn = rs.getInt("MCOUNT");
            if (iReturn != -1)
                return iReturn;
        }
        finally
        {
            getManager().close(rs);
        }
       throw new SQLException("Error in countByPreparedStatement");
    }

    /**
     * Looks for the number of elements of a specific ExtrachargetaxBean pObject given a c
     *
     * @param pObject the ExtrachargetaxBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(ExtrachargetaxBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from extrachargetax WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isExtrachargeidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("extrachargeid= ?");
                }
    
                if (pObject.isTaxidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("taxid= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isExtrachargeidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getExtrachargeid());
                }
    
                if (pObject.isTaxidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getTaxid());
                }
    
                return countByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }



    ///////////////////////////////////////////////////////////////////////
    // DECODE RESULT SET 
    ///////////////////////////////////////////////////////////////////////
    /**
     * Transforms a ResultSet iterating on the extrachargetax on a ExtrachargetaxBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting ExtrachargetaxBean pObject
     */
    //72
    public ExtrachargetaxBean decodeRow(ResultSet rs) throws SQLException
    {
        ExtrachargetaxBean pObject = createExtrachargetaxBean();
        pObject.setExtrachargeid(Manager.getInteger(rs, 1));
        pObject.setTaxid(Manager.getInteger(rs, 2));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the extrachargetax table on a ExtrachargetaxBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting ExtrachargetaxBean pObject
     */
    //73
    public ExtrachargetaxBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        ExtrachargetaxBean pObject = createExtrachargetaxBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_EXTRACHARGEID:
                    ++pos;
                    pObject.setExtrachargeid(Manager.getInteger(rs, pos));
                    break;
                case ID_TAXID:
                    ++pos;
                    pObject.setTaxid(Manager.getInteger(rs, pos));
                    break;
            }
        }
        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    //////////////////////////////////////
    // PREPARED STATEMENT LOADER
    //////////////////////////////////////

    /**
     * Loads all the elements using a prepared statement.
     *
     * @param ps the PreparedStatement to be used
     * @return an array of ExtrachargetaxBean 
     */
    //41
    public ExtrachargetaxBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of ExtrachargetaxBean 
     */
    public ExtrachargetaxBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
    {
        ResultSet rs =  null;
        java.util.ArrayList v =  null;
        try
        {
            rs =  ps.executeQuery();
            v = new java.util.ArrayList();
            while(rs.next())
            {
                if(fieldList == null)
                    v.add(decodeRow(rs));
                else 
                    v.add(decodeRow(rs, fieldList));
            }
            return (ExtrachargetaxBean[])v.toArray(new ExtrachargetaxBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); v = null;}
            getManager().close(rs);
        }
    }

    ///////////////////////////////////////////////////////////////////////
    // LISTENER 
    ///////////////////////////////////////////////////////////////////////
    private ExtrachargetaxListener listener = null;

    /**
     * Registers a unique ExtrachargetaxListener listener.
     */
    //66.5
    public void registerListener(ExtrachargetaxListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the ExtrachargetaxBean pObject.
     *
     * @param pObject the ExtrachargetaxBean pObject to be saved
     */
    //67
    void beforeInsert(ExtrachargetaxBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the ExtrachargetaxBean pObject.
     *
     * @param pObject the ExtrachargetaxBean pObject to be saved
     */
    //68
    void afterInsert(ExtrachargetaxBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the ExtrachargetaxBean pObject.
     *
     * @param pObject the ExtrachargetaxBean pObject to be updated
     */
    //69
    void beforeUpdate(ExtrachargetaxBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the ExtrachargetaxBean pObject.
     *
     * @param pObject the ExtrachargetaxBean pObject to be updated
     */
    //70
    void afterUpdate(ExtrachargetaxBean pObject) throws SQLException {
        if (listener != null)
            listener.afterUpdate(pObject);
    }

    ///////////////////////////////////////////////////////////////////////
    // UTILS  
    ///////////////////////////////////////////////////////////////////////

    /**
     * Retrieves the manager object used to get connections.
     *
     * @return the manager used
     */
    //2
    Manager getManager() {
        return Manager.getInstance();
    }

    /**
     * Frees the connection.
     *
     * @param c the connection to release
     */
    void freeConnection(Connection c) {
        getManager().releaseConnection(c); // back to pool
    }
    /**
     * Gets the connection.
     */
    Connection getConnection() throws SQLException {
        return getManager().getConnection();
    }

// class+ 

// class- 

}
