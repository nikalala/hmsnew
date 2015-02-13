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
 * Handles database calls for the housekeeper table.
 */
public class HousekeeperManager
// extends+ 

// extends- 

{

    /**
     * Column housekeeperid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_HOUSEKEEPERID = 0;
    public static final int TYPE_HOUSEKEEPERID = Types.INTEGER;
    public static final String NAME_HOUSEKEEPERID = "housekeeperid";

    /**
     * Column personnelid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_PERSONNELID = 1;
    public static final int TYPE_PERSONNELID = Types.INTEGER;
    public static final String NAME_PERSONNELID = "personnelid";

    /**
     * Column roomid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_ROOMID = 2;
    public static final int TYPE_ROOMID = Types.INTEGER;
    public static final String NAME_ROOMID = "roomid";

    /**
     * Column houseunitid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_HOUSEUNITID = 3;
    public static final int TYPE_HOUSEUNITID = Types.INTEGER;
    public static final String NAME_HOUSEUNITID = "houseunitid";

    /**
     * Column recdate of type Types.TIMESTAMP mapped to java.sql.Timestamp.
     */
    public static final int ID_RECDATE = 4;
    public static final int TYPE_RECDATE = Types.TIMESTAMP;
    public static final String NAME_RECDATE = "recdate";

    /**
     * Column deleted of type Types.BIT mapped to Boolean.
     */
    public static final int ID_DELETED = 5;
    public static final int TYPE_DELETED = Types.BIT;
    public static final String NAME_DELETED = "deleted";


    private static final String TABLE_NAME = "housekeeper";

    /**
     * Create an array of type string containing all the fields of the housekeeper table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "housekeeper.housekeeperid"
        ,"housekeeper.personnelid"
        ,"housekeeper.roomid"
        ,"housekeeper.houseunitid"
        ,"housekeeper.recdate"
        ,"housekeeper.deleted"
    };

    /**
     * Field that contains the comma separated fields of the housekeeper table.
     */
    private static final String ALL_FIELDS = "housekeeper.housekeeperid"
                            + ",housekeeper.personnelid"
                            + ",housekeeper.roomid"
                            + ",housekeeper.houseunitid"
                            + ",housekeeper.recdate"
                            + ",housekeeper.deleted";

    private static HousekeeperManager singleton = new HousekeeperManager();

    /**
     * Get the HousekeeperManager singleton.
     *
     * @return HousekeeperManager 
     */
    synchronized public static HousekeeperManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own HousekeeperManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(HousekeeperManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new HousekeeperBean instance.
     *
     * @return the new HousekeeperBean 
     */
    public HousekeeperBean createHousekeeperBean()
    {
        return new HousekeeperBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a HousekeeperBean from the housekeeper using its key fields.
     *
     * @return a unique HousekeeperBean 
     */
    //12
    public HousekeeperBean loadByPrimaryKey(Integer housekeeperid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM housekeeper WHERE housekeeper.housekeeperid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, housekeeperid);
            HousekeeperBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer housekeeperid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from housekeeper WHERE housekeeper.housekeeperid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, housekeeperid);
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
     * Loads all the rows from housekeeper.
     *
     * @return an array of HousekeeperManager pObject
     */
    //38
    public HousekeeperBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM housekeeper",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of HousekeeperBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting HousekeeperBean table 
     */
    //49
    public HousekeeperBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of HousekeeperBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting HousekeeperBean table 
     */
    //51
    public HousekeeperBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from housekeeper " + where;
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
            buff.append(" from housekeeper ");
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

            return (HousekeeperBean[])v.toArray(new HousekeeperBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from housekeeper table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the housekeeper table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM housekeeper " + where;
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
     * Saves the HousekeeperBean pObject into the database.
     *
     * @param pObject the HousekeeperBean pObject to be saved
     */
    //100
    public HousekeeperBean save(HousekeeperBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isHousekeeperidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('housekeeperid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setHousekeeperid(Manager.getInteger(rs, 1));
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
                _sql = new StringBuffer("INSERT into housekeeper (");
    
                if (pObject.isHousekeeperidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("housekeeperid");
                    _dirtyCount++;
                }

                if (pObject.isPersonnelidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("personnelid");
                    _dirtyCount++;
                }

                if (pObject.isRoomidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("roomid");
                    _dirtyCount++;
                }

                if (pObject.isHouseunitidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("houseunitid");
                    _dirtyCount++;
                }

                if (pObject.isRecdateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("recdate");
                    _dirtyCount++;
                }

                if (pObject.isDeletedModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("deleted");
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

                if (pObject.isHousekeeperidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getHousekeeperid());
                }
    
                if (pObject.isPersonnelidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getPersonnelid());
                }
    
                if (pObject.isRoomidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                }
    
                if (pObject.isHouseunitidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getHouseunitid());
                }
    
                if (pObject.isRecdateModified()) {
                    ps.setTimestamp(++_dirtyCount, pObject.getRecdate());
                }
    
                if (pObject.isDeletedModified()) {
                    Manager.setBoolean(ps, ++_dirtyCount, pObject.getDeleted());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE housekeeper SET ");
                boolean useComma=false;

                if (pObject.isHousekeeperidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("housekeeperid").append("=?");
                }

                if (pObject.isPersonnelidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("personnelid").append("=?");
                }

                if (pObject.isRoomidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("roomid").append("=?");
                }

                if (pObject.isHouseunitidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("houseunitid").append("=?");
                }

                if (pObject.isRecdateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("recdate").append("=?");
                }

                if (pObject.isDeletedModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("deleted").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("housekeeper.housekeeperid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isHousekeeperidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getHousekeeperid());
                }

                if (pObject.isPersonnelidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getPersonnelid());
                }

                if (pObject.isRoomidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                }

                if (pObject.isHouseunitidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getHouseunitid());
                }

                if (pObject.isRecdateModified()) {
                      ps.setTimestamp(++_dirtyCount, pObject.getRecdate());
                }

                if (pObject.isDeletedModified()) {
                      Manager.setBoolean(ps, ++_dirtyCount, pObject.getDeleted());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getHousekeeperid());
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
     * Saves an array of HousekeeperBean pObjects into the database.
     *
     * @param pObjects the HousekeeperBean pObject table to be saved
     * @return the saved HousekeeperBean array.
     */
    //65
    public HousekeeperBean[] save(HousekeeperBean[] pObjects) throws SQLException 
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
     * Loads a unique HousekeeperBean pObject from a template one giving a c
     *
     * @param pObject the HousekeeperBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public HousekeeperBean loadUniqueUsingTemplate(HousekeeperBean pObject) throws SQLException
    {
         HousekeeperBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of HousekeeperBean from a template one.
     *
     * @param pObject the HousekeeperBean template to look for
     * @return all the HousekeeperBean matching the template
     */
    //88
    public HousekeeperBean[] loadUsingTemplate(HousekeeperBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from housekeeper WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isHousekeeperidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("housekeeperid= ?");
             }
    
             if (pObject.isPersonnelidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("personnelid= ?");
             }
    
             if (pObject.isRoomidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomid= ?");
             }
    
             if (pObject.isHouseunitidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("houseunitid= ?");
             }
    
             if (pObject.isRecdateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("recdate= ?");
             }
    
             if (pObject.isDeletedModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("deleted= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isHousekeeperidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getHousekeeperid());
             }
    
             if (pObject.isPersonnelidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getPersonnelid());
             }
    
             if (pObject.isRoomidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
             }
    
             if (pObject.isHouseunitidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getHouseunitid());
             }
    
             if (pObject.isRecdateModified()) {
                 ps.setTimestamp(++_dirtyCount, pObject.getRecdate());
             }
    
             if (pObject.isDeletedModified()) {
                 Manager.setBoolean(ps, ++_dirtyCount, pObject.getDeleted());
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
     * Deletes rows using a HousekeeperBean template.
     *
     * @param pObject the HousekeeperBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(HousekeeperBean pObject) throws SQLException
    {
        if (pObject.isHousekeeperidInitialized())
            return deleteByPrimaryKey(pObject.getHousekeeperid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM housekeeper WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isHousekeeperidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("housekeeperid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isPersonnelidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("personnelid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRoomidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("roomid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isHouseunitidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("houseunitid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRecdateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("recdate").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isDeletedInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("deleted").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isHousekeeperidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getHousekeeperid());
            }
    
            if (pObject.isPersonnelidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getPersonnelid());
            }
    
            if (pObject.isRoomidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
            }
    
            if (pObject.isHouseunitidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getHouseunitid());
            }
    
            if (pObject.isRecdateInitialized()) {
                ps.setTimestamp(++_dirtyCount, pObject.getRecdate());
            }
    
            if (pObject.isDeletedInitialized()) {
                Manager.setBoolean(ps, ++_dirtyCount, pObject.getDeleted());
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
     * Retrieves the number of rows of the table housekeeper.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table housekeeper with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from housekeeper " + where;
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
     * Retrieves the number of rows of the table housekeeper with a prepared statement.
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
     * Looks for the number of elements of a specific HousekeeperBean pObject given a c
     *
     * @param pObject the HousekeeperBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(HousekeeperBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from housekeeper WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isHousekeeperidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("housekeeperid= ?");
                }
    
                if (pObject.isPersonnelidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("personnelid= ?");
                }
    
                if (pObject.isRoomidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("roomid= ?");
                }
    
                if (pObject.isHouseunitidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("houseunitid= ?");
                }
    
                if (pObject.isRecdateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("recdate= ?");
                }
    
                if (pObject.isDeletedModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("deleted= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isHousekeeperidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getHousekeeperid());
                }
    
                if (pObject.isPersonnelidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getPersonnelid());
                }
    
                if (pObject.isRoomidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRoomid());
                }
    
                if (pObject.isHouseunitidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getHouseunitid());
                }
    
                if (pObject.isRecdateModified()) {
                    ps.setTimestamp(++_dirtyCount, pObject.getRecdate());
                }
    
                if (pObject.isDeletedModified()) {
                    Manager.setBoolean(ps, ++_dirtyCount, pObject.getDeleted());
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
     * Transforms a ResultSet iterating on the housekeeper on a HousekeeperBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting HousekeeperBean pObject
     */
    //72
    public HousekeeperBean decodeRow(ResultSet rs) throws SQLException
    {
        HousekeeperBean pObject = createHousekeeperBean();
        pObject.setHousekeeperid(Manager.getInteger(rs, 1));
        pObject.setPersonnelid(Manager.getInteger(rs, 2));
        pObject.setRoomid(Manager.getInteger(rs, 3));
        pObject.setHouseunitid(Manager.getInteger(rs, 4));
        pObject.setRecdate(rs.getTimestamp(5));
        pObject.setDeleted(Manager.getBoolean(rs, 6));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the housekeeper table on a HousekeeperBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting HousekeeperBean pObject
     */
    //73
    public HousekeeperBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        HousekeeperBean pObject = createHousekeeperBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_HOUSEKEEPERID:
                    ++pos;
                    pObject.setHousekeeperid(Manager.getInteger(rs, pos));
                    break;
                case ID_PERSONNELID:
                    ++pos;
                    pObject.setPersonnelid(Manager.getInteger(rs, pos));
                    break;
                case ID_ROOMID:
                    ++pos;
                    pObject.setRoomid(Manager.getInteger(rs, pos));
                    break;
                case ID_HOUSEUNITID:
                    ++pos;
                    pObject.setHouseunitid(Manager.getInteger(rs, pos));
                    break;
                case ID_RECDATE:
                    ++pos;
                    pObject.setRecdate(rs.getTimestamp(pos));
                    break;
                case ID_DELETED:
                    ++pos;
                    pObject.setDeleted(Manager.getBoolean(rs, pos));
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
     * @return an array of HousekeeperBean 
     */
    //41
    public HousekeeperBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of HousekeeperBean 
     */
    public HousekeeperBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (HousekeeperBean[])v.toArray(new HousekeeperBean[0]);
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
    private HousekeeperListener listener = null;

    /**
     * Registers a unique HousekeeperListener listener.
     */
    //66.5
    public void registerListener(HousekeeperListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the HousekeeperBean pObject.
     *
     * @param pObject the HousekeeperBean pObject to be saved
     */
    //67
    void beforeInsert(HousekeeperBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the HousekeeperBean pObject.
     *
     * @param pObject the HousekeeperBean pObject to be saved
     */
    //68
    void afterInsert(HousekeeperBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the HousekeeperBean pObject.
     *
     * @param pObject the HousekeeperBean pObject to be updated
     */
    //69
    void beforeUpdate(HousekeeperBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the HousekeeperBean pObject.
     *
     * @param pObject the HousekeeperBean pObject to be updated
     */
    //70
    void afterUpdate(HousekeeperBean pObject) throws SQLException {
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
