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
 * Handles database calls for the roomview table.
 */
public class RoomviewManager
// extends+ 

// extends- 

{

    /**
     * Column roomviewid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_ROOMVIEWID = 0;
    public static final int TYPE_ROOMVIEWID = Types.BIGINT;
    public static final String NAME_ROOMVIEWID = "roomviewid";

    /**
     * Column json of type Types.VARCHAR mapped to String.
     */
    public static final int ID_JSON = 1;
    public static final int TYPE_JSON = Types.VARCHAR;
    public static final String NAME_JSON = "json";

    /**
     * Column extrarow of type Types.BIGINT mapped to Long.
     */
    public static final int ID_EXTRAROW = 2;
    public static final int TYPE_EXTRAROW = Types.BIGINT;
    public static final String NAME_EXTRAROW = "extrarow";


    private static final String TABLE_NAME = "roomview";

    /**
     * Create an array of type string containing all the fields of the roomview table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "roomview.roomviewid"
        ,"roomview.json"
        ,"roomview.extrarow"
    };

    /**
     * Field that contains the comma separated fields of the roomview table.
     */
    private static final String ALL_FIELDS = "roomview.roomviewid"
                            + ",roomview.json"
                            + ",roomview.extrarow";

    private static RoomviewManager singleton = new RoomviewManager();

    /**
     * Get the RoomviewManager singleton.
     *
     * @return RoomviewManager 
     */
    synchronized public static RoomviewManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own RoomviewManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(RoomviewManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new RoomviewBean instance.
     *
     * @return the new RoomviewBean 
     */
    public RoomviewBean createRoomviewBean()
    {
        return new RoomviewBean();
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from roomview.
     *
     * @return an array of RoomviewManager pObject
     */
    //38
    public RoomviewBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM roomview",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of RoomviewBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting RoomviewBean table 
     */
    //49
    public RoomviewBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of RoomviewBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting RoomviewBean table 
     */
    //51
    public RoomviewBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from roomview " + where;
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
            buff.append(" from roomview ");
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

            return (RoomviewBean[])v.toArray(new RoomviewBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from roomview table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the roomview table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM roomview " + where;
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
     * Saves the RoomviewBean pObject into the database.
     *
     * @param pObject the RoomviewBean pObject to be saved
     */
    //100
    public RoomviewBean save(RoomviewBean pObject) throws SQLException
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
                _sql = new StringBuffer("INSERT into roomview (");
    
                if (pObject.isRoomviewidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("roomviewid");
                    _dirtyCount++;
                }

                if (pObject.isJsonModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("json");
                    _dirtyCount++;
                }

                if (pObject.isExtrarowModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("extrarow");
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

                if (pObject.isRoomviewidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getRoomviewid());
                }
    
                if (pObject.isJsonModified()) {
                    ps.setString(++_dirtyCount, pObject.getJson());
                }
    
                if (pObject.isExtrarowModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getExtrarow());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE roomview SET ");
                boolean useComma=false;

                if (pObject.isRoomviewidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("roomviewid").append("=?");
                }

                if (pObject.isJsonModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("json").append("=?");
                }

                if (pObject.isExtrarowModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("extrarow").append("=?");
                }
                _sql.append("");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isRoomviewidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getRoomviewid());
                }

                if (pObject.isJsonModified()) {
                      ps.setString(++_dirtyCount, pObject.getJson());
                }

                if (pObject.isExtrarowModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getExtrarow());
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
     * Saves an array of RoomviewBean pObjects into the database.
     *
     * @param pObjects the RoomviewBean pObject table to be saved
     * @return the saved RoomviewBean array.
     */
    //65
    public RoomviewBean[] save(RoomviewBean[] pObjects) throws SQLException 
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
     * Loads a unique RoomviewBean pObject from a template one giving a c
     *
     * @param pObject the RoomviewBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public RoomviewBean loadUniqueUsingTemplate(RoomviewBean pObject) throws SQLException
    {
         RoomviewBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of RoomviewBean from a template one.
     *
     * @param pObject the RoomviewBean template to look for
     * @return all the RoomviewBean matching the template
     */
    //88
    public RoomviewBean[] loadUsingTemplate(RoomviewBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from roomview WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isRoomviewidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomviewid= ?");
             }
    
             if (pObject.isJsonModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("json= ?");
             }
    
             if (pObject.isExtrarowModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("extrarow= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isRoomviewidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getRoomviewid());
             }
    
             if (pObject.isJsonModified()) {
                 ps.setString(++_dirtyCount, pObject.getJson());
             }
    
             if (pObject.isExtrarowModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getExtrarow());
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
     * Deletes rows using a RoomviewBean template.
     *
     * @param pObject the RoomviewBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(RoomviewBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM roomview WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isRoomviewidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("roomviewid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isJsonInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("json").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isExtrarowInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("extrarow").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isRoomviewidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getRoomviewid());
            }
    
            if (pObject.isJsonInitialized()) {
                ps.setString(++_dirtyCount, pObject.getJson());
            }
    
            if (pObject.isExtrarowInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getExtrarow());
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
     * Retrieves the number of rows of the table roomview.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table roomview with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from roomview " + where;
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
     * Retrieves the number of rows of the table roomview with a prepared statement.
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
     * Looks for the number of elements of a specific RoomviewBean pObject given a c
     *
     * @param pObject the RoomviewBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(RoomviewBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from roomview WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isRoomviewidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomviewid= ?");
                }
    
                if (pObject.isJsonModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("json= ?");
                }
    
                if (pObject.isExtrarowModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("extrarow= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isRoomviewidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getRoomviewid());
                }
    
                if (pObject.isJsonModified()) {
                    ps.setString(++_dirtyCount, pObject.getJson());
                }
    
                if (pObject.isExtrarowModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getExtrarow());
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
     * Transforms a ResultSet iterating on the roomview on a RoomviewBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting RoomviewBean pObject
     */
    //72
    public RoomviewBean decodeRow(ResultSet rs) throws SQLException
    {
        RoomviewBean pObject = createRoomviewBean();
        pObject.setRoomviewid(Manager.getLong(rs, 1));
        pObject.setJson(rs.getString(2));
        pObject.setExtrarow(Manager.getLong(rs, 3));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the roomview table on a RoomviewBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting RoomviewBean pObject
     */
    //73
    public RoomviewBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        RoomviewBean pObject = createRoomviewBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_ROOMVIEWID:
                    ++pos;
                    pObject.setRoomviewid(Manager.getLong(rs, pos));
                    break;
                case ID_JSON:
                    ++pos;
                    pObject.setJson(rs.getString(pos));
                    break;
                case ID_EXTRAROW:
                    ++pos;
                    pObject.setExtrarow(Manager.getLong(rs, pos));
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
     * @return an array of RoomviewBean 
     */
    //41
    public RoomviewBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of RoomviewBean 
     */
    public RoomviewBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (RoomviewBean[])v.toArray(new RoomviewBean[0]);
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
    private RoomviewListener listener = null;

    /**
     * Registers a unique RoomviewListener listener.
     */
    //66.5
    public void registerListener(RoomviewListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the RoomviewBean pObject.
     *
     * @param pObject the RoomviewBean pObject to be saved
     */
    //67
    void beforeInsert(RoomviewBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the RoomviewBean pObject.
     *
     * @param pObject the RoomviewBean pObject to be saved
     */
    //68
    void afterInsert(RoomviewBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the RoomviewBean pObject.
     *
     * @param pObject the RoomviewBean pObject to be updated
     */
    //69
    void beforeUpdate(RoomviewBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the RoomviewBean pObject.
     *
     * @param pObject the RoomviewBean pObject to be updated
     */
    //70
    void afterUpdate(RoomviewBean pObject) throws SQLException {
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
