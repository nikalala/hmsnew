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
 * Handles database calls for the sproductprice table.
 */
public class SproductpriceManager
// extends+ 

// extends- 

{

    /**
     * Column sproductpriceid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_SPRODUCTPRICEID = 0;
    public static final int TYPE_SPRODUCTPRICEID = Types.BIGINT;
    public static final String NAME_SPRODUCTPRICEID = "sproductpriceid";

    /**
     * Column sproductid of type Types.INTEGER mapped to Integer.
     */
    public static final int ID_SPRODUCTID = 1;
    public static final int TYPE_SPRODUCTID = Types.INTEGER;
    public static final String NAME_SPRODUCTID = "sproductid";

    /**
     * Column calcdate of type Types.DATE mapped to java.util.Date.
     */
    public static final int ID_CALCDATE = 2;
    public static final int TYPE_CALCDATE = Types.DATE;
    public static final String NAME_CALCDATE = "calcdate";

    /**
     * Column price of type Types.DOUBLE mapped to Double.
     */
    public static final int ID_PRICE = 3;
    public static final int TYPE_PRICE = Types.DOUBLE;
    public static final String NAME_PRICE = "price";


    private static final String TABLE_NAME = "sproductprice";

    /**
     * Create an array of type string containing all the fields of the sproductprice table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "sproductprice.sproductpriceid"
        ,"sproductprice.sproductid"
        ,"sproductprice.calcdate"
        ,"sproductprice.price"
    };

    /**
     * Field that contains the comma separated fields of the sproductprice table.
     */
    private static final String ALL_FIELDS = "sproductprice.sproductpriceid"
                            + ",sproductprice.sproductid"
                            + ",sproductprice.calcdate"
                            + ",sproductprice.price";

    private static SproductpriceManager singleton = new SproductpriceManager();

    /**
     * Get the SproductpriceManager singleton.
     *
     * @return SproductpriceManager 
     */
    synchronized public static SproductpriceManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own SproductpriceManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(SproductpriceManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new SproductpriceBean instance.
     *
     * @return the new SproductpriceBean 
     */
    public SproductpriceBean createSproductpriceBean()
    {
        return new SproductpriceBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a SproductpriceBean from the sproductprice using its key fields.
     *
     * @return a unique SproductpriceBean 
     */
    //12
    public SproductpriceBean loadByPrimaryKey(Long sproductpriceid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sproductprice WHERE sproductprice.sproductpriceid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, sproductpriceid);
            SproductpriceBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Long sproductpriceid) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from sproductprice WHERE sproductprice.sproductpriceid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, sproductpriceid);
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
     * Loads SproductpriceBean array from the sproductprice table using its sproductid field.
     *
     * @return an array of SproductpriceBean 
     */
    // LOAD BY IMPORTED KEY
    public SproductpriceBean[] loadBySproductid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sproductprice WHERE sproductid=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Deletes from the sproductprice table by sproductid field.
     *
     * @param value the key value to seek
     * @return the number of rows deleted
     */
    // DELETE BY IMPORTED KEY
    public int deleteBySproductid(Integer value) throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE FROM sproductprice WHERE sproductid=?");
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
     * Retrieves the SproductBean object from the sproductprice.sproductid field.
     *
     * @param pObject the SproductpriceBean 
     * @return the associated SproductBean pObject
     */
    // GET IMPORTED
    public SproductBean getSproductBean(SproductpriceBean pObject) throws SQLException
    {
        SproductBean other = SproductManager.getInstance().createSproductBean();
        other.setSproductid(pObject.getSproductid());
        return SproductManager.getInstance().loadUniqueUsingTemplate(other);
    }

    /**
     * Associates the SproductpriceBean object to the SproductBean object.
     *
     * @param pObject the SproductpriceBean object to use
     * @param pObjectToBeSet the SproductBean object to associate to the SproductpriceBean 
     * @return the associated SproductBean pObject
     */
    // SET IMPORTED
    public SproductpriceBean setSproductBean(SproductpriceBean pObject,SproductBean pObjectToBeSet)
    {
        pObject.setSproductid(pObjectToBeSet.getSproductid());
        return pObject;
    }



    //////////////////////////////////////
    // LOAD ALL
    //////////////////////////////////////

    /**
     * Loads all the rows from sproductprice.
     *
     * @return an array of SproductpriceManager pObject
     */
    //38
    public SproductpriceBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM sproductprice",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of SproductpriceBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting SproductpriceBean table 
     */
    //49
    public SproductpriceBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of SproductpriceBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting SproductpriceBean table 
     */
    //51
    public SproductpriceBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from sproductprice " + where;
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
            buff.append(" from sproductprice ");
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

            return (SproductpriceBean[])v.toArray(new SproductpriceBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from sproductprice table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the sproductprice table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM sproductprice " + where;
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
     * Saves the SproductpriceBean pObject into the database.
     *
     * @param pObject the SproductpriceBean pObject to be saved
     */
    //100
    public SproductpriceBean save(SproductpriceBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;

        try
        {
            c = getConnection();
            if (pObject.isNew())
            { // SAVE 
                if (!pObject.isSproductpriceidModified())
                {
                    ps = c.prepareStatement("SELECT nextval('sproductpriceid_seq')");
                    ResultSet rs = null;
                    try
                    {
                        rs = ps.executeQuery();
                        if(rs.next())
                            pObject.setSproductpriceid(Manager.getLong(rs, 1));
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
                _sql = new StringBuffer("INSERT into sproductprice (");
    
                if (pObject.isSproductpriceidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("sproductpriceid");
                    _dirtyCount++;
                }

                if (pObject.isSproductidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("sproductid");
                    _dirtyCount++;
                }

                if (pObject.isCalcdateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("calcdate");
                    _dirtyCount++;
                }

                if (pObject.isPriceModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("price");
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

                if (pObject.isSproductpriceidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getSproductpriceid());
                }
    
                if (pObject.isSproductidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getSproductid());
                }
    
                if (pObject.isCalcdateModified()) {
                    if (pObject.getCalcdate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getCalcdate().getTime()));
                }
    
                if (pObject.isPriceModified()) {
                    Manager.setDouble(ps, ++_dirtyCount, pObject.getPrice());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE sproductprice SET ");
                boolean useComma=false;

                if (pObject.isSproductpriceidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("sproductpriceid").append("=?");
                }

                if (pObject.isSproductidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("sproductid").append("=?");
                }

                if (pObject.isCalcdateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("calcdate").append("=?");
                }

                if (pObject.isPriceModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("price").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("sproductprice.sproductpriceid=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isSproductpriceidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getSproductpriceid());
                }

                if (pObject.isSproductidModified()) {
                      Manager.setInteger(ps, ++_dirtyCount, pObject.getSproductid());
                }

                if (pObject.isCalcdateModified()) {
                      if (pObject.getCalcdate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getCalcdate().getTime()));
                }

                if (pObject.isPriceModified()) {
                      Manager.setDouble(ps, ++_dirtyCount, pObject.getPrice());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setLong(ps, ++_dirtyCount, pObject.getSproductpriceid());
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
     * Saves an array of SproductpriceBean pObjects into the database.
     *
     * @param pObjects the SproductpriceBean pObject table to be saved
     * @return the saved SproductpriceBean array.
     */
    //65
    public SproductpriceBean[] save(SproductpriceBean[] pObjects) throws SQLException 
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
     * Loads a unique SproductpriceBean pObject from a template one giving a c
     *
     * @param pObject the SproductpriceBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public SproductpriceBean loadUniqueUsingTemplate(SproductpriceBean pObject) throws SQLException
    {
         SproductpriceBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of SproductpriceBean from a template one.
     *
     * @param pObject the SproductpriceBean template to look for
     * @return all the SproductpriceBean matching the template
     */
    //88
    public SproductpriceBean[] loadUsingTemplate(SproductpriceBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from sproductprice WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isSproductpriceidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("sproductpriceid= ?");
             }
    
             if (pObject.isSproductidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("sproductid= ?");
             }
    
             if (pObject.isCalcdateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("calcdate= ?");
             }
    
             if (pObject.isPriceModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("price= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isSproductpriceidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getSproductpriceid());
             }
    
             if (pObject.isSproductidModified()) {
                 Manager.setInteger(ps, ++_dirtyCount, pObject.getSproductid());
             }
    
             if (pObject.isCalcdateModified()) {
                 if (pObject.getCalcdate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getCalcdate().getTime()));
             }
    
             if (pObject.isPriceModified()) {
                 Manager.setDouble(ps, ++_dirtyCount, pObject.getPrice());
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
     * Deletes rows using a SproductpriceBean template.
     *
     * @param pObject the SproductpriceBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(SproductpriceBean pObject) throws SQLException
    {
        if (pObject.isSproductpriceidInitialized())
            return deleteByPrimaryKey(pObject.getSproductpriceid());
    
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM sproductprice WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isSproductpriceidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("sproductpriceid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isSproductidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("sproductid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isCalcdateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("calcdate").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isPriceInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("price").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isSproductpriceidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getSproductpriceid());
            }
    
            if (pObject.isSproductidInitialized()) {
                Manager.setInteger(ps, ++_dirtyCount, pObject.getSproductid());
            }
    
            if (pObject.isCalcdateInitialized()) {
                if (pObject.getCalcdate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getCalcdate().getTime()));
            }
    
            if (pObject.isPriceInitialized()) {
                Manager.setDouble(ps, ++_dirtyCount, pObject.getPrice());
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
     * Retrieves an array of ProductBean using the relation table Calc given a SproductpriceBean object.
     *
     * @param pObject the SproductpriceBean pObject to be used
     * @return an array of ProductBean 
     */
    // MANY TO MANY
    public ProductBean[] loadProductViaCalc(SproductpriceBean pObject) throws SQLException
    {
         Connection c = null;
         PreparedStatement ps = null;
         String strSQL =      " SELECT "
                         + "        *"
                         + " FROM  "
                         + "        product,calc"
                         + " WHERE "    
                         + "     calc.sproductpriceid = ?"
                         + " AND calc.productid = product.productid";
         try
         {
             c = getConnection();
             ps = c.prepareStatement(strSQL,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             Manager.setLong(ps, 1, pObject.getSproductpriceid());
             return ProductManager.getInstance().loadByPreparedStatement(ps);
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
     * Retrieves the number of rows of the table sproductprice.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table sproductprice with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from sproductprice " + where;
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
     * Retrieves the number of rows of the table sproductprice with a prepared statement.
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
     * Looks for the number of elements of a specific SproductpriceBean pObject given a c
     *
     * @param pObject the SproductpriceBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(SproductpriceBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from sproductprice WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isSproductpriceidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("sproductpriceid= ?");
                }
    
                if (pObject.isSproductidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("sproductid= ?");
                }
    
                if (pObject.isCalcdateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("calcdate= ?");
                }
    
                if (pObject.isPriceModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("price= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isSproductpriceidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getSproductpriceid());
                }
    
                if (pObject.isSproductidModified()) {
                    Manager.setInteger(ps, ++_dirtyCount, pObject.getSproductid());
                }
    
                if (pObject.isCalcdateModified()) {
                    if (pObject.getCalcdate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getCalcdate().getTime()));
                }
    
                if (pObject.isPriceModified()) {
                    Manager.setDouble(ps, ++_dirtyCount, pObject.getPrice());
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
     * Transforms a ResultSet iterating on the sproductprice on a SproductpriceBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting SproductpriceBean pObject
     */
    //72
    public SproductpriceBean decodeRow(ResultSet rs) throws SQLException
    {
        SproductpriceBean pObject = createSproductpriceBean();
        pObject.setSproductpriceid(Manager.getLong(rs, 1));
        pObject.setSproductid(Manager.getInteger(rs, 2));
        pObject.setCalcdate(rs.getDate(3));
        pObject.setPrice(Manager.getDouble(rs, 4));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the sproductprice table on a SproductpriceBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting SproductpriceBean pObject
     */
    //73
    public SproductpriceBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        SproductpriceBean pObject = createSproductpriceBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_SPRODUCTPRICEID:
                    ++pos;
                    pObject.setSproductpriceid(Manager.getLong(rs, pos));
                    break;
                case ID_SPRODUCTID:
                    ++pos;
                    pObject.setSproductid(Manager.getInteger(rs, pos));
                    break;
                case ID_CALCDATE:
                    ++pos;
                    pObject.setCalcdate(rs.getDate(pos));
                    break;
                case ID_PRICE:
                    ++pos;
                    pObject.setPrice(Manager.getDouble(rs, pos));
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
     * @return an array of SproductpriceBean 
     */
    //41
    public SproductpriceBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of SproductpriceBean 
     */
    public SproductpriceBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (SproductpriceBean[])v.toArray(new SproductpriceBean[0]);
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
    private SproductpriceListener listener = null;

    /**
     * Registers a unique SproductpriceListener listener.
     */
    //66.5
    public void registerListener(SproductpriceListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the SproductpriceBean pObject.
     *
     * @param pObject the SproductpriceBean pObject to be saved
     */
    //67
    void beforeInsert(SproductpriceBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the SproductpriceBean pObject.
     *
     * @param pObject the SproductpriceBean pObject to be saved
     */
    //68
    void afterInsert(SproductpriceBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the SproductpriceBean pObject.
     *
     * @param pObject the SproductpriceBean pObject to be updated
     */
    //69
    void beforeUpdate(SproductpriceBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the SproductpriceBean pObject.
     *
     * @param pObject the SproductpriceBean pObject to be updated
     */
    //70
    void afterUpdate(SproductpriceBean pObject) throws SQLException {
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
