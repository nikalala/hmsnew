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
 * Handles database calls for the district table.
 */
public class DistrictManager
// extends+ 

// extends- 

{

    /**
     * Column districtid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_DISTRICTID = 0;
    public static final int TYPE_DISTRICTID = Types.INTEGER;
    public static final String NAME_DISTRICTID = "districtid";

    /**
     * Column cityid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_CITYID = 1;
    public static final int TYPE_CITYID = Types.INTEGER;
    public static final String NAME_CITYID = "cityid";

    /**
     * Column name of type Types.VARCHAR mapped to String.
     */
    public static final int ID_NAME = 2;
    public static final int TYPE_NAME = Types.VARCHAR;
    public static final String NAME_NAME = "name";


    private static final String TABLE_NAME = "district";

    /**
     * Create an array of type string containing all the fields of the district table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "district.districtid"
        ,"district.cityid"
        ,"district.name"
    };

    /**
     * Field that contains the comma separated fields of the district table.
     */
    private static final String ALL_FIELDS = "district.districtid"
                            + ",district.cityid"
                            + ",district.name";

    private static DistrictManager singleton = new DistrictManager();

    /**
     * Get the DistrictManager singleton.
     *
     * @return DistrictManager 
     */
    synchronized public static DistrictManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own DistrictManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(DistrictManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new DistrictBean instance.
     *
     * @return the new DistrictBean 
     */
    public DistrictBean createDistrictBean()
    {
        return new DistrictBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a DistrictBean from the district using its key fields.
     *
     * @return a unique DistrictBean 
     */
    //12
    public DistrictBean loadByPrimaryKey(Integer districtid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM district WHERE district.districtid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, districtid);
            DistrictBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Integer districtid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from district WHERE district.districtid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setInteger(ps, 1, districtid);
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
     * Loads DistrictBean array from the district table using its cityid field.
     *
     * @return an array of DistrictBean 
     */
    // LOAD BY IMPORTED KEY
    public DistrictBean[] loadByCityid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM district WHERE cityid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the district table by cityid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteByCityid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM district WHERE cityid=?");
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
     * Retrieves the CityBean object from the district.cityid field.
     *
     * @param pObject the DistrictBean 
     * @return the associated CityBean pObject
     */
    // GET IMPORTED
    public CityBean getCityBean(DistrictBean pObject) throws SQLException
    {
        CityBean other = CityManager.getInstance().createCityBean();
        other.setCityid(pObject.getCityid());
        return CityManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the DistrictBean object to the CityBean object.
     *
     * @param pObject the DistrictBean object to use
     * @param pObjectToBeSet the CityBean object to associate to the DistrictBean 
     * @return the associated CityBean pObject
     */
    // SET IMPORTED
    public DistrictBean setCityBean(DistrictBean pObject,CityBean pObjectToBeSet)
    {
        pObject.setCityid(pObjectToBeSet.getCityid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from district.
     *
     * @return an array of DistrictManager pObject
     */
    //38
    public DistrictBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM district",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of DistrictBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting DistrictBean table 
     */
    //49
    public DistrictBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of DistrictBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting DistrictBean table 
     */
    //51
    public DistrictBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from district " + where;
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
            buff.append(" from district ");
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

            return (DistrictBean[])v.toArray(new DistrictBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from district table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the district table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM district " + where;
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
     * Saves the DistrictBean pObject into the database.
     *
     * @param pObject the DistrictBean pObject to be saved
     */
    //100
    public DistrictBean save(DistrictBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isDistrictidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('districtid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setDistrictid(Manager.getInteger(rs, 1));
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
                _sql = new StringBuffer("INSERT into district (");
    
                if (pObject.isDistrictidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("districtid");
                    _dirtyCount++;
                }

                if (pObject.isCityidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("cityid");
                    _dirtyCount++;
                }

                if (pObject.isNameModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("name");
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

                if (pObject.isDistrictidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getDistrictid());
                }
    
                if (pObject.isCityidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE district SET ");
                boolean useComma=false;

                if (pObject.isDistrictidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("districtid").append("=?");
                }

                if (pObject.isCityidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("cityid").append("=?");
                }

                if (pObject.isNameModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("name").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("district.districtid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isDistrictidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getDistrictid());
                }

                if (pObject.isCityidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
                }

                if (pObject.isNameModified()) {
                      ps.setString(++_dirtyCount, pObject.getName());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setInteger(ps, ++_dirtyCount, pObject.getDistrictid());
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
     * Saves an array of DistrictBean pObjects into the database.
     *
     * @param pObjects the DistrictBean pObject table to be saved
     * @return the saved DistrictBean array.
     */
    //65
    public DistrictBean[] save(DistrictBean[] pObjects) throws SQLException 
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
     * Loads a unique DistrictBean pObject from a template one giving a c
     *
     * @param pObject the DistrictBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public DistrictBean loadUniqueUsingTemplate(DistrictBean pObject) throws SQLException
    {
         DistrictBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of DistrictBean from a template one.
     *
     * @param pObject the DistrictBean template to look for
     * @return all the DistrictBean matching the template
     */
    //88
    public DistrictBean[] loadUsingTemplate(DistrictBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from district WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isDistrictidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("districtid= ?");
             }
    
             if (pObject.isCityidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("cityid= ?");
             }
    
             if (pObject.isNameModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isDistrictidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getDistrictid());
             }
    
             if (pObject.isCityidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
             }
    
             if (pObject.isNameModified()) {
                 ps.setString(++_dirtyCount, pObject.getName());
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
     * Deletes rows using a DistrictBean template.
     *
     * @param pObject the DistrictBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(DistrictBean pObject) throws SQLException
    {
        if (pObject.isDistrictidInitialized())
            return deleteByPrimaryKey(pObject.getDistrictid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM district WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isDistrictidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("districtid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isCityidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("cityid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isNameInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("name").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isDistrictidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getDistrictid());
            }
    
            if (pObject.isCityidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
            }
    
            if (pObject.isNameInitialized()) {
                ps.setString(++_dirtyCount, pObject.getName());
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
    // MANY TO MANY: LOAD OTHER BEAN VIA JUNCTION TABLE 
    ///////////////////////////////////////////////////////////////////////
    /**
     * Retrieves an array of CountryBean using the relation table Hotel given a DistrictBean object.
     *
     * @param pObject the DistrictBean pObject to be used
     * @return an array of CountryBean 
     */
    // MANY TO MANY
    public CountryBean[] loadCountryViaHotel(DistrictBean pObject) throws SQLException
    {
         Connection c = null;
         PreparedStatement ps = null;
         String strSQL =      " SELECT "
                         + "        *"
                         + " FROM  "
                         + "        country,hotel"
                         + " WHERE "    
                         + "     hotel.districtid = ?"
                         + " AND hotel.countryid = country.countryid";
         try
         {
             c = getConnection();
             ps = c.prepareStatement(strSQL,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             Manager.setInteger(ps, 1, pObject.getDistrictid());
             return CountryManager.getInstance().loadByPreparedStatement(ps);
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
     * Retrieves the number of rows of the table district.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table district with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from district " + where;
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
     * Retrieves the number of rows of the table district with a prepared statement.
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
     * Looks for the number of elements of a specific DistrictBean pObject given a c
     *
     * @param pObject the DistrictBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(DistrictBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from district WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isDistrictidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("districtid= ?");
                }
    
                if (pObject.isCityidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("cityid= ?");
                }
    
                if (pObject.isNameModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("name= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isDistrictidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getDistrictid());
                }
    
                if (pObject.isCityidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getCityid());
                }
    
                if (pObject.isNameModified()) {
                    ps.setString(++_dirtyCount, pObject.getName());
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
     * Transforms a ResultSet iterating on the district on a DistrictBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting DistrictBean pObject
     */
    //72
    public DistrictBean decodeRow(ResultSet rs) throws SQLException
    {
        DistrictBean pObject = createDistrictBean();
        pObject.setDistrictid(Manager.getInteger(rs, 1));
        pObject.setCityid(Manager.getInteger(rs, 2));
        pObject.setName(rs.getString(3));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the district table on a DistrictBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting DistrictBean pObject
     */
    //73
    public DistrictBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        DistrictBean pObject = createDistrictBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_DISTRICTID:
                    ++pos;
                    pObject.setDistrictid(Manager.getInteger(rs, pos));
                    break;
                case ID_CITYID:
                    ++pos;
                    pObject.setCityid(Manager.getInteger(rs, pos));
                    break;
                case ID_NAME:
                    ++pos;
                    pObject.setName(rs.getString(pos));
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
     * @return an array of DistrictBean 
     */
    //41
    public DistrictBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of DistrictBean 
     */
    public DistrictBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (DistrictBean[])v.toArray(new DistrictBean[0]);
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
    private DistrictListener listener = null;

    /**
     * Registers a unique DistrictListener listener.
     */
    //66.5
    public void registerListener(DistrictListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the DistrictBean pObject.
     *
     * @param pObject the DistrictBean pObject to be saved
     */
    //67
    void beforeInsert(DistrictBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the DistrictBean pObject.
     *
     * @param pObject the DistrictBean pObject to be saved
     */
    //68
    void afterInsert(DistrictBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the DistrictBean pObject.
     *
     * @param pObject the DistrictBean pObject to be updated
     */
    //69
    void beforeUpdate(DistrictBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the DistrictBean pObject.
     *
     * @param pObject the DistrictBean pObject to be updated
     */
    //70
    void afterUpdate(DistrictBean pObject) throws SQLException {
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
