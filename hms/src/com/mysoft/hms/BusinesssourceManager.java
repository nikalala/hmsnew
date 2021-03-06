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
 * Handles database calls for the businesssource table.
 */
public class BusinesssourceManager
// extends+ 

// extends- 

{

    /**
     * Column businesssourceid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_BUSINESSSOURCEID = 0;
    public static final int TYPE_BUSINESSSOURCEID = Types.INTEGER;
    public static final String NAME_BUSINESSSOURCEID = "businesssourceid";

    /**
     * Column name of type Types.VARCHAR mapped to String.
     */
    public static final int ID_NAME = 1;
    public static final int TYPE_NAME = Types.VARCHAR;
    public static final String NAME_NAME = "name";

    /**
     * Column nickname of type Types.VARCHAR mapped to String.
     */
    public static final int ID_NICKNAME = 2;
    public static final int TYPE_NICKNAME = Types.VARCHAR;
    public static final String NAME_NICKNAME = "nickname";

    /**
     * Column status of type Types.BIT mapped to Boolean.
     */
    public static final int ID_STATUS = 3;
    public static final int TYPE_STATUS = Types.BIT;
    public static final String NAME_STATUS = "status";


    private static final String TABLE_NAME = "businesssource";

    /**
     * Create an array of type string containing all the fields of the businesssource table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "businesssource.businesssourceid"
        ,"businesssource.name"
        ,"businesssource.nickname"
        ,"businesssource.status"
    };

    /**
     * Field that contains the comma separated fields of the businesssource table.
     */
    private static final String ALL_FIELDS = "businesssource.businesssourceid"
                            + ",businesssource.name"
                            + ",businesssource.nickname"
                            + ",businesssource.status";

    private static BusinesssourceManager singleton = new BusinesssourceManager();

    /**
     * Get the BusinesssourceManager singleton.
     *
     * @return BusinesssourceManager 
     */
    synchronized public static BusinesssourceManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own BusinesssourceManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(BusinesssourceManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new BusinesssourceBean instance.
     *
     * @return the new BusinesssourceBean 
     */
    public BusinesssourceBean createBusinesssourceBean()
    {
        return new BusinesssourceBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a BusinesssourceBean from the businesssource using its key fields.
     *
     * @return a unique BusinesssourceBean 
     */
    //12
    public BusinesssourceBean loadByPrimaryKey(Integer businesssourceid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM businesssource WHERE businesssource.businesssourceid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, businesssourceid);
            BusinesssourceBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer businesssourceid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from businesssource WHERE businesssource.businesssourceid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, businesssourceid);
            return ps.executeUpdate();
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from businesssource.
     *
     * @return an array of BusinesssourceManager pObject
     */
    //38
    public BusinesssourceBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM businesssource",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of BusinesssourceBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting BusinesssourceBean table 
     */
    //49
    public BusinesssourceBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of BusinesssourceBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting BusinesssourceBean table 
     */
    //51
    public BusinesssourceBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from businesssource " + where;
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
            buff.append(" from businesssource ");
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

            return (BusinesssourceBean[])v.toArray(new BusinesssourceBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from businesssource table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the businesssource table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM businesssource " + where;
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
     * Saves the BusinesssourceBean pObject into the database.
     *
     * @param pObject the BusinesssourceBean pObject to be saved
     */
    //100
    public BusinesssourceBean save(BusinesssourceBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isBusinesssourceidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('businesssourceid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setBusinesssourceid(Manager.getInteger(rs, 1));
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
                _sql = new StringBuffer("INSERT into businesssource (");
    
                if (pObject.isBusinesssourceidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("businesssourceid");
                    _dirtyCount++;
                }

                if (pObject.isNameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("name");
                    _dirtyCount++;
                }

                if (pObject.isNicknameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("nickname");
                    _dirtyCount++;
                }

                if (pObject.isStatusModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("status");
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

                if (pObject.isBusinesssourceidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getBusinesssourceid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (pObject.isNicknameModified()) {
                    ps.setString(++_dirtyCount, pObject.getNickname());
                }
    
                if (pObject.isStatusModified()) {
                    Manager.setBoolean(ps, ++_dirtyCount, pObject.getStatus());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE businesssource SET ");
                boolean useComma=false;

                if (pObject.isBusinesssourceidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("businesssourceid").append("=?");
                }

                if (pObject.isNameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("name").append("=?");
                }

                if (pObject.isNicknameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("nickname").append("=?");
                }

                if (pObject.isStatusModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("status").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("businesssource.businesssourceid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isBusinesssourceidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getBusinesssourceid());
                }

                if (pObject.isNameModified()) {
                      ps.setString(++_dirtyCount, pObject.getName());
                }

                if (pObject.isNicknameModified()) {
                      ps.setString(++_dirtyCount, pObject.getNickname());
                }

                if (pObject.isStatusModified()) {
                      Manager.setBoolean(ps, ++_dirtyCount, pObject.getStatus());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getBusinesssourceid());
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
     * Saves an array of BusinesssourceBean pObjects into the database.
     *
     * @param pObjects the BusinesssourceBean pObject table to be saved
     * @return the saved BusinesssourceBean array.
     */
    //65
    public BusinesssourceBean[] save(BusinesssourceBean[] pObjects) throws SQLException 
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
     * Loads a unique BusinesssourceBean pObject from a template one giving a c
     *
     * @param pObject the BusinesssourceBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public BusinesssourceBean loadUniqueUsingTemplate(BusinesssourceBean pObject) throws SQLException
    {
         BusinesssourceBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of BusinesssourceBean from a template one.
     *
     * @param pObject the BusinesssourceBean template to look for
     * @return all the BusinesssourceBean matching the template
     */
    //88
    public BusinesssourceBean[] loadUsingTemplate(BusinesssourceBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from businesssource WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isBusinesssourceidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("businesssourceid= ?");
             }
    
             if (pObject.isNameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
             }
    
             if (pObject.isNicknameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("nickname= ?");
             }
    
             if (pObject.isStatusModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("status= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isBusinesssourceidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getBusinesssourceid());
             }
    
             if (pObject.isNameModified()) {
                 ps.setString(++_dirtyCount, pObject.getName());
             }
    
             if (pObject.isNicknameModified()) {
                 ps.setString(++_dirtyCount, pObject.getNickname());
             }
    
             if (pObject.isStatusModified()) {
                 Manager.setBoolean(ps, ++_dirtyCount, pObject.getStatus());
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
     * Deletes rows using a BusinesssourceBean template.
     *
     * @param pObject the BusinesssourceBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(BusinesssourceBean pObject) throws SQLException
    {
        if (pObject.isBusinesssourceidInitialized())
            return deleteByPrimaryKey(pObject.getBusinesssourceid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM businesssource WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isBusinesssourceidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("businesssourceid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isNameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("name").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isNicknameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("nickname").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isStatusInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("status").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isBusinesssourceidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getBusinesssourceid());
            }
    
            if (pObject.isNameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getName());
            }
    
            if (pObject.isNicknameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getNickname());
            }
    
            if (pObject.isStatusInitialized()) {
                Manager.setBoolean(ps, ++_dirtyCount, pObject.getStatus());
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
     * Retrieves the number of rows of the table businesssource.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table businesssource with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from businesssource " + where;
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
     * Retrieves the number of rows of the table businesssource with a prepared statement.
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
     * Looks for the number of elements of a specific BusinesssourceBean pObject given a c
     *
     * @param pObject the BusinesssourceBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(BusinesssourceBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from businesssource WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isBusinesssourceidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("businesssourceid= ?");
                }
    
                if (pObject.isNameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
                }
    
                if (pObject.isNicknameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("nickname= ?");
                }
    
                if (pObject.isStatusModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("status= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isBusinesssourceidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getBusinesssourceid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (pObject.isNicknameModified()) {
                    ps.setString(++_dirtyCount, pObject.getNickname());
                }
    
                if (pObject.isStatusModified()) {
                    Manager.setBoolean(ps, ++_dirtyCount, pObject.getStatus());
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
     * Transforms a ResultSet iterating on the businesssource on a BusinesssourceBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting BusinesssourceBean pObject
     */
    //72
    public BusinesssourceBean decodeRow(ResultSet rs) throws SQLException
    {
        BusinesssourceBean pObject = createBusinesssourceBean();
        pObject.setBusinesssourceid(Manager.getInteger(rs, 1));
        pObject.setName(rs.getString(2));
        pObject.setNickname(rs.getString(3));
        pObject.setStatus(Manager.getBoolean(rs, 4));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the businesssource table on a BusinesssourceBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting BusinesssourceBean pObject
     */
    //73
    public BusinesssourceBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        BusinesssourceBean pObject = createBusinesssourceBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_BUSINESSSOURCEID:
                    ++pos;
                    pObject.setBusinesssourceid(Manager.getInteger(rs, pos));
                    break;
                case ID_NAME:
                    ++pos;
                    pObject.setName(rs.getString(pos));
                    break;
                case ID_NICKNAME:
                    ++pos;
                    pObject.setNickname(rs.getString(pos));
                    break;
                case ID_STATUS:
                    ++pos;
                    pObject.setStatus(Manager.getBoolean(rs, pos));
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
     * @return an array of BusinesssourceBean 
     */
    //41
    public BusinesssourceBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of BusinesssourceBean 
     */
    public BusinesssourceBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (BusinesssourceBean[])v.toArray(new BusinesssourceBean[0]);
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
    private BusinesssourceListener listener = null;

    /**
     * Registers a unique BusinesssourceListener listener.
     */
    //66.5
    public void registerListener(BusinesssourceListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the BusinesssourceBean pObject.
     *
     * @param pObject the BusinesssourceBean pObject to be saved
     */
    //67
    void beforeInsert(BusinesssourceBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the BusinesssourceBean pObject.
     *
     * @param pObject the BusinesssourceBean pObject to be saved
     */
    //68
    void afterInsert(BusinesssourceBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the BusinesssourceBean pObject.
     *
     * @param pObject the BusinesssourceBean pObject to be updated
     */
    //69
    void beforeUpdate(BusinesssourceBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the BusinesssourceBean pObject.
     *
     * @param pObject the BusinesssourceBean pObject to be updated
     */
    //70
    void afterUpdate(BusinesssourceBean pObject) throws SQLException {
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
