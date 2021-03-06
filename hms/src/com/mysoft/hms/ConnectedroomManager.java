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
 * Handles database calls for the connectedroom table.
 */
public class ConnectedroomManager
// extends+ 

// extends- 

{

    /**
     * Column roomid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_ROOMID = 0;
    public static final int TYPE_ROOMID = Types.INTEGER;
    public static final String NAME_ROOMID = "roomid";

    /**
     * Column connectedid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_CONNECTEDID = 1;
    public static final int TYPE_CONNECTEDID = Types.INTEGER;
    public static final String NAME_CONNECTEDID = "connectedid";


    private static final String TABLE_NAME = "connectedroom";

    /**
     * Create an array of type string containing all the fields of the connectedroom table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "connectedroom.roomid"
        ,"connectedroom.connectedid"
    };

    /**
     * Field that contains the comma separated fields of the connectedroom table.
     */
    private static final String ALL_FIELDS = "connectedroom.roomid"
                            + ",connectedroom.connectedid";

    private static ConnectedroomManager singleton = new ConnectedroomManager();

    /**
     * Get the ConnectedroomManager singleton.
     *
     * @return ConnectedroomManager 
     */
    synchronized public static ConnectedroomManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own ConnectedroomManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(ConnectedroomManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new ConnectedroomBean instance.
     *
     * @return the new ConnectedroomBean 
     */
    public ConnectedroomBean createConnectedroomBean()
    {
        return new ConnectedroomBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a ConnectedroomBean from the connectedroom using its key fields.
     *
     * @return a unique ConnectedroomBean 
     */
    //12
    public ConnectedroomBean loadByPrimaryKey(Integer roomid, Integer connectedid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM connectedroom WHERE connectedroom.roomid=? and connectedroom.connectedid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, roomid);
            Manager.setInteger(ps, 2, connectedid);
            ConnectedroomBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer roomid, Integer connectedid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from connectedroom WHERE connectedroom.roomid=? and connectedroom.connectedid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, roomid);
            Manager.setInteger(ps, 2, connectedid);
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
     * Loads ConnectedroomBean array from the connectedroom table using its connectedid field.
     *
     * @return an array of ConnectedroomBean 
     */
    // LOAD BY IMPORTED KEY
    public ConnectedroomBean[] loadByConnectedid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM connectedroom WHERE connectedid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the connectedroom table by connectedid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByConnectedid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM connectedroom WHERE connectedid=?");
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
     * Loads ConnectedroomBean array from the connectedroom table using its roomid field.
     *
     * @return an array of ConnectedroomBean 
     */
    // LOAD BY IMPORTED KEY
    public ConnectedroomBean[] loadByRoomid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM connectedroom WHERE roomid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the connectedroom table by roomid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByRoomid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM connectedroom WHERE roomid=?");
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
     * Retrieves the RoomBean object from the connectedroom.roomid field.
     *
     * @param pObject the ConnectedroomBean 
     * @return the associated RoomBean pObject
     */
    // GET IMPORTED
    public RoomBean getRoomBean(ConnectedroomBean pObject) throws SQLException
    {
        RoomBean other = RoomManager.getInstance().createRoomBean();
        other.setRoomid(pObject.getConnectedid());
        return RoomManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the ConnectedroomBean object to the RoomBean object.
     *
     * @param pObject the ConnectedroomBean object to use
     * @param pObjectToBeSet the RoomBean object to associate to the ConnectedroomBean 
     * @return the associated RoomBean pObject
     */
    // SET IMPORTED
    public ConnectedroomBean setRoomBean(ConnectedroomBean pObject,RoomBean pObjectToBeSet)
    {
        pObject.setConnectedid(pObjectToBeSet.getRoomid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from connectedroom.
     *
     * @return an array of ConnectedroomManager pObject
     */
    //38
    public ConnectedroomBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM connectedroom",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of ConnectedroomBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting ConnectedroomBean table 
     */
    //49
    public ConnectedroomBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of ConnectedroomBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting ConnectedroomBean table 
     */
    //51
    public ConnectedroomBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from connectedroom " + where;
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
            buff.append(" from connectedroom ");
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

            return (ConnectedroomBean[])v.toArray(new ConnectedroomBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from connectedroom table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the connectedroom table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM connectedroom " + where;
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
     * Saves the ConnectedroomBean pObject into the database.
     *
     * @param pObject the ConnectedroomBean pObject to be saved
     */
    //100
    public ConnectedroomBean save(ConnectedroomBean pObject) throws SQLException
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
                _sql = new StringBuffer("INSERT into connectedroom (");
    
                if (pObject.isRoomidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("roomid");
                    _dirtyCount++;
                }

                if (pObject.isConnectedidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("connectedid");
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

                if (pObject.isRoomidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                }
    
                if (pObject.isConnectedidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getConnectedid());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE connectedroom SET ");
                boolean useComma=false;

                if (pObject.isRoomidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("roomid").append("=?");
                }

                if (pObject.isConnectedidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("connectedid").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("connectedroom.roomid=? AND connectedroom.connectedid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isRoomidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                }

                if (pObject.isConnectedidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getConnectedid());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                Manager.setInteger(ps, ++_dirtyCount, pObject.getConnectedid());
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
     * Saves an array of ConnectedroomBean pObjects into the database.
     *
     * @param pObjects the ConnectedroomBean pObject table to be saved
     * @return the saved ConnectedroomBean array.
     */
    //65
    public ConnectedroomBean[] save(ConnectedroomBean[] pObjects) throws SQLException 
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
     * Loads a unique ConnectedroomBean pObject from a template one giving a c
     *
     * @param pObject the ConnectedroomBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public ConnectedroomBean loadUniqueUsingTemplate(ConnectedroomBean pObject) throws SQLException
    {
         ConnectedroomBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of ConnectedroomBean from a template one.
     *
     * @param pObject the ConnectedroomBean template to look for
     * @return all the ConnectedroomBean matching the template
     */
    //88
    public ConnectedroomBean[] loadUsingTemplate(ConnectedroomBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from connectedroom WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isRoomidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomid= ?");
             }
    
             if (pObject.isConnectedidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("connectedid= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isRoomidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
             }
    
             if (pObject.isConnectedidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getConnectedid());
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
     * Deletes rows using a ConnectedroomBean template.
     *
     * @param pObject the ConnectedroomBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(ConnectedroomBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM connectedroom WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isRoomidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("roomid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isConnectedidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("connectedid").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isRoomidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
            }
    
            if (pObject.isConnectedidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getConnectedid());
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
     * Retrieves the number of rows of the table connectedroom.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table connectedroom with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from connectedroom " + where;
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
     * Retrieves the number of rows of the table connectedroom with a prepared statement.
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
     * Looks for the number of elements of a specific ConnectedroomBean pObject given a c
     *
     * @param pObject the ConnectedroomBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(ConnectedroomBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from connectedroom WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isRoomidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomid= ?");
                }
    
                if (pObject.isConnectedidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("connectedid= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isRoomidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                }
    
                if (pObject.isConnectedidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getConnectedid());
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
     * Transforms a ResultSet iterating on the connectedroom on a ConnectedroomBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting ConnectedroomBean pObject
     */
    //72
    public ConnectedroomBean decodeRow(ResultSet rs) throws SQLException
    {
        ConnectedroomBean pObject = createConnectedroomBean();
        pObject.setRoomid(Manager.getInteger(rs, 1));
        pObject.setConnectedid(Manager.getInteger(rs, 2));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the connectedroom table on a ConnectedroomBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting ConnectedroomBean pObject
     */
    //73
    public ConnectedroomBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        ConnectedroomBean pObject = createConnectedroomBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_ROOMID:
                    ++pos;
                    pObject.setRoomid(Manager.getInteger(rs, pos));
                    break;
                case ID_CONNECTEDID:
                    ++pos;
                    pObject.setConnectedid(Manager.getInteger(rs, pos));
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
     * @return an array of ConnectedroomBean 
     */
    //41
    public ConnectedroomBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of ConnectedroomBean 
     */
    public ConnectedroomBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (ConnectedroomBean[])v.toArray(new ConnectedroomBean[0]);
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
    private ConnectedroomListener listener = null;

    /**
     * Registers a unique ConnectedroomListener listener.
     */
    //66.5
    public void registerListener(ConnectedroomListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the ConnectedroomBean pObject.
     *
     * @param pObject the ConnectedroomBean pObject to be saved
     */
    //67
    void beforeInsert(ConnectedroomBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the ConnectedroomBean pObject.
     *
     * @param pObject the ConnectedroomBean pObject to be saved
     */
    //68
    void afterInsert(ConnectedroomBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the ConnectedroomBean pObject.
     *
     * @param pObject the ConnectedroomBean pObject to be updated
     */
    //69
    void beforeUpdate(ConnectedroomBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the ConnectedroomBean pObject.
     *
     * @param pObject the ConnectedroomBean pObject to be updated
     */
    //70
    void afterUpdate(ConnectedroomBean pObject) throws SQLException {
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
