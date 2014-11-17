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
 * Handles database calls for the closedate table.
 */
public class ClosedateManager
// extends+ 

// extends- 
{

    /**
     * Column closedateid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_CLOSEDATEID = 0;
    public static final int TYPE_CLOSEDATEID = Types.BIGINT;
    public static final String NAME_CLOSEDATEID = "closedateid";

    /**
     * Column cldate of type Types.DATE mapped to java.util.Date.
     */
    public static final int ID_CLDATE = 1;
    public static final int TYPE_CLDATE = Types.DATE;
    public static final String NAME_CLDATE = "cldate";

    /**
     * Column regbyid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_REGBYID = 2;
    public static final int TYPE_REGBYID = Types.INTEGER;
    public static final String NAME_REGBYID = "regbyid";

    /**
     * Column regdate of type Types.TIMESTAMP mapped to java.sql.Timestamp.
     */
    public static final int ID_REGDATE = 3;
    public static final int TYPE_REGDATE = Types.TIMESTAMP;
    public static final String NAME_REGDATE = "regdate";


    private static final String TABLE_NAME = "closedate";

    /**
     * Create an array of type string containing all the fields of the closedate table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "closedate.closedateid"
        ,"closedate.cldate"
        ,"closedate.regbyid"
        ,"closedate.regdate"
    };

    /**
     * Field that contains the comma separated fields of the closedate table.
     */
    private static final String ALL_FIELDS = "closedate.closedateid"
                            + ",closedate.cldate"
                            + ",closedate.regbyid"
                            + ",closedate.regdate";

    private static ClosedateManager singleton = new ClosedateManager();

    /**
     * Get the ClosedateManager singleton.
     *
     * @return ClosedateManager 
     */
    synchronized public static ClosedateManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own ClosedateManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(ClosedateManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new ClosedateBean instance.
     *
     * @return the new ClosedateBean 
     */
    public ClosedateBean createClosedateBean()
    {
        return new ClosedateBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a ClosedateBean from the closedate using its key fields.
     *
     * @return a unique ClosedateBean 
     */
    //12
    public ClosedateBean loadByPrimaryKey(Long closedateid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM closedate WHERE closedate.closedateid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, closedateid);
            ClosedateBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Long closedateid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from closedate WHERE closedate.closedateid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, closedateid);
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
     * Loads all the rows from closedate.
     *
     * @return an array of ClosedateManager pObject
     */
    //38
    public ClosedateBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM closedate",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of ClosedateBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting ClosedateBean table 
     */
    //49
    public ClosedateBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of ClosedateBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting ClosedateBean table 
     */
    //51
    public ClosedateBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from closedate " + where;
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
            buff.append(" from closedate ");
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

            return (ClosedateBean[])v.toArray(new ClosedateBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from closedate table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the closedate table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM closedate " + where;
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
     * Saves the ClosedateBean pObject into the database.
     *
     * @param pObject the ClosedateBean pObject to be saved
     */
    //100
    public ClosedateBean save(ClosedateBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isClosedateidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('closedateid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setClosedateid(Manager.getLong(rs, 1));
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
                _sql = new StringBuffer("INSERT into closedate (");
    
                if (pObject.isClosedateidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("closedateid");
                    _dirtyCount++;
                }

                if (pObject.isCldateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("cldate");
                    _dirtyCount++;
                }

                if (pObject.isRegbyidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("regbyid");
                    _dirtyCount++;
                }

                if (pObject.isRegdateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("regdate");
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

                if (pObject.isClosedateidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getClosedateid());
                }
    
                if (pObject.isCldateModified()) {
                    if (pObject.getCldate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new java.sql.Date(pObject.getCldate().getTime()));
                }
    
                if (pObject.isRegbyidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRegbyid());
                }
    
                if (pObject.isRegdateModified()) {
                    ps.setTimestamp(++_dirtyCount, pObject.getRegdate());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE closedate SET ");
                boolean useComma=false;

                if (pObject.isClosedateidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("closedateid").append("=?");
                }

                if (pObject.isCldateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("cldate").append("=?");
                }

                if (pObject.isRegbyidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("regbyid").append("=?");
                }

                if (pObject.isRegdateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("regdate").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("closedate.closedateid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isClosedateidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getClosedateid());
                }

                if (pObject.isCldateModified()) {
                      if (pObject.getCldate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new java.sql.Date(pObject.getCldate().getTime()));
                }

                if (pObject.isRegbyidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getRegbyid());
                }

                if (pObject.isRegdateModified()) {
                      ps.setTimestamp(++_dirtyCount, pObject.getRegdate());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setLong(ps, ++_dirtyCount, pObject.getClosedateid());
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
     * Saves an array of ClosedateBean pObjects into the database.
     *
     * @param pObjects the ClosedateBean pObject table to be saved
     * @return the saved ClosedateBean array.
     */
    //65
    public ClosedateBean[] save(ClosedateBean[] pObjects) throws SQLException 
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
     * Loads a unique ClosedateBean pObject from a template one giving a c
     *
     * @param pObject the ClosedateBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public ClosedateBean loadUniqueUsingTemplate(ClosedateBean pObject) throws SQLException
    {
         ClosedateBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of ClosedateBean from a template one.
     *
     * @param pObject the ClosedateBean template to look for
     * @return all the ClosedateBean matching the template
     */
    //88
    public ClosedateBean[] loadUsingTemplate(ClosedateBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from closedate WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isClosedateidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("closedateid= ?");
             }
    
             if (pObject.isCldateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("cldate= ?");
             }
    
             if (pObject.isRegbyidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("regbyid= ?");
             }
    
             if (pObject.isRegdateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("regdate= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isClosedateidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getClosedateid());
             }
    
             if (pObject.isCldateModified()) {
                 if (pObject.getCldate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new java.sql.Date(pObject.getCldate().getTime()));
             }
    
             if (pObject.isRegbyidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getRegbyid());
             }
    
             if (pObject.isRegdateModified()) {
                 ps.setTimestamp(++_dirtyCount, pObject.getRegdate());
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
     * Deletes rows using a ClosedateBean template.
     *
     * @param pObject the ClosedateBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(ClosedateBean pObject) throws SQLException
    {
        if (pObject.isClosedateidInitialized())
            return deleteByPrimaryKey(pObject.getClosedateid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM closedate WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isClosedateidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("closedateid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isCldateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("cldate").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRegbyidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("regbyid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRegdateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("regdate").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isClosedateidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getClosedateid());
            }
    
            if (pObject.isCldateInitialized()) {
                if (pObject.getCldate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new java.sql.Date(pObject.getCldate().getTime()));
            }
    
            if (pObject.isRegbyidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRegbyid());
            }
    
            if (pObject.isRegdateInitialized()) {
                ps.setTimestamp(++_dirtyCount, pObject.getRegdate());
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
     * Retrieves the number of rows of the table closedate.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table closedate with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from closedate " + where;
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
     * Retrieves the number of rows of the table closedate with a prepared statement.
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
     * Looks for the number of elements of a specific ClosedateBean pObject given a c
     *
     * @param pObject the ClosedateBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(ClosedateBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from closedate WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isClosedateidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("closedateid= ?");
                }
    
                if (pObject.isCldateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("cldate= ?");
                }
    
                if (pObject.isRegbyidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("regbyid= ?");
                }
    
                if (pObject.isRegdateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("regdate= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isClosedateidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getClosedateid());
                }
    
                if (pObject.isCldateModified()) {
                    if (pObject.getCldate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new java.sql.Date(pObject.getCldate().getTime()));
                }
    
                if (pObject.isRegbyidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRegbyid());
                }
    
                if (pObject.isRegdateModified()) {
                    ps.setTimestamp(++_dirtyCount, pObject.getRegdate());
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
     * Transforms a ResultSet iterating on the closedate on a ClosedateBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting ClosedateBean pObject
     */
    //72
    public ClosedateBean decodeRow(ResultSet rs) throws SQLException
    {
        ClosedateBean pObject = createClosedateBean();
        pObject.setClosedateid(Manager.getLong(rs, 1));
        pObject.setCldate(rs.getDate(2));
        pObject.setRegbyid(Manager.getInteger(rs, 3));
        pObject.setRegdate(rs.getTimestamp(4));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the closedate table on a ClosedateBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting ClosedateBean pObject
     */
    //73
    public ClosedateBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        ClosedateBean pObject = createClosedateBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_CLOSEDATEID:
                    ++pos;
                    pObject.setClosedateid(Manager.getLong(rs, pos));
                    break;
                case ID_CLDATE:
                    ++pos;
                    pObject.setCldate(rs.getDate(pos));
                    break;
                case ID_REGBYID:
                    ++pos;
                    pObject.setRegbyid(Manager.getInteger(rs, pos));
                    break;
                case ID_REGDATE:
                    ++pos;
                    pObject.setRegdate(rs.getTimestamp(pos));
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
     * @return an array of ClosedateBean 
     */
    //41
    public ClosedateBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of ClosedateBean 
     */
    public ClosedateBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (ClosedateBean[])v.toArray(new ClosedateBean[0]);
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
    private ClosedateListener listener = null;

    /**
     * Registers a unique ClosedateListener listener.
     */
    //66.5
    public void registerListener(ClosedateListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the ClosedateBean pObject.
     *
     * @param pObject the ClosedateBean pObject to be saved
     */
    //67
    void beforeInsert(ClosedateBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the ClosedateBean pObject.
     *
     * @param pObject the ClosedateBean pObject to be saved
     */
    //68
    void afterInsert(ClosedateBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the ClosedateBean pObject.
     *
     * @param pObject the ClosedateBean pObject to be updated
     */
    //69
    void beforeUpdate(ClosedateBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the ClosedateBean pObject.
     *
     * @param pObject the ClosedateBean pObject to be updated
     */
    //70
    void afterUpdate(ClosedateBean pObject) throws SQLException {
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