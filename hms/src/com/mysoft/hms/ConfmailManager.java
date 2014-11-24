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
 * Handles database calls for the confmail table.
 */
public class ConfmailManager
// extends+ 

// extends- 

{

    /**
     * Column confmailid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_CONFMAILID = 0;
    public static final int TYPE_CONFMAILID = Types.INTEGER;
    public static final String NAME_CONFMAILID = "confmailid";

    /**
     * Column smtp of type Types.VARCHAR mapped to String.
     */
    public static final int ID_SMTP = 1;
    public static final int TYPE_SMTP = Types.VARCHAR;
    public static final String NAME_SMTP = "smtp";

    /**
     * Column port of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_PORT = 2;
    public static final int TYPE_PORT = Types.INTEGER;
    public static final String NAME_PORT = "port";

    /**
     * Column username of type Types.VARCHAR mapped to String.
     */
    public static final int ID_USERNAME = 3;
    public static final int TYPE_USERNAME = Types.VARCHAR;
    public static final String NAME_USERNAME = "username";

    /**
     * Column pass of type Types.VARCHAR mapped to String.
     */
    public static final int ID_PASS = 4;
    public static final int TYPE_PASS = Types.VARCHAR;
    public static final String NAME_PASS = "pass";

    /**
     * Column frommail of type Types.VARCHAR mapped to String.
     */
    public static final int ID_FROMMAIL = 5;
    public static final int TYPE_FROMMAIL = Types.VARCHAR;
    public static final String NAME_FROMMAIL = "frommail";


    private static final String TABLE_NAME = "confmail";

    /**
     * Create an array of type string containing all the fields of the confmail table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "confmail.confmailid"
        ,"confmail.smtp"
        ,"confmail.port"
        ,"confmail.username"
        ,"confmail.pass"
        ,"confmail.frommail"
    };

    /**
     * Field that contains the comma separated fields of the confmail table.
     */
    private static final String ALL_FIELDS = "confmail.confmailid"
                            + ",confmail.smtp"
                            + ",confmail.port"
                            + ",confmail.username"
                            + ",confmail.pass"
                            + ",confmail.frommail";

    private static ConfmailManager singleton = new ConfmailManager();

    /**
     * Get the ConfmailManager singleton.
     *
     * @return ConfmailManager 
     */
    synchronized public static ConfmailManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own ConfmailManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(ConfmailManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new ConfmailBean instance.
     *
     * @return the new ConfmailBean 
     */
    public ConfmailBean createConfmailBean()
    {
        return new ConfmailBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a ConfmailBean from the confmail using its key fields.
     *
     * @return a unique ConfmailBean 
     */
    //12
    public ConfmailBean loadByPrimaryKey(Integer confmailid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM confmail WHERE confmail.confmailid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, confmailid);
            ConfmailBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer confmailid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from confmail WHERE confmail.confmailid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, confmailid);
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
     * Loads all the rows from confmail.
     *
     * @return an array of ConfmailManager pObject
     */
    //38
    public ConfmailBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM confmail",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of ConfmailBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting ConfmailBean table 
     */
    //49
    public ConfmailBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of ConfmailBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting ConfmailBean table 
     */
    //51
    public ConfmailBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from confmail " + where;
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
            buff.append(" from confmail ");
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

            return (ConfmailBean[])v.toArray(new ConfmailBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from confmail table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the confmail table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM confmail " + where;
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
     * Saves the ConfmailBean pObject into the database.
     *
     * @param pObject the ConfmailBean pObject to be saved
     */
    //100
    public ConfmailBean save(ConfmailBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isConfmailidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('confmailid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setConfmailid(Manager.getInteger(rs, 1));
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
                _sql = new StringBuffer("INSERT into confmail (");
    
                if (pObject.isConfmailidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("confmailid");
                    _dirtyCount++;
                }

                if (pObject.isSmtpModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("smtp");
                    _dirtyCount++;
                }

                if (pObject.isPortModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("port");
                    _dirtyCount++;
                }

                if (pObject.isUsernameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("username");
                    _dirtyCount++;
                }

                if (pObject.isPassModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("pass");
                    _dirtyCount++;
                }

                if (pObject.isFrommailModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("frommail");
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

                if (pObject.isConfmailidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getConfmailid());
                }
    
                if (pObject.isSmtpModified()) {
                    ps.setString(++_dirtyCount, pObject.getSmtp());
                }
    
                if (pObject.isPortModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getPort());
                }
    
                if (pObject.isUsernameModified()) {
                    ps.setString(++_dirtyCount, pObject.getUsername());
                }
    
                if (pObject.isPassModified()) {
                    ps.setString(++_dirtyCount, pObject.getPass());
                }
    
                if (pObject.isFrommailModified()) {
                    ps.setString(++_dirtyCount, pObject.getFrommail());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE confmail SET ");
                boolean useComma=false;

                if (pObject.isConfmailidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("confmailid").append("=?");
                }

                if (pObject.isSmtpModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("smtp").append("=?");
                }

                if (pObject.isPortModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("port").append("=?");
                }

                if (pObject.isUsernameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("username").append("=?");
                }

                if (pObject.isPassModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("pass").append("=?");
                }

                if (pObject.isFrommailModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("frommail").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("confmail.confmailid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isConfmailidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getConfmailid());
                }

                if (pObject.isSmtpModified()) {
                      ps.setString(++_dirtyCount, pObject.getSmtp());
                }

                if (pObject.isPortModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getPort());
                }

                if (pObject.isUsernameModified()) {
                      ps.setString(++_dirtyCount, pObject.getUsername());
                }

                if (pObject.isPassModified()) {
                      ps.setString(++_dirtyCount, pObject.getPass());
                }

                if (pObject.isFrommailModified()) {
                      ps.setString(++_dirtyCount, pObject.getFrommail());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getConfmailid());
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
     * Saves an array of ConfmailBean pObjects into the database.
     *
     * @param pObjects the ConfmailBean pObject table to be saved
     * @return the saved ConfmailBean array.
     */
    //65
    public ConfmailBean[] save(ConfmailBean[] pObjects) throws SQLException 
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
     * Loads a unique ConfmailBean pObject from a template one giving a c
     *
     * @param pObject the ConfmailBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public ConfmailBean loadUniqueUsingTemplate(ConfmailBean pObject) throws SQLException
    {
         ConfmailBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of ConfmailBean from a template one.
     *
     * @param pObject the ConfmailBean template to look for
     * @return all the ConfmailBean matching the template
     */
    //88
    public ConfmailBean[] loadUsingTemplate(ConfmailBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from confmail WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isConfmailidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("confmailid= ?");
             }
    
             if (pObject.isSmtpModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("smtp= ?");
             }
    
             if (pObject.isPortModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("port= ?");
             }
    
             if (pObject.isUsernameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("username= ?");
             }
    
             if (pObject.isPassModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("pass= ?");
             }
    
             if (pObject.isFrommailModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("frommail= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isConfmailidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getConfmailid());
             }
    
             if (pObject.isSmtpModified()) {
                 ps.setString(++_dirtyCount, pObject.getSmtp());
             }
    
             if (pObject.isPortModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getPort());
             }
    
             if (pObject.isUsernameModified()) {
                 ps.setString(++_dirtyCount, pObject.getUsername());
             }
    
             if (pObject.isPassModified()) {
                 ps.setString(++_dirtyCount, pObject.getPass());
             }
    
             if (pObject.isFrommailModified()) {
                 ps.setString(++_dirtyCount, pObject.getFrommail());
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
     * Deletes rows using a ConfmailBean template.
     *
     * @param pObject the ConfmailBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(ConfmailBean pObject) throws SQLException
    {
        if (pObject.isConfmailidInitialized())
            return deleteByPrimaryKey(pObject.getConfmailid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM confmail WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isConfmailidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("confmailid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isSmtpInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("smtp").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isPortInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("port").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isUsernameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("username").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isPassInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("pass").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isFrommailInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("frommail").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isConfmailidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getConfmailid());
            }
    
            if (pObject.isSmtpInitialized()) {
                ps.setString(++_dirtyCount, pObject.getSmtp());
            }
    
            if (pObject.isPortInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getPort());
            }
    
            if (pObject.isUsernameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getUsername());
            }
    
            if (pObject.isPassInitialized()) {
                ps.setString(++_dirtyCount, pObject.getPass());
            }
    
            if (pObject.isFrommailInitialized()) {
                ps.setString(++_dirtyCount, pObject.getFrommail());
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
     * Retrieves the number of rows of the table confmail.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table confmail with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from confmail " + where;
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
     * Retrieves the number of rows of the table confmail with a prepared statement.
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
     * Looks for the number of elements of a specific ConfmailBean pObject given a c
     *
     * @param pObject the ConfmailBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(ConfmailBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from confmail WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isConfmailidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("confmailid= ?");
                }
    
                if (pObject.isSmtpModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("smtp= ?");
                }
    
                if (pObject.isPortModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("port= ?");
                }
    
                if (pObject.isUsernameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("username= ?");
                }
    
                if (pObject.isPassModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("pass= ?");
                }
    
                if (pObject.isFrommailModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("frommail= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isConfmailidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getConfmailid());
                }
    
                if (pObject.isSmtpModified()) {
                    ps.setString(++_dirtyCount, pObject.getSmtp());
                }
    
                if (pObject.isPortModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getPort());
                }
    
                if (pObject.isUsernameModified()) {
                    ps.setString(++_dirtyCount, pObject.getUsername());
                }
    
                if (pObject.isPassModified()) {
                    ps.setString(++_dirtyCount, pObject.getPass());
                }
    
                if (pObject.isFrommailModified()) {
                    ps.setString(++_dirtyCount, pObject.getFrommail());
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
     * Transforms a ResultSet iterating on the confmail on a ConfmailBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting ConfmailBean pObject
     */
    //72
    public ConfmailBean decodeRow(ResultSet rs) throws SQLException
    {
        ConfmailBean pObject = createConfmailBean();
        pObject.setConfmailid(Manager.getInteger(rs, 1));
        pObject.setSmtp(rs.getString(2));
        pObject.setPort(Manager.getInteger(rs, 3));
        pObject.setUsername(rs.getString(4));
        pObject.setPass(rs.getString(5));
        pObject.setFrommail(rs.getString(6));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the confmail table on a ConfmailBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting ConfmailBean pObject
     */
    //73
    public ConfmailBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        ConfmailBean pObject = createConfmailBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_CONFMAILID:
                    ++pos;
                    pObject.setConfmailid(Manager.getInteger(rs, pos));
                    break;
                case ID_SMTP:
                    ++pos;
                    pObject.setSmtp(rs.getString(pos));
                    break;
                case ID_PORT:
                    ++pos;
                    pObject.setPort(Manager.getInteger(rs, pos));
                    break;
                case ID_USERNAME:
                    ++pos;
                    pObject.setUsername(rs.getString(pos));
                    break;
                case ID_PASS:
                    ++pos;
                    pObject.setPass(rs.getString(pos));
                    break;
                case ID_FROMMAIL:
                    ++pos;
                    pObject.setFrommail(rs.getString(pos));
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
     * @return an array of ConfmailBean 
     */
    //41
    public ConfmailBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of ConfmailBean 
     */
    public ConfmailBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (ConfmailBean[])v.toArray(new ConfmailBean[0]);
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
    private ConfmailListener listener = null;

    /**
     * Registers a unique ConfmailListener listener.
     */
    //66.5
    public void registerListener(ConfmailListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the ConfmailBean pObject.
     *
     * @param pObject the ConfmailBean pObject to be saved
     */
    //67
    void beforeInsert(ConfmailBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the ConfmailBean pObject.
     *
     * @param pObject the ConfmailBean pObject to be saved
     */
    //68
    void afterInsert(ConfmailBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the ConfmailBean pObject.
     *
     * @param pObject the ConfmailBean pObject to be updated
     */
    //69
    void beforeUpdate(ConfmailBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the ConfmailBean pObject.
     *
     * @param pObject the ConfmailBean pObject to be updated
     */
    //70
    void afterUpdate(ConfmailBean pObject) throws SQLException {
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
