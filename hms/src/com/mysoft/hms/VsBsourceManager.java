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
 * Handles database calls for the vs_bsource table.
 */
public class VsBsourceManager
// extends+ 

// extends- 

{

    /**
     * Column bid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_BID = 0;
    public static final int TYPE_BID = Types.BIGINT;
    public static final String NAME_BID = "bid";

    /**
     * Column code of type Types.VARCHAR mapped to String.
     */
    public static final int ID_CODE = 1;
    public static final int TYPE_CODE = Types.VARCHAR;
    public static final String NAME_CODE = "code";

    /**
     * Column name of type Types.VARCHAR mapped to String.
     */
    public static final int ID_NAME = 2;
    public static final int TYPE_NAME = Types.VARCHAR;
    public static final String NAME_NAME = "name";


    private static final String TABLE_NAME = "vs_bsource";

    /**
     * Create an array of type string containing all the fields of the vs_bsource table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "vs_bsource.bid"
        ,"vs_bsource.code"
        ,"vs_bsource.name"
    };

    /**
     * Field that contains the comma separated fields of the vs_bsource table.
     */
    private static final String ALL_FIELDS = "vs_bsource.bid"
                            + ",vs_bsource.code"
                            + ",vs_bsource.name";

    private static VsBsourceManager singleton = new VsBsourceManager();

    /**
     * Get the VsBsourceManager singleton.
     *
     * @return VsBsourceManager 
     */
    synchronized public static VsBsourceManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own VsBsourceManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(VsBsourceManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new VsBsourceBean instance.
     *
     * @return the new VsBsourceBean 
     */
    public VsBsourceBean createVsBsourceBean()
    {
        return new VsBsourceBean();
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from vs_bsource.
     *
     * @return an array of VsBsourceManager pObject
     */
    //38
    public VsBsourceBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM vs_bsource",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of VsBsourceBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting VsBsourceBean table 
     */
    //49
    public VsBsourceBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of VsBsourceBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting VsBsourceBean table 
     */
    //51
    public VsBsourceBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from vs_bsource " + where;
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
            buff.append(" from vs_bsource ");
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

            return (VsBsourceBean[])v.toArray(new VsBsourceBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from vs_bsource table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the vs_bsource table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM vs_bsource " + where;
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
     * Saves the VsBsourceBean pObject into the database.
     *
     * @param pObject the VsBsourceBean pObject to be saved
     */
    //100
    public VsBsourceBean save(VsBsourceBean pObject) throws SQLException
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
                _sql = new StringBuffer("INSERT into vs_bsource (");
    
                if (pObject.isBidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("bid");
                    _dirtyCount++;
                }

                if (pObject.isCodeModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("code");
                    _dirtyCount++;
                }

                if (pObject.isNameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("name");
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

                if (pObject.isBidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getBid());
                }
    
                if (pObject.isCodeModified()) {
                    ps.setString(++_dirtyCount, pObject.getCode());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE vs_bsource SET ");
                boolean useComma=false;

                if (pObject.isBidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("bid").append("=?");
                }

                if (pObject.isCodeModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("code").append("=?");
                }

                if (pObject.isNameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("name").append("=?");
                }
                _sql.append("");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isBidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getBid());
                }

                if (pObject.isCodeModified()) {
                      ps.setString(++_dirtyCount, pObject.getCode());
                }

                if (pObject.isNameModified()) {
                      ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
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
     * Saves an array of VsBsourceBean pObjects into the database.
     *
     * @param pObjects the VsBsourceBean pObject table to be saved
     * @return the saved VsBsourceBean array.
     */
    //65
    public VsBsourceBean[] save(VsBsourceBean[] pObjects) throws SQLException 
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
     * Loads a unique VsBsourceBean pObject from a template one giving a c
     *
     * @param pObject the VsBsourceBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public VsBsourceBean loadUniqueUsingTemplate(VsBsourceBean pObject) throws SQLException
    {
         VsBsourceBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of VsBsourceBean from a template one.
     *
     * @param pObject the VsBsourceBean template to look for
     * @return all the VsBsourceBean matching the template
     */
    //88
    public VsBsourceBean[] loadUsingTemplate(VsBsourceBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from vs_bsource WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isBidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("bid= ?");
             }
    
             if (pObject.isCodeModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("code= ?");
             }
    
             if (pObject.isNameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isBidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getBid());
             }
    
             if (pObject.isCodeModified()) {
                 ps.setString(++_dirtyCount, pObject.getCode());
             }
    
             if (pObject.isNameModified()) {
                 ps.setString(++_dirtyCount, pObject.getName());
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
     * Deletes rows using a VsBsourceBean template.
     *
     * @param pObject the VsBsourceBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(VsBsourceBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM vs_bsource WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isBidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("bid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isCodeInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("code").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isNameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("name").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isBidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getBid());
            }
    
            if (pObject.isCodeInitialized()) {
                ps.setString(++_dirtyCount, pObject.getCode());
            }
    
            if (pObject.isNameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getName());
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
     * Retrieves the number of rows of the table vs_bsource.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table vs_bsource with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from vs_bsource " + where;
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
     * Retrieves the number of rows of the table vs_bsource with a prepared statement.
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
     * Looks for the number of elements of a specific VsBsourceBean pObject given a c
     *
     * @param pObject the VsBsourceBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(VsBsourceBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from vs_bsource WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isBidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("bid= ?");
                }
    
                if (pObject.isCodeModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("code= ?");
                }
    
                if (pObject.isNameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isBidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getBid());
                }
    
                if (pObject.isCodeModified()) {
                    ps.setString(++_dirtyCount, pObject.getCode());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
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
     * Transforms a ResultSet iterating on the vs_bsource on a VsBsourceBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting VsBsourceBean pObject
     */
    //72
    public VsBsourceBean decodeRow(ResultSet rs) throws SQLException
    {
        VsBsourceBean pObject = createVsBsourceBean();
        pObject.setBid(Manager.getLong(rs, 1));
        pObject.setCode(rs.getString(2));
        pObject.setName(rs.getString(3));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the vs_bsource table on a VsBsourceBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting VsBsourceBean pObject
     */
    //73
    public VsBsourceBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        VsBsourceBean pObject = createVsBsourceBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_BID:
                    ++pos;
                    pObject.setBid(Manager.getLong(rs, pos));
                    break;
                case ID_CODE:
                    ++pos;
                    pObject.setCode(rs.getString(pos));
                    break;
                case ID_NAME:
                    ++pos;
                    pObject.setName(rs.getString(pos));
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
     * @return an array of VsBsourceBean 
     */
    //41
    public VsBsourceBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of VsBsourceBean 
     */
    public VsBsourceBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (VsBsourceBean[])v.toArray(new VsBsourceBean[0]);
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
    private VsBsourceListener listener = null;

    /**
     * Registers a unique VsBsourceListener listener.
     */
    //66.5
    public void registerListener(VsBsourceListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the VsBsourceBean pObject.
     *
     * @param pObject the VsBsourceBean pObject to be saved
     */
    //67
    void beforeInsert(VsBsourceBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the VsBsourceBean pObject.
     *
     * @param pObject the VsBsourceBean pObject to be saved
     */
    //68
    void afterInsert(VsBsourceBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the VsBsourceBean pObject.
     *
     * @param pObject the VsBsourceBean pObject to be updated
     */
    //69
    void beforeUpdate(VsBsourceBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the VsBsourceBean pObject.
     *
     * @param pObject the VsBsourceBean pObject to be updated
     */
    //70
    void afterUpdate(VsBsourceBean pObject) throws SQLException {
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
