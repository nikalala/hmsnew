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
 * Handles database calls for the tariffroomtype table.
 */
public class TariffroomtypeManager
// extends+ 

// extends- 

{

    /**
     * Column tarifftypeid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_TARIFFTYPEID = 0;
    public static final int TYPE_TARIFFTYPEID = Types.INTEGER;
    public static final String NAME_TARIFFTYPEID = "tarifftypeid";

    /**
     * Column roomtypeid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_ROOMTYPEID = 1;
    public static final int TYPE_ROOMTYPEID = Types.INTEGER;
    public static final String NAME_ROOMTYPEID = "roomtypeid";


    private static final String TABLE_NAME = "tariffroomtype";

    /**
     * Create an array of type string containing all the fields of the tariffroomtype table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "tariffroomtype.tarifftypeid"
        ,"tariffroomtype.roomtypeid"
    };

    /**
     * Field that contains the comma separated fields of the tariffroomtype table.
     */
    private static final String ALL_FIELDS = "tariffroomtype.tarifftypeid"
                            + ",tariffroomtype.roomtypeid";

    private static TariffroomtypeManager singleton = new TariffroomtypeManager();

    /**
     * Get the TariffroomtypeManager singleton.
     *
     * @return TariffroomtypeManager 
     */
    synchronized public static TariffroomtypeManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own TariffroomtypeManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(TariffroomtypeManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new TariffroomtypeBean instance.
     *
     * @return the new TariffroomtypeBean 
     */
    public TariffroomtypeBean createTariffroomtypeBean()
    {
        return new TariffroomtypeBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a TariffroomtypeBean from the tariffroomtype using its key fields.
     *
     * @return a unique TariffroomtypeBean 
     */
    //12
    public TariffroomtypeBean loadByPrimaryKey(Integer tarifftypeid, Integer roomtypeid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM tariffroomtype WHERE tariffroomtype.tarifftypeid=? and tariffroomtype.roomtypeid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, tarifftypeid);
            Manager.setInteger(ps, 2, roomtypeid);
            TariffroomtypeBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer tarifftypeid, Integer roomtypeid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from tariffroomtype WHERE tariffroomtype.tarifftypeid=? and tariffroomtype.roomtypeid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, tarifftypeid);
            Manager.setInteger(ps, 2, roomtypeid);
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
     * Loads TariffroomtypeBean array from the tariffroomtype table using its roomtypeid field.
     *
     * @return an array of TariffroomtypeBean 
     */
    // LOAD BY IMPORTED KEY
    public TariffroomtypeBean[] loadByRoomtypeid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM tariffroomtype WHERE roomtypeid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the tariffroomtype table by roomtypeid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByRoomtypeid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM tariffroomtype WHERE roomtypeid=?");
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
     * Loads TariffroomtypeBean array from the tariffroomtype table using its tarifftypeid field.
     *
     * @return an array of TariffroomtypeBean 
     */
    // LOAD BY IMPORTED KEY
    public TariffroomtypeBean[] loadByTarifftypeid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM tariffroomtype WHERE tarifftypeid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the tariffroomtype table by tarifftypeid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByTarifftypeid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM tariffroomtype WHERE tarifftypeid=?");
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
     * Retrieves the RoomtypeBean object from the tariffroomtype.roomtypeid field.
     *
     * @param pObject the TariffroomtypeBean 
     * @return the associated RoomtypeBean pObject
     */
    // GET IMPORTED
    public RoomtypeBean getRoomtypeBean(TariffroomtypeBean pObject) throws SQLException
    {
        RoomtypeBean other = RoomtypeManager.getInstance().createRoomtypeBean();
        other.setRoomtypeid(pObject.getRoomtypeid());
        return RoomtypeManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the TariffroomtypeBean object to the RoomtypeBean object.
     *
     * @param pObject the TariffroomtypeBean object to use
     * @param pObjectToBeSet the RoomtypeBean object to associate to the TariffroomtypeBean 
     * @return the associated RoomtypeBean pObject
     */
    // SET IMPORTED
    public TariffroomtypeBean setRoomtypeBean(TariffroomtypeBean pObject,RoomtypeBean pObjectToBeSet)
    {
        pObject.setRoomtypeid(pObjectToBeSet.getRoomtypeid());
        return pObject;
    }

    /**
     * Retrieves the TarifftypeBean object from the tariffroomtype.tarifftypeid field.
     *
     * @param pObject the TariffroomtypeBean 
     * @return the associated TarifftypeBean pObject
     */
    // GET IMPORTED
    public TarifftypeBean getTarifftypeBean(TariffroomtypeBean pObject) throws SQLException
    {
        TarifftypeBean other = TarifftypeManager.getInstance().createTarifftypeBean();
        other.setTarifftypeid(pObject.getTarifftypeid());
        return TarifftypeManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the TariffroomtypeBean object to the TarifftypeBean object.
     *
     * @param pObject the TariffroomtypeBean object to use
     * @param pObjectToBeSet the TarifftypeBean object to associate to the TariffroomtypeBean 
     * @return the associated TarifftypeBean pObject
     */
    // SET IMPORTED
    public TariffroomtypeBean setTarifftypeBean(TariffroomtypeBean pObject,TarifftypeBean pObjectToBeSet)
    {
        pObject.setTarifftypeid(pObjectToBeSet.getTarifftypeid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from tariffroomtype.
     *
     * @return an array of TariffroomtypeManager pObject
     */
    //38
    public TariffroomtypeBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM tariffroomtype",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of TariffroomtypeBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting TariffroomtypeBean table 
     */
    //49
    public TariffroomtypeBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of TariffroomtypeBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting TariffroomtypeBean table 
     */
    //51
    public TariffroomtypeBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from tariffroomtype " + where;
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
            buff.append(" from tariffroomtype ");
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

            return (TariffroomtypeBean[])v.toArray(new TariffroomtypeBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from tariffroomtype table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the tariffroomtype table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM tariffroomtype " + where;
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
     * Saves the TariffroomtypeBean pObject into the database.
     *
     * @param pObject the TariffroomtypeBean pObject to be saved
     */
    //100
    public TariffroomtypeBean save(TariffroomtypeBean pObject) throws SQLException
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
                _sql = new StringBuffer("INSERT into tariffroomtype (");
    
                if (pObject.isTarifftypeidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("tarifftypeid");
                    _dirtyCount++;
                }

                if (pObject.isRoomtypeidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("roomtypeid");
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

                if (pObject.isTarifftypeidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getTarifftypeid());
                }
    
                if (pObject.isRoomtypeidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomtypeid());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE tariffroomtype SET ");
                boolean useComma=false;

                if (pObject.isTarifftypeidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("tarifftypeid").append("=?");
                }

                if (pObject.isRoomtypeidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("roomtypeid").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("tariffroomtype.tarifftypeid=? AND tariffroomtype.roomtypeid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isTarifftypeidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getTarifftypeid());
                }

                if (pObject.isRoomtypeidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomtypeid());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getTarifftypeid());
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomtypeid());
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
     * Saves an array of TariffroomtypeBean pObjects into the database.
     *
     * @param pObjects the TariffroomtypeBean pObject table to be saved
     * @return the saved TariffroomtypeBean array.
     */
    //65
    public TariffroomtypeBean[] save(TariffroomtypeBean[] pObjects) throws SQLException 
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
     * Loads a unique TariffroomtypeBean pObject from a template one giving a c
     *
     * @param pObject the TariffroomtypeBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public TariffroomtypeBean loadUniqueUsingTemplate(TariffroomtypeBean pObject) throws SQLException
    {
         TariffroomtypeBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of TariffroomtypeBean from a template one.
     *
     * @param pObject the TariffroomtypeBean template to look for
     * @return all the TariffroomtypeBean matching the template
     */
    //88
    public TariffroomtypeBean[] loadUsingTemplate(TariffroomtypeBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from tariffroomtype WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isTarifftypeidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("tarifftypeid= ?");
             }
    
             if (pObject.isRoomtypeidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomtypeid= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isTarifftypeidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getTarifftypeid());
             }
    
             if (pObject.isRoomtypeidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomtypeid());
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
     * Deletes rows using a TariffroomtypeBean template.
     *
     * @param pObject the TariffroomtypeBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(TariffroomtypeBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM tariffroomtype WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isTarifftypeidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("tarifftypeid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRoomtypeidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("roomtypeid").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isTarifftypeidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getTarifftypeid());
            }
    
            if (pObject.isRoomtypeidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomtypeid());
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
     * Retrieves the number of rows of the table tariffroomtype.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table tariffroomtype with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from tariffroomtype " + where;
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
     * Retrieves the number of rows of the table tariffroomtype with a prepared statement.
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
     * Looks for the number of elements of a specific TariffroomtypeBean pObject given a c
     *
     * @param pObject the TariffroomtypeBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(TariffroomtypeBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from tariffroomtype WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isTarifftypeidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("tarifftypeid= ?");
                }
    
                if (pObject.isRoomtypeidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomtypeid= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isTarifftypeidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getTarifftypeid());
                }
    
                if (pObject.isRoomtypeidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomtypeid());
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
     * Transforms a ResultSet iterating on the tariffroomtype on a TariffroomtypeBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting TariffroomtypeBean pObject
     */
    //72
    public TariffroomtypeBean decodeRow(ResultSet rs) throws SQLException
    {
        TariffroomtypeBean pObject = createTariffroomtypeBean();
        pObject.setTarifftypeid(Manager.getInteger(rs, 1));
        pObject.setRoomtypeid(Manager.getInteger(rs, 2));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the tariffroomtype table on a TariffroomtypeBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting TariffroomtypeBean pObject
     */
    //73
    public TariffroomtypeBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        TariffroomtypeBean pObject = createTariffroomtypeBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_TARIFFTYPEID:
                    ++pos;
                    pObject.setTarifftypeid(Manager.getInteger(rs, pos));
                    break;
                case ID_ROOMTYPEID:
                    ++pos;
                    pObject.setRoomtypeid(Manager.getInteger(rs, pos));
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
     * @return an array of TariffroomtypeBean 
     */
    //41
    public TariffroomtypeBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of TariffroomtypeBean 
     */
    public TariffroomtypeBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (TariffroomtypeBean[])v.toArray(new TariffroomtypeBean[0]);
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
    private TariffroomtypeListener listener = null;

    /**
     * Registers a unique TariffroomtypeListener listener.
     */
    //66.5
    public void registerListener(TariffroomtypeListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the TariffroomtypeBean pObject.
     *
     * @param pObject the TariffroomtypeBean pObject to be saved
     */
    //67
    void beforeInsert(TariffroomtypeBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the TariffroomtypeBean pObject.
     *
     * @param pObject the TariffroomtypeBean pObject to be saved
     */
    //68
    void afterInsert(TariffroomtypeBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the TariffroomtypeBean pObject.
     *
     * @param pObject the TariffroomtypeBean pObject to be updated
     */
    //69
    void beforeUpdate(TariffroomtypeBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the TariffroomtypeBean pObject.
     *
     * @param pObject the TariffroomtypeBean pObject to be updated
     */
    //70
    void afterUpdate(TariffroomtypeBean pObject) throws SQLException {
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