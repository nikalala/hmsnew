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
 * Handles database calls for the v_sharer_2 table.
 */
public class VSharer2Manager
// extends+ 

// extends- 

{

    /**
     * Column guest of type Types.VARCHAR mapped to String.
     */
    public static final int ID_GUEST = 0;
    public static final int TYPE_GUEST = Types.VARCHAR;
    public static final String NAME_GUEST = "guest";

    /**
     * Column guestid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_GUESTID = 1;
    public static final int TYPE_GUESTID = Types.BIGINT;
    public static final String NAME_GUESTID = "guestid";

    /**
     * Column reservationroomid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_RESERVATIONROOMID = 2;
    public static final int TYPE_RESERVATIONROOMID = Types.BIGINT;
    public static final String NAME_RESERVATIONROOMID = "reservationroomid";


    private static final String TABLE_NAME = "v_sharer_2";

    /**
     * Create an array of type string containing all the fields of the v_sharer_2 table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "v_sharer_2.guest"
        ,"v_sharer_2.guestid"
        ,"v_sharer_2.reservationroomid"
    };

    /**
     * Field that contains the comma separated fields of the v_sharer_2 table.
     */
    private static final String ALL_FIELDS = "v_sharer_2.guest"
                            + ",v_sharer_2.guestid"
                            + ",v_sharer_2.reservationroomid";

    private static VSharer2Manager singleton = new VSharer2Manager();

    /**
     * Get the VSharer2Manager singleton.
     *
     * @return VSharer2Manager 
     */
    synchronized public static VSharer2Manager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own VSharer2Manager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(VSharer2Manager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new VSharer2Bean instance.
     *
     * @return the new VSharer2Bean 
     */
    public VSharer2Bean createVSharer2Bean()
    {
        return new VSharer2Bean();
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from v_sharer_2.
     *
     * @return an array of VSharer2Manager pObject
     */
    //38
    public VSharer2Bean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM v_sharer_2",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of VSharer2Bean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting VSharer2Bean table 
     */
    //49
    public VSharer2Bean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of VSharer2Bean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting VSharer2Bean table 
     */
    //51
    public VSharer2Bean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from v_sharer_2 " + where;
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
            buff.append(" from v_sharer_2 ");
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

            return (VSharer2Bean[])v.toArray(new VSharer2Bean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from v_sharer_2 table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the v_sharer_2 table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM v_sharer_2 " + where;
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
     * Saves the VSharer2Bean pObject into the database.
     *
     * @param pObject the VSharer2Bean pObject to be saved
     */
    //100
    public VSharer2Bean save(VSharer2Bean pObject) throws SQLException
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
                _sql = new StringBuffer("INSERT into v_sharer_2 (");
    
                if (pObject.isGuestModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("guest");
                    _dirtyCount++;
                }

                if (pObject.isGuestidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("guestid");
                    _dirtyCount++;
                }

                if (pObject.isReservationroomidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("reservationroomid");
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

                if (pObject.isGuestModified()) {
                    ps.setString(++_dirtyCount, pObject.getGuest());
                }
    
                if (pObject.isGuestidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
                }
    
                if (pObject.isReservationroomidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE v_sharer_2 SET ");
                boolean useComma=false;

                if (pObject.isGuestModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("guest").append("=?");
                }

                if (pObject.isGuestidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("guestid").append("=?");
                }

                if (pObject.isReservationroomidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("reservationroomid").append("=?");
                }
                _sql.append("");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isGuestModified()) {
                      ps.setString(++_dirtyCount, pObject.getGuest());
                }

                if (pObject.isGuestidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
                }

                if (pObject.isReservationroomidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
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
     * Saves an array of VSharer2Bean pObjects into the database.
     *
     * @param pObjects the VSharer2Bean pObject table to be saved
     * @return the saved VSharer2Bean array.
     */
    //65
    public VSharer2Bean[] save(VSharer2Bean[] pObjects) throws SQLException 
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
     * Loads a unique VSharer2Bean pObject from a template one giving a c
     *
     * @param pObject the VSharer2Bean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public VSharer2Bean loadUniqueUsingTemplate(VSharer2Bean pObject) throws SQLException
    {
         VSharer2Bean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of VSharer2Bean from a template one.
     *
     * @param pObject the VSharer2Bean template to look for
     * @return all the VSharer2Bean matching the template
     */
    //88
    public VSharer2Bean[] loadUsingTemplate(VSharer2Bean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from v_sharer_2 WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isGuestModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("guest= ?");
             }
    
             if (pObject.isGuestidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("guestid= ?");
             }
    
             if (pObject.isReservationroomidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("reservationroomid= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isGuestModified()) {
                 ps.setString(++_dirtyCount, pObject.getGuest());
             }
    
             if (pObject.isGuestidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
             }
    
             if (pObject.isReservationroomidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
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
     * Deletes rows using a VSharer2Bean template.
     *
     * @param pObject the VSharer2Bean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(VSharer2Bean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM v_sharer_2 WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isGuestInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("guest").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isGuestidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("guestid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isReservationroomidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("reservationroomid").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isGuestInitialized()) {
                ps.setString(++_dirtyCount, pObject.getGuest());
            }
    
            if (pObject.isGuestidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
            }
    
            if (pObject.isReservationroomidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
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
     * Retrieves the number of rows of the table v_sharer_2.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table v_sharer_2 with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from v_sharer_2 " + where;
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
     * Retrieves the number of rows of the table v_sharer_2 with a prepared statement.
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
     * Looks for the number of elements of a specific VSharer2Bean pObject given a c
     *
     * @param pObject the VSharer2Bean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(VSharer2Bean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from v_sharer_2 WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isGuestModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("guest= ?");
                }
    
                if (pObject.isGuestidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("guestid= ?");
                }
    
                if (pObject.isReservationroomidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("reservationroomid= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isGuestModified()) {
                    ps.setString(++_dirtyCount, pObject.getGuest());
                }
    
                if (pObject.isGuestidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
                }
    
                if (pObject.isReservationroomidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
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
     * Transforms a ResultSet iterating on the v_sharer_2 on a VSharer2Bean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting VSharer2Bean pObject
     */
    //72
    public VSharer2Bean decodeRow(ResultSet rs) throws SQLException
    {
        VSharer2Bean pObject = createVSharer2Bean();
        pObject.setGuest(rs.getString(1));
        pObject.setGuestid(Manager.getLong(rs, 2));
        pObject.setReservationroomid(Manager.getLong(rs, 3));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the v_sharer_2 table on a VSharer2Bean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting VSharer2Bean pObject
     */
    //73
    public VSharer2Bean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        VSharer2Bean pObject = createVSharer2Bean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_GUEST:
                    ++pos;
                    pObject.setGuest(rs.getString(pos));
                    break;
                case ID_GUESTID:
                    ++pos;
                    pObject.setGuestid(Manager.getLong(rs, pos));
                    break;
                case ID_RESERVATIONROOMID:
                    ++pos;
                    pObject.setReservationroomid(Manager.getLong(rs, pos));
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
     * @return an array of VSharer2Bean 
     */
    //41
    public VSharer2Bean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of VSharer2Bean 
     */
    public VSharer2Bean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (VSharer2Bean[])v.toArray(new VSharer2Bean[0]);
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
    private VSharer2Listener listener = null;

    /**
     * Registers a unique VSharer2Listener listener.
     */
    //66.5
    public void registerListener(VSharer2Listener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the VSharer2Bean pObject.
     *
     * @param pObject the VSharer2Bean pObject to be saved
     */
    //67
    void beforeInsert(VSharer2Bean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the VSharer2Bean pObject.
     *
     * @param pObject the VSharer2Bean pObject to be saved
     */
    //68
    void afterInsert(VSharer2Bean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the VSharer2Bean pObject.
     *
     * @param pObject the VSharer2Bean pObject to be updated
     */
    //69
    void beforeUpdate(VSharer2Bean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the VSharer2Bean pObject.
     *
     * @param pObject the VSharer2Bean pObject to be updated
     */
    //70
    void afterUpdate(VSharer2Bean pObject) throws SQLException {
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