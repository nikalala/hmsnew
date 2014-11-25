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
 * Handles database calls for the city table.
 */
public class CityManager
// extends+ 

// extends- 

{

    /**
     * Column cityid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_CITYID = 0;
    public static final int TYPE_CITYID = Types.INTEGER;
    public static final String NAME_CITYID = "cityid";

    /**
     * Column regionid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_REGIONID = 1;
    public static final int TYPE_REGIONID = Types.INTEGER;
    public static final String NAME_REGIONID = "regionid";

    /**
     * Column name of type Types.VARCHAR mapped to String.
     */
    public static final int ID_NAME = 2;
    public static final int TYPE_NAME = Types.VARCHAR;
    public static final String NAME_NAME = "name";

    /**
     * Column code of type Types.VARCHAR mapped to String.
     */
    public static final int ID_CODE = 3;
    public static final int TYPE_CODE = Types.VARCHAR;
    public static final String NAME_CODE = "code";

    /**
     * Column ext of type Types.VARCHAR mapped to String.
     */
    public static final int ID_EXT = 4;
    public static final int TYPE_EXT = Types.VARCHAR;
    public static final String NAME_EXT = "ext";


    private static final String TABLE_NAME = "city";

    /**
     * Create an array of type string containing all the fields of the city table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "city.cityid"
        ,"city.regionid"
        ,"city.name"
        ,"city.code"
        ,"city.ext"
    };

    /**
     * Field that contains the comma separated fields of the city table.
     */
    private static final String ALL_FIELDS = "city.cityid"
                            + ",city.regionid"
                            + ",city.name"
                            + ",city.code"
                            + ",city.ext";

    private static CityManager singleton = new CityManager();

    /**
     * Get the CityManager singleton.
     *
     * @return CityManager 
     */
    synchronized public static CityManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own CityManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(CityManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new CityBean instance.
     *
     * @return the new CityBean 
     */
    public CityBean createCityBean()
    {
        return new CityBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a CityBean from the city using its key fields.
     *
     * @return a unique CityBean 
     */
    //12
    public CityBean loadByPrimaryKey(Integer cityid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM city WHERE city.cityid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, cityid);
            CityBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer cityid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from city WHERE city.cityid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, cityid);
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
     * Loads CityBean array from the city table using its regionid field.
     *
     * @return an array of CityBean 
     */
    // LOAD BY IMPORTED KEY
    public CityBean[] loadByRegionid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM city WHERE regionid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the city table by regionid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByRegionid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM city WHERE regionid=?");
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
     * Retrieves the RegionBean object from the city.regionid field.
     *
     * @param pObject the CityBean 
     * @return the associated RegionBean pObject
     */
    // GET IMPORTED
    public RegionBean getRegionBean(CityBean pObject) throws SQLException
    {
        RegionBean other = RegionManager.getInstance().createRegionBean();
        other.setRegionid(pObject.getRegionid());
        return RegionManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the CityBean object to the RegionBean object.
     *
     * @param pObject the CityBean object to use
     * @param pObjectToBeSet the RegionBean object to associate to the CityBean 
     * @return the associated RegionBean pObject
     */
    // SET IMPORTED
    public CityBean setRegionBean(CityBean pObject,RegionBean pObjectToBeSet)
    {
        pObject.setRegionid(pObjectToBeSet.getRegionid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from city.
     *
     * @return an array of CityManager pObject
     */
    //38
    public CityBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM city",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of CityBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting CityBean table 
     */
    //49
    public CityBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of CityBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting CityBean table 
     */
    //51
    public CityBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from city " + where;
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
            buff.append(" from city ");
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

            return (CityBean[])v.toArray(new CityBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from city table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the city table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM city " + where;
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
     * Saves the CityBean pObject into the database.
     *
     * @param pObject the CityBean pObject to be saved
     */
    //100
    public CityBean save(CityBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isCityidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('cityid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setCityid(Manager.getInteger(rs, 1));
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
                _sql = new StringBuffer("INSERT into city (");
    
                if (pObject.isCityidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("cityid");
                    _dirtyCount++;
                }

                if (pObject.isRegionidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("regionid");
                    _dirtyCount++;
                }

                if (pObject.isNameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("name");
                    _dirtyCount++;
                }

                if (pObject.isCodeModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("code");
                    _dirtyCount++;
                }

                if (pObject.isExtModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("ext");
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

                if (pObject.isCityidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
                }
    
                if (pObject.isRegionidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRegionid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (pObject.isCodeModified()) {
                    ps.setString(++_dirtyCount, pObject.getCode());
                }
    
                if (pObject.isExtModified()) {
                    ps.setString(++_dirtyCount, pObject.getExt());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE city SET ");
                boolean useComma=false;

                if (pObject.isCityidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("cityid").append("=?");
                }

                if (pObject.isRegionidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("regionid").append("=?");
                }

                if (pObject.isNameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("name").append("=?");
                }

                if (pObject.isCodeModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("code").append("=?");
                }

                if (pObject.isExtModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("ext").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("city.cityid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isCityidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
                }

                if (pObject.isRegionidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getRegionid());
                }

                if (pObject.isNameModified()) {
                      ps.setString(++_dirtyCount, pObject.getName());
                }

                if (pObject.isCodeModified()) {
                      ps.setString(++_dirtyCount, pObject.getCode());
                }

                if (pObject.isExtModified()) {
                      ps.setString(++_dirtyCount, pObject.getExt());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
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
     * Saves an array of CityBean pObjects into the database.
     *
     * @param pObjects the CityBean pObject table to be saved
     * @return the saved CityBean array.
     */
    //65
    public CityBean[] save(CityBean[] pObjects) throws SQLException 
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
     * Loads a unique CityBean pObject from a template one giving a c
     *
     * @param pObject the CityBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public CityBean loadUniqueUsingTemplate(CityBean pObject) throws SQLException
    {
         CityBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of CityBean from a template one.
     *
     * @param pObject the CityBean template to look for
     * @return all the CityBean matching the template
     */
    //88
    public CityBean[] loadUsingTemplate(CityBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from city WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isCityidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("cityid= ?");
             }
    
             if (pObject.isRegionidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("regionid= ?");
             }
    
             if (pObject.isNameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
             }
    
             if (pObject.isCodeModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("code= ?");
             }
    
             if (pObject.isExtModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("ext= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isCityidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
             }
    
             if (pObject.isRegionidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getRegionid());
             }
    
             if (pObject.isNameModified()) {
                 ps.setString(++_dirtyCount, pObject.getName());
             }
    
             if (pObject.isCodeModified()) {
                 ps.setString(++_dirtyCount, pObject.getCode());
             }
    
             if (pObject.isExtModified()) {
                 ps.setString(++_dirtyCount, pObject.getExt());
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
     * Deletes rows using a CityBean template.
     *
     * @param pObject the CityBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(CityBean pObject) throws SQLException
    {
        if (pObject.isCityidInitialized())
            return deleteByPrimaryKey(pObject.getCityid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM city WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isCityidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("cityid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isRegionidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("regionid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isNameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("name").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isCodeInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("code").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isExtInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("ext").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isCityidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
            }
    
            if (pObject.isRegionidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getRegionid());
            }
    
            if (pObject.isNameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getName());
            }
    
            if (pObject.isCodeInitialized()) {
                ps.setString(++_dirtyCount, pObject.getCode());
            }
    
            if (pObject.isExtInitialized()) {
                ps.setString(++_dirtyCount, pObject.getExt());
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
     * Retrieves the number of rows of the table city.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table city with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from city " + where;
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
     * Retrieves the number of rows of the table city with a prepared statement.
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
     * Looks for the number of elements of a specific CityBean pObject given a c
     *
     * @param pObject the CityBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(CityBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from city WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isCityidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("cityid= ?");
                }
    
                if (pObject.isRegionidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("regionid= ?");
                }
    
                if (pObject.isNameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
                }
    
                if (pObject.isCodeModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("code= ?");
                }
    
                if (pObject.isExtModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("ext= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isCityidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
                }
    
                if (pObject.isRegionidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getRegionid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (pObject.isCodeModified()) {
                    ps.setString(++_dirtyCount, pObject.getCode());
                }
    
                if (pObject.isExtModified()) {
                    ps.setString(++_dirtyCount, pObject.getExt());
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
     * Transforms a ResultSet iterating on the city on a CityBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting CityBean pObject
     */
    //72
    public CityBean decodeRow(ResultSet rs) throws SQLException
    {
        CityBean pObject = createCityBean();
        pObject.setCityid(Manager.getInteger(rs, 1));
        pObject.setRegionid(Manager.getInteger(rs, 2));
        pObject.setName(rs.getString(3));
        pObject.setCode(rs.getString(4));
        pObject.setExt(rs.getString(5));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the city table on a CityBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting CityBean pObject
     */
    //73
    public CityBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        CityBean pObject = createCityBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_CITYID:
                    ++pos;
                    pObject.setCityid(Manager.getInteger(rs, pos));
                    break;
                case ID_REGIONID:
                    ++pos;
                    pObject.setRegionid(Manager.getInteger(rs, pos));
                    break;
                case ID_NAME:
                    ++pos;
                    pObject.setName(rs.getString(pos));
                    break;
                case ID_CODE:
                    ++pos;
                    pObject.setCode(rs.getString(pos));
                    break;
                case ID_EXT:
                    ++pos;
                    pObject.setExt(rs.getString(pos));
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
     * @return an array of CityBean 
     */
    //41
    public CityBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of CityBean 
     */
    public CityBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (CityBean[])v.toArray(new CityBean[0]);
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
    private CityListener listener = null;

    /**
     * Registers a unique CityListener listener.
     */
    //66.5
    public void registerListener(CityListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the CityBean pObject.
     *
     * @param pObject the CityBean pObject to be saved
     */
    //67
    void beforeInsert(CityBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the CityBean pObject.
     *
     * @param pObject the CityBean pObject to be saved
     */
    //68
    void afterInsert(CityBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the CityBean pObject.
     *
     * @param pObject the CityBean pObject to be updated
     */
    //69
    void beforeUpdate(CityBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the CityBean pObject.
     *
     * @param pObject the CityBean pObject to be updated
     */
    //70
    void afterUpdate(CityBean pObject) throws SQLException {
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