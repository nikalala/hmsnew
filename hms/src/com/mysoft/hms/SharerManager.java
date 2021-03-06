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
 * Handles database calls for the sharer table.
 */
public class SharerManager
// extends+ 

// extends- 

{

    /**
     * Column sharerid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_SHARERID = 0;
    public static final int TYPE_SHARERID = Types.BIGINT;
    public static final String NAME_SHARERID = "sharerid";

    /**
     * Column reservationroomid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_RESERVATIONROOMID = 1;
    public static final int TYPE_RESERVATIONROOMID = Types.BIGINT;
    public static final String NAME_RESERVATIONROOMID = "reservationroomid";

    /**
     * Column guestid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_GUESTID = 2;
    public static final int TYPE_GUESTID = Types.BIGINT;
    public static final String NAME_GUESTID = "guestid";


    private static final String TABLE_NAME = "sharer";

    /**
     * Create an array of type string containing all the fields of the sharer table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "sharer.sharerid"
        ,"sharer.reservationroomid"
        ,"sharer.guestid"
    };

    /**
     * Field that contains the comma separated fields of the sharer table.
     */
    private static final String ALL_FIELDS = "sharer.sharerid"
                            + ",sharer.reservationroomid"
                            + ",sharer.guestid";

    private static SharerManager singleton = new SharerManager();

    /**
     * Get the SharerManager singleton.
     *
     * @return SharerManager 
     */
    synchronized public static SharerManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own SharerManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(SharerManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new SharerBean instance.
     *
     * @return the new SharerBean 
     */
    public SharerBean createSharerBean()
    {
        return new SharerBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a SharerBean from the sharer using its key fields.
     *
     * @return a unique SharerBean 
     */
    //12
    public SharerBean loadByPrimaryKey(Long sharerid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sharer WHERE sharer.sharerid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, sharerid);
            SharerBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Long sharerid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from sharer WHERE sharer.sharerid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, sharerid);
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
     * Loads SharerBean array from the sharer table using its guestid field.
     *
     * @return an array of SharerBean 
     */
    // LOAD BY IMPORTED KEY
    public SharerBean[] loadByGuestid(Long value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sharer WHERE guestid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, value);
            return loadByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }


    /**
     * Deletes from the sharer table by guestid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByGuestid(Long value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM sharer WHERE guestid=?");
            Manager.setLong(ps, 1, value);
            return ps.executeUpdate();
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }


    /**
     * Loads SharerBean array from the sharer table using its reservationroomid field.
     *
     * @return an array of SharerBean 
     */
    // LOAD BY IMPORTED KEY
    public SharerBean[] loadByReservationroomid(Long value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sharer WHERE reservationroomid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, value);
            return loadByPreparedStatement(ps);
        }
        finally
        {
            getManager().close(ps);
            freeConnection(c);
        }
    }


    /**
     * Deletes from the sharer table by reservationroomid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByReservationroomid(Long value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM sharer WHERE reservationroomid=?");
            Manager.setLong(ps, 1, value);
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
     * Retrieves the GuestBean object from the sharer.guestid field.
     *
     * @param pObject the SharerBean 
     * @return the associated GuestBean pObject
     */
    // GET IMPORTED
    public GuestBean getGuestBean(SharerBean pObject) throws SQLException
    {
        GuestBean other = GuestManager.getInstance().createGuestBean();
        other.setGuestid(pObject.getGuestid());
        return GuestManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the SharerBean object to the GuestBean object.
     *
     * @param pObject the SharerBean object to use
     * @param pObjectToBeSet the GuestBean object to associate to the SharerBean 
     * @return the associated GuestBean pObject
     */
    // SET IMPORTED
    public SharerBean setGuestBean(SharerBean pObject,GuestBean pObjectToBeSet)
    {
        pObject.setGuestid(pObjectToBeSet.getGuestid());
        return pObject;
    }

    /**
     * Retrieves the ReservationroomBean object from the sharer.reservationroomid field.
     *
     * @param pObject the SharerBean 
     * @return the associated ReservationroomBean pObject
     */
    // GET IMPORTED
    public ReservationroomBean getReservationroomBean(SharerBean pObject) throws SQLException
    {
        ReservationroomBean other = ReservationroomManager.getInstance().createReservationroomBean();
        other.setReservationroomid(pObject.getReservationroomid());
        return ReservationroomManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the SharerBean object to the ReservationroomBean object.
     *
     * @param pObject the SharerBean object to use
     * @param pObjectToBeSet the ReservationroomBean object to associate to the SharerBean 
     * @return the associated ReservationroomBean pObject
     */
    // SET IMPORTED
    public SharerBean setReservationroomBean(SharerBean pObject,ReservationroomBean pObjectToBeSet)
    {
        pObject.setReservationroomid(pObjectToBeSet.getReservationroomid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from sharer.
     *
     * @return an array of SharerManager pObject
     */
    //38
    public SharerBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sharer",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of SharerBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting SharerBean table 
     */
    //49
    public SharerBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of SharerBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting SharerBean table 
     */
    //51
    public SharerBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from sharer " + where;
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
            buff.append(" from sharer ");
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

            return (SharerBean[])v.toArray(new SharerBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from sharer table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the sharer table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM sharer " + where;
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
     * Saves the SharerBean pObject into the database.
     *
     * @param pObject the SharerBean pObject to be saved
     */
    //100
    public SharerBean save(SharerBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isShareridModified())
                {
                    ps = c.prepareStatement("SELECT nextval('sharerid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setSharerid(Manager.getLong(rs, 1));
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
                _sql = new StringBuffer("INSERT into sharer (");
    
                if (pObject.isShareridModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("sharerid");
                    _dirtyCount++;
                }

                if (pObject.isReservationroomidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("reservationroomid");
                    _dirtyCount++;
                }

                if (pObject.isGuestidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("guestid");
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

                if (pObject.isShareridModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getSharerid());
                }
    
                if (pObject.isReservationroomidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
                }
    
                if (pObject.isGuestidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE sharer SET ");
                boolean useComma=false;

                if (pObject.isShareridModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("sharerid").append("=?");
                }

                if (pObject.isReservationroomidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("reservationroomid").append("=?");
                }

                if (pObject.isGuestidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("guestid").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("sharer.sharerid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isShareridModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getSharerid());
                }

                if (pObject.isReservationroomidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
                }

                if (pObject.isGuestidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setLong(ps, ++_dirtyCount, pObject.getSharerid());
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
     * Saves an array of SharerBean pObjects into the database.
     *
     * @param pObjects the SharerBean pObject table to be saved
     * @return the saved SharerBean array.
     */
    //65
    public SharerBean[] save(SharerBean[] pObjects) throws SQLException 
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
     * Loads a unique SharerBean pObject from a template one giving a c
     *
     * @param pObject the SharerBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public SharerBean loadUniqueUsingTemplate(SharerBean pObject) throws SQLException
    {
         SharerBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of SharerBean from a template one.
     *
     * @param pObject the SharerBean template to look for
     * @return all the SharerBean matching the template
     */
    //88
    public SharerBean[] loadUsingTemplate(SharerBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from sharer WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isShareridModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("sharerid= ?");
             }
    
             if (pObject.isReservationroomidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("reservationroomid= ?");
             }
    
             if (pObject.isGuestidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("guestid= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isShareridModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getSharerid());
             }
    
             if (pObject.isReservationroomidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
             }
    
             if (pObject.isGuestidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
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
     * Deletes rows using a SharerBean template.
     *
     * @param pObject the SharerBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(SharerBean pObject) throws SQLException
    {
        if (pObject.isShareridInitialized())
            return deleteByPrimaryKey(pObject.getSharerid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM sharer WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isShareridInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("sharerid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isReservationroomidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("reservationroomid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isGuestidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("guestid").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isShareridInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getSharerid());
            }
    
            if (pObject.isReservationroomidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
            }
    
            if (pObject.isGuestidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
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
     * Retrieves the number of rows of the table sharer.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table sharer with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from sharer " + where;
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
     * Retrieves the number of rows of the table sharer with a prepared statement.
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
     * Looks for the number of elements of a specific SharerBean pObject given a c
     *
     * @param pObject the SharerBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(SharerBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from sharer WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isShareridModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("sharerid= ?");
                }
    
                if (pObject.isReservationroomidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("reservationroomid= ?");
                }
    
                if (pObject.isGuestidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("guestid= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isShareridModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getSharerid());
                }
    
                if (pObject.isReservationroomidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getReservationroomid());
                }
    
                if (pObject.isGuestidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getGuestid());
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
     * Transforms a ResultSet iterating on the sharer on a SharerBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting SharerBean pObject
     */
    //72
    public SharerBean decodeRow(ResultSet rs) throws SQLException
    {
        SharerBean pObject = createSharerBean();
        pObject.setSharerid(Manager.getLong(rs, 1));
        pObject.setReservationroomid(Manager.getLong(rs, 2));
        pObject.setGuestid(Manager.getLong(rs, 3));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the sharer table on a SharerBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting SharerBean pObject
     */
    //73
    public SharerBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        SharerBean pObject = createSharerBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_SHARERID:
                    ++pos;
                    pObject.setSharerid(Manager.getLong(rs, pos));
                    break;
                case ID_RESERVATIONROOMID:
                    ++pos;
                    pObject.setReservationroomid(Manager.getLong(rs, pos));
                    break;
                case ID_GUESTID:
                    ++pos;
                    pObject.setGuestid(Manager.getLong(rs, pos));
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
     * @return an array of SharerBean 
     */
    //41
    public SharerBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of SharerBean 
     */
    public SharerBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (SharerBean[])v.toArray(new SharerBean[0]);
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
    private SharerListener listener = null;

    /**
     * Registers a unique SharerListener listener.
     */
    //66.5
    public void registerListener(SharerListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the SharerBean pObject.
     *
     * @param pObject the SharerBean pObject to be saved
     */
    //67
    void beforeInsert(SharerBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the SharerBean pObject.
     *
     * @param pObject the SharerBean pObject to be saved
     */
    //68
    void afterInsert(SharerBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the SharerBean pObject.
     *
     * @param pObject the SharerBean pObject to be updated
     */
    //69
    void beforeUpdate(SharerBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the SharerBean pObject.
     *
     * @param pObject the SharerBean pObject to be updated
     */
    //70
    void afterUpdate(SharerBean pObject) throws SQLException {
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
