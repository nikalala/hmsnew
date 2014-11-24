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
 * Handles database calls for the currencyrate table.
 */
public class CurrencyrateManager
// extends+ 

// extends- 

{

    /**
     * Column currencyrateid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_CURRENCYRATEID = 0;
    public static final int TYPE_CURRENCYRATEID = Types.BIGINT;
    public static final String NAME_CURRENCYRATEID = "currencyrateid";

    /**
     * Column currencyid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_CURRENCYID = 1;
    public static final int TYPE_CURRENCYID = Types.INTEGER;
    public static final String NAME_CURRENCYID = "currencyid";

    /**
     * Column ratedate of type Types.DATE mapped to java.util.Date.
     */
    public static final int ID_RATEDATE = 2;
    public static final int TYPE_RATEDATE = Types.DATE;
    public static final String NAME_RATEDATE = "ratedate";

    /**
     * Column value of type Types.DOUBLE mapped to Double.
     */
    public static final int ID_VALUE = 3;
    public static final int TYPE_VALUE = Types.DOUBLE;
    public static final String NAME_VALUE = "value";


    private static final String TABLE_NAME = "currencyrate";

    /**
     * Create an array of type string containing all the fields of the currencyrate table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "currencyrate.currencyrateid"
        ,"currencyrate.currencyid"
        ,"currencyrate.ratedate"
        ,"currencyrate.value"
    };

    /**
     * Field that contains the comma separated fields of the currencyrate table.
     */
    private static final String ALL_FIELDS = "currencyrate.currencyrateid"
                            + ",currencyrate.currencyid"
                            + ",currencyrate.ratedate"
                            + ",currencyrate.value";

    private static CurrencyrateManager singleton = new CurrencyrateManager();

    /**
     * Get the CurrencyrateManager singleton.
     *
     * @return CurrencyrateManager 
     */
    synchronized public static CurrencyrateManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own CurrencyrateManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(CurrencyrateManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new CurrencyrateBean instance.
     *
     * @return the new CurrencyrateBean 
     */
    public CurrencyrateBean createCurrencyrateBean()
    {
        return new CurrencyrateBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a CurrencyrateBean from the currencyrate using its key fields.
     *
     * @return a unique CurrencyrateBean 
     */
    //12
    public CurrencyrateBean loadByPrimaryKey(Long currencyrateid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM currencyrate WHERE currencyrate.currencyrateid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, currencyrateid);
            CurrencyrateBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Long currencyrateid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from currencyrate WHERE currencyrate.currencyrateid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, currencyrateid);
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
     * Loads CurrencyrateBean array from the currencyrate table using its currencyid field.
     *
     * @return an array of CurrencyrateBean 
     */
    // LOAD BY IMPORTED KEY
    public CurrencyrateBean[] loadByCurrencyid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM currencyrate WHERE currencyid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the currencyrate table by currencyid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByCurrencyid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM currencyrate WHERE currencyid=?");
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
     * Retrieves the CurrencyBean object from the currencyrate.currencyid field.
     *
     * @param pObject the CurrencyrateBean 
     * @return the associated CurrencyBean pObject
     */
    // GET IMPORTED
    public CurrencyBean getCurrencyBean(CurrencyrateBean pObject) throws SQLException
    {
        CurrencyBean other = CurrencyManager.getInstance().createCurrencyBean();
        other.setCurrencyid(pObject.getCurrencyid());
        return CurrencyManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the CurrencyrateBean object to the CurrencyBean object.
     *
     * @param pObject the CurrencyrateBean object to use
     * @param pObjectToBeSet the CurrencyBean object to associate to the CurrencyrateBean 
     * @return the associated CurrencyBean pObject
     */
    // SET IMPORTED
    public CurrencyrateBean setCurrencyBean(CurrencyrateBean pObject,CurrencyBean pObjectToBeSet)
    {
        pObject.setCurrencyid(pObjectToBeSet.getCurrencyid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from currencyrate.
     *
     * @return an array of CurrencyrateManager pObject
     */
    //38
    public CurrencyrateBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM currencyrate",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of CurrencyrateBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting CurrencyrateBean table 
     */
    //49
    public CurrencyrateBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of CurrencyrateBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting CurrencyrateBean table 
     */
    //51
    public CurrencyrateBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from currencyrate " + where;
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
            buff.append(" from currencyrate ");
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

            return (CurrencyrateBean[])v.toArray(new CurrencyrateBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from currencyrate table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the currencyrate table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM currencyrate " + where;
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
     * Saves the CurrencyrateBean pObject into the database.
     *
     * @param pObject the CurrencyrateBean pObject to be saved
     */
    //100
    public CurrencyrateBean save(CurrencyrateBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isCurrencyrateidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('currencyrateid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setCurrencyrateid(Manager.getLong(rs, 1));
                        else
                            getManager().log("ATTENTION: Could not retrieve generated key!");
                    }
                    finally
                    {
                        getManager().close(ps, rs);
                        ps=null;
                    }
                }
                beforeInsert(pObject); // listener callback
                int _dirtyCount = 0;
                _sql = new StringBuffer("INSERT into currencyrate (");
    
                if (pObject.isCurrencyrateidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("currencyrateid");
                    _dirtyCount++;
                }

                if (pObject.isCurrencyidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("currencyid");
                    _dirtyCount++;
                }

                if (pObject.isRatedateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("ratedate");
                    _dirtyCount++;
                }

                if (pObject.isValueModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("value");
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

                if (pObject.isCurrencyrateidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getCurrencyrateid());
                }
    
                if (pObject.isCurrencyidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getCurrencyid());
                }
    
                if (pObject.isRatedateModified()) {
                    if (pObject.getRatedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getRatedate().getTime()));
                }
    
                if (pObject.isValueModified()) {
                    Manager.setDouble(ps, ++_dirtyCount, pObject.getValue());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE currencyrate SET ");
                boolean useComma=false;

                if (pObject.isCurrencyrateidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("currencyrateid").append("=?");
                }

                if (pObject.isCurrencyidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("currencyid").append("=?");
                }

                if (pObject.isRatedateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("ratedate").append("=?");
                }

                if (pObject.isValueModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("value").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("currencyrate.currencyrateid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isCurrencyrateidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getCurrencyrateid());
                }

                if (pObject.isCurrencyidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getCurrencyid());
                }

                if (pObject.isRatedateModified()) {
                      if (pObject.getRatedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getRatedate().getTime()));
                }

                if (pObject.isValueModified()) {
                      Manager.setDouble(ps, ++_dirtyCount, pObject.getValue());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setLong(ps, ++_dirtyCount, pObject.getCurrencyrateid());
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
     * Saves an array of CurrencyrateBean pObjects into the database.
     *
     * @param pObjects the CurrencyrateBean pObject table to be saved
     * @return the saved CurrencyrateBean array.
     */
    //65
    public CurrencyrateBean[] save(CurrencyrateBean[] pObjects) throws SQLException 
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
     * Loads a unique CurrencyrateBean pObject from a template one giving a c
     *
     * @param pObject the CurrencyrateBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public CurrencyrateBean loadUniqueUsingTemplate(CurrencyrateBean pObject) throws SQLException
    {
         CurrencyrateBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of CurrencyrateBean from a template one.
     *
     * @param pObject the CurrencyrateBean template to look for
     * @return all the CurrencyrateBean matching the template
     */
    //88
    public CurrencyrateBean[] loadUsingTemplate(CurrencyrateBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from currencyrate WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isCurrencyrateidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("currencyrateid= ?");
             }
    
             if (pObject.isCurrencyidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("currencyid= ?");
             }
    
             if (pObject.isRatedateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("ratedate= ?");
             }
    
             if (pObject.isValueModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("value= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isCurrencyrateidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getCurrencyrateid());
             }
    
             if (pObject.isCurrencyidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getCurrencyid());
             }
    
             if (pObject.isRatedateModified()) {
                 if (pObject.getRatedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getRatedate().getTime()));
             }
    
             if (pObject.isValueModified()) {
                 Manager.setDouble(ps, ++_dirtyCount, pObject.getValue());
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
     * Deletes rows using a CurrencyrateBean template.
     *
     * @param pObject the CurrencyrateBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(CurrencyrateBean pObject) throws SQLException
    {
        if (pObject.isCurrencyrateidInitialized())
            return deleteByPrimaryKey(pObject.getCurrencyrateid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM currencyrate WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isCurrencyrateidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("currencyrateid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isCurrencyidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("currencyid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRatedateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("ratedate").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isValueInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("value").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isCurrencyrateidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getCurrencyrateid());
            }
    
            if (pObject.isCurrencyidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getCurrencyid());
            }
    
            if (pObject.isRatedateInitialized()) {
                if (pObject.getRatedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getRatedate().getTime()));
            }
    
            if (pObject.isValueInitialized()) {
                Manager.setDouble(ps, ++_dirtyCount, pObject.getValue());
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
     * Retrieves the number of rows of the table currencyrate.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table currencyrate with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from currencyrate " + where;
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
     * Retrieves the number of rows of the table currencyrate with a prepared statement.
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
     * Looks for the number of elements of a specific CurrencyrateBean pObject given a c
     *
     * @param pObject the CurrencyrateBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(CurrencyrateBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from currencyrate WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isCurrencyrateidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("currencyrateid= ?");
                }
    
                if (pObject.isCurrencyidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("currencyid= ?");
                }
    
                if (pObject.isRatedateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("ratedate= ?");
                }
    
                if (pObject.isValueModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("value= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isCurrencyrateidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getCurrencyrateid());
                }
    
                if (pObject.isCurrencyidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getCurrencyid());
                }
    
                if (pObject.isRatedateModified()) {
                    if (pObject.getRatedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getRatedate().getTime()));
                }
    
                if (pObject.isValueModified()) {
                    Manager.setDouble(ps, ++_dirtyCount, pObject.getValue());
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
     * Transforms a ResultSet iterating on the currencyrate on a CurrencyrateBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting CurrencyrateBean pObject
     */
    //72
    public CurrencyrateBean decodeRow(ResultSet rs) throws SQLException
    {
        CurrencyrateBean pObject = createCurrencyrateBean();
        pObject.setCurrencyrateid(Manager.getLong(rs, 1));
        pObject.setCurrencyid(Manager.getInteger(rs, 2));
        pObject.setRatedate(rs.getDate(3));
        pObject.setValue(Manager.getDouble(rs, 4));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the currencyrate table on a CurrencyrateBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting CurrencyrateBean pObject
     */
    //73
    public CurrencyrateBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        CurrencyrateBean pObject = createCurrencyrateBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_CURRENCYRATEID:
                    ++pos;
                    pObject.setCurrencyrateid(Manager.getLong(rs, pos));
                    break;
                case ID_CURRENCYID:
                    ++pos;
                    pObject.setCurrencyid(Manager.getInteger(rs, pos));
                    break;
                case ID_RATEDATE:
                    ++pos;
                    pObject.setRatedate(rs.getDate(pos));
                    break;
                case ID_VALUE:
                    ++pos;
                    pObject.setValue(Manager.getDouble(rs, pos));
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
     * @return an array of CurrencyrateBean 
     */
    //41
    public CurrencyrateBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of CurrencyrateBean 
     */
    public CurrencyrateBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (CurrencyrateBean[])v.toArray(new CurrencyrateBean[0]);
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
    private CurrencyrateListener listener = null;

    /**
     * Registers a unique CurrencyrateListener listener.
     */
    //66.5
    public void registerListener(CurrencyrateListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the CurrencyrateBean pObject.
     *
     * @param pObject the CurrencyrateBean pObject to be saved
     */
    //67
    void beforeInsert(CurrencyrateBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the CurrencyrateBean pObject.
     *
     * @param pObject the CurrencyrateBean pObject to be saved
     */
    //68
    void afterInsert(CurrencyrateBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the CurrencyrateBean pObject.
     *
     * @param pObject the CurrencyrateBean pObject to be updated
     */
    //69
    void beforeUpdate(CurrencyrateBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the CurrencyrateBean pObject.
     *
     * @param pObject the CurrencyrateBean pObject to be updated
     */
    //70
    void afterUpdate(CurrencyrateBean pObject) throws SQLException {
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
