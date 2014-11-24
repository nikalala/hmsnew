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
 * Handles database calls for the changelog table.
 */
public class ChangelogManager
// extends+ 

// extends- 

{

    /**
     * Column changelogid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_CHANGELOGID = 0;
    public static final int TYPE_CHANGELOGID = Types.BIGINT;
    public static final String NAME_CHANGELOGID = "changelogid";

    /**
     * Column name of type Types.VARCHAR mapped to String.
     */
    public static final int ID_NAME = 1;
    public static final int TYPE_NAME = Types.VARCHAR;
    public static final String NAME_NAME = "name";

    /**
     * Column changebyid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_CHANGEBYID = 2;
    public static final int TYPE_CHANGEBYID = Types.INTEGER;
    public static final String NAME_CHANGEBYID = "changebyid";

    /**
     * Column changedate of type Types.TIMESTAMP mapped to java.sql.Timestamp.
     */
    public static final int ID_CHANGEDATE = 3;
    public static final int TYPE_CHANGEDATE = Types.TIMESTAMP;
    public static final String NAME_CHANGEDATE = "changedate";

    /**
     * Column id of type Types.BIGINT mapped to Long.
     */
    public static final int ID_ID = 4;
    public static final int TYPE_ID = Types.BIGINT;
    public static final String NAME_ID = "id";


    private static final String TABLE_NAME = "changelog";

    /**
     * Create an array of type string containing all the fields of the changelog table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "changelog.changelogid"
        ,"changelog.name"
        ,"changelog.changebyid"
        ,"changelog.changedate"
        ,"changelog.id"
    };

    /**
     * Field that contains the comma separated fields of the changelog table.
     */
    private static final String ALL_FIELDS = "changelog.changelogid"
                            + ",changelog.name"
                            + ",changelog.changebyid"
                            + ",changelog.changedate"
                            + ",changelog.id";

    private static ChangelogManager singleton = new ChangelogManager();

    /**
     * Get the ChangelogManager singleton.
     *
     * @return ChangelogManager 
     */
    synchronized public static ChangelogManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own ChangelogManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(ChangelogManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new ChangelogBean instance.
     *
     * @return the new ChangelogBean 
     */
    public ChangelogBean createChangelogBean()
    {
        return new ChangelogBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a ChangelogBean from the changelog using its key fields.
     *
     * @return a unique ChangelogBean 
     */
    //12
    public ChangelogBean loadByPrimaryKey(Long changelogid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM changelog WHERE changelog.changelogid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, changelogid);
            ChangelogBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Long changelogid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from changelog WHERE changelog.changelogid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, changelogid);
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
     * Loads ChangelogBean array from the changelog table using its changebyid field.
     *
     * @return an array of ChangelogBean 
     */
    // LOAD BY IMPORTED KEY
    public ChangelogBean[] loadByChangebyid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM changelog WHERE changebyid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the changelog table by changebyid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByChangebyid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM changelog WHERE changebyid=?");
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
     * Retrieves the PersonellBean object from the changelog.personellid field.
     *
     * @param pObject the ChangelogBean 
     * @return the associated PersonellBean pObject
     */
    // GET IMPORTED
    public PersonellBean getPersonellBean(ChangelogBean pObject) throws SQLException
    {
        PersonellBean other = PersonellManager.getInstance().createPersonellBean();
        other.setPersonellid(pObject.getChangebyid());
        return PersonellManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the ChangelogBean object to the PersonellBean object.
     *
     * @param pObject the ChangelogBean object to use
     * @param pObjectToBeSet the PersonellBean object to associate to the ChangelogBean 
     * @return the associated PersonellBean pObject
     */
    // SET IMPORTED
    public ChangelogBean setPersonellBean(ChangelogBean pObject,PersonellBean pObjectToBeSet)
    {
        pObject.setChangebyid(pObjectToBeSet.getPersonellid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from changelog.
     *
     * @return an array of ChangelogManager pObject
     */
    //38
    public ChangelogBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM changelog",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of ChangelogBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting ChangelogBean table 
     */
    //49
    public ChangelogBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of ChangelogBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting ChangelogBean table 
     */
    //51
    public ChangelogBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from changelog " + where;
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
            buff.append(" from changelog ");
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

            return (ChangelogBean[])v.toArray(new ChangelogBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from changelog table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the changelog table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM changelog " + where;
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
     * Saves the ChangelogBean pObject into the database.
     *
     * @param pObject the ChangelogBean pObject to be saved
     */
    //100
    public ChangelogBean save(ChangelogBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isChangelogidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('changelogid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setChangelogid(Manager.getLong(rs, 1));
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
                _sql = new StringBuffer("INSERT into changelog (");
    
                if (pObject.isChangelogidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("changelogid");
                    _dirtyCount++;
                }

                if (pObject.isNameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("name");
                    _dirtyCount++;
                }

                if (pObject.isChangebyidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("changebyid");
                    _dirtyCount++;
                }

                if (pObject.isChangedateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("changedate");
                    _dirtyCount++;
                }

                if (pObject.isIdModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("id");
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

                if (pObject.isChangelogidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getChangelogid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (pObject.isChangebyidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getChangebyid());
                }
    
                if (pObject.isChangedateModified()) {
                    ps.setTimestamp(++_dirtyCount, pObject.getChangedate());
                }
    
                if (pObject.isIdModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getId());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE changelog SET ");
                boolean useComma=false;

                if (pObject.isChangelogidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("changelogid").append("=?");
                }

                if (pObject.isNameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("name").append("=?");
                }

                if (pObject.isChangebyidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("changebyid").append("=?");
                }

                if (pObject.isChangedateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("changedate").append("=?");
                }

                if (pObject.isIdModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("id").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("changelog.changelogid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isChangelogidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getChangelogid());
                }

                if (pObject.isNameModified()) {
                      ps.setString(++_dirtyCount, pObject.getName());
                }

                if (pObject.isChangebyidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getChangebyid());
                }

                if (pObject.isChangedateModified()) {
                      ps.setTimestamp(++_dirtyCount, pObject.getChangedate());
                }

                if (pObject.isIdModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getId());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setLong(ps, ++_dirtyCount, pObject.getChangelogid());
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
     * Saves an array of ChangelogBean pObjects into the database.
     *
     * @param pObjects the ChangelogBean pObject table to be saved
     * @return the saved ChangelogBean array.
     */
    //65
    public ChangelogBean[] save(ChangelogBean[] pObjects) throws SQLException 
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
     * Loads a unique ChangelogBean pObject from a template one giving a c
     *
     * @param pObject the ChangelogBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public ChangelogBean loadUniqueUsingTemplate(ChangelogBean pObject) throws SQLException
    {
         ChangelogBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of ChangelogBean from a template one.
     *
     * @param pObject the ChangelogBean template to look for
     * @return all the ChangelogBean matching the template
     */
    //88
    public ChangelogBean[] loadUsingTemplate(ChangelogBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from changelog WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isChangelogidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("changelogid= ?");
             }
    
             if (pObject.isNameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
             }
    
             if (pObject.isChangebyidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("changebyid= ?");
             }
    
             if (pObject.isChangedateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("changedate= ?");
             }
    
             if (pObject.isIdModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("id= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isChangelogidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getChangelogid());
             }
    
             if (pObject.isNameModified()) {
                 ps.setString(++_dirtyCount, pObject.getName());
             }
    
             if (pObject.isChangebyidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getChangebyid());
             }
    
             if (pObject.isChangedateModified()) {
                 ps.setTimestamp(++_dirtyCount, pObject.getChangedate());
             }
    
             if (pObject.isIdModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getId());
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
     * Deletes rows using a ChangelogBean template.
     *
     * @param pObject the ChangelogBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(ChangelogBean pObject) throws SQLException
    {
        if (pObject.isChangelogidInitialized())
            return deleteByPrimaryKey(pObject.getChangelogid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM changelog WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isChangelogidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("changelogid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isNameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("name").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isChangebyidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("changebyid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isChangedateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("changedate").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isIdInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("id").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isChangelogidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getChangelogid());
            }
    
            if (pObject.isNameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getName());
            }
    
            if (pObject.isChangebyidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getChangebyid());
            }
    
            if (pObject.isChangedateInitialized()) {
                ps.setTimestamp(++_dirtyCount, pObject.getChangedate());
            }
    
            if (pObject.isIdInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getId());
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
     * Retrieves the number of rows of the table changelog.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table changelog with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from changelog " + where;
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
     * Retrieves the number of rows of the table changelog with a prepared statement.
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
     * Looks for the number of elements of a specific ChangelogBean pObject given a c
     *
     * @param pObject the ChangelogBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(ChangelogBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from changelog WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isChangelogidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("changelogid= ?");
                }
    
                if (pObject.isNameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
                }
    
                if (pObject.isChangebyidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("changebyid= ?");
                }
    
                if (pObject.isChangedateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("changedate= ?");
                }
    
                if (pObject.isIdModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("id= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isChangelogidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getChangelogid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (pObject.isChangebyidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getChangebyid());
                }
    
                if (pObject.isChangedateModified()) {
                    ps.setTimestamp(++_dirtyCount, pObject.getChangedate());
                }
    
                if (pObject.isIdModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getId());
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
     * Transforms a ResultSet iterating on the changelog on a ChangelogBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting ChangelogBean pObject
     */
    //72
    public ChangelogBean decodeRow(ResultSet rs) throws SQLException
    {
        ChangelogBean pObject = createChangelogBean();
        pObject.setChangelogid(Manager.getLong(rs, 1));
        pObject.setName(rs.getString(2));
        pObject.setChangebyid(Manager.getInteger(rs, 3));
        pObject.setChangedate(rs.getTimestamp(4));
        pObject.setId(Manager.getLong(rs, 5));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the changelog table on a ChangelogBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting ChangelogBean pObject
     */
    //73
    public ChangelogBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        ChangelogBean pObject = createChangelogBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_CHANGELOGID:
                    ++pos;
                    pObject.setChangelogid(Manager.getLong(rs, pos));
                    break;
                case ID_NAME:
                    ++pos;
                    pObject.setName(rs.getString(pos));
                    break;
                case ID_CHANGEBYID:
                    ++pos;
                    pObject.setChangebyid(Manager.getInteger(rs, pos));
                    break;
                case ID_CHANGEDATE:
                    ++pos;
                    pObject.setChangedate(rs.getTimestamp(pos));
                    break;
                case ID_ID:
                    ++pos;
                    pObject.setId(Manager.getLong(rs, pos));
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
     * @return an array of ChangelogBean 
     */
    //41
    public ChangelogBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of ChangelogBean 
     */
    public ChangelogBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (ChangelogBean[])v.toArray(new ChangelogBean[0]);
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
    private ChangelogListener listener = null;

    /**
     * Registers a unique ChangelogListener listener.
     */
    //66.5
    public void registerListener(ChangelogListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the ChangelogBean pObject.
     *
     * @param pObject the ChangelogBean pObject to be saved
     */
    //67
    void beforeInsert(ChangelogBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the ChangelogBean pObject.
     *
     * @param pObject the ChangelogBean pObject to be saved
     */
    //68
    void afterInsert(ChangelogBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the ChangelogBean pObject.
     *
     * @param pObject the ChangelogBean pObject to be updated
     */
    //69
    void beforeUpdate(ChangelogBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the ChangelogBean pObject.
     *
     * @param pObject the ChangelogBean pObject to be updated
     */
    //70
    void afterUpdate(ChangelogBean pObject) throws SQLException {
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
