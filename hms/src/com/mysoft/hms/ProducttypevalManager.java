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
 * Handles database calls for the producttypeval table.
 */
public class ProducttypevalManager
// extends+ 

// extends- 

{

    /**
     * Column productpropertyid of type Types.BIGINT mapped to Long.
     */
    public static final int ID_PRODUCTPROPERTYID = 0;
    public static final int TYPE_PRODUCTPROPERTYID = Types.BIGINT;
    public static final String NAME_PRODUCTPROPERTYID = "productpropertyid";

    /**
     * Column valuedate of type Types.DATE mapped to java.util.Date.
     */
    public static final int ID_VALUEDATE = 1;
    public static final int TYPE_VALUEDATE = Types.DATE;
    public static final String NAME_VALUEDATE = "valuedate";

    /**
     * Column value of type Types.VARCHAR mapped to String.
     */
    public static final int ID_VALUE = 2;
    public static final int TYPE_VALUE = Types.VARCHAR;
    public static final String NAME_VALUE = "value";


    private static final String TABLE_NAME = "producttypeval";

    /**
     * Create an array of type string containing all the fields of the producttypeval table.
     */
    private static final String[] FIELD_NAMES = 
    {
        "producttypeval.productpropertyid"
        ,"producttypeval.valuedate"
        ,"producttypeval.value"
    };

    /**
     * Field that contains the comma separated fields of the producttypeval table.
     */
    private static final String ALL_FIELDS = "producttypeval.productpropertyid"
                            + ",producttypeval.valuedate"
                            + ",producttypeval.value";

    private static ProducttypevalManager singleton = new ProducttypevalManager();

    /**
     * Get the ProducttypevalManager singleton.
     *
     * @return ProducttypevalManager 
     */
    synchronized public static ProducttypevalManager getInstance()
    {
        return singleton;
    }

    /**
     * Sets your own ProducttypevalManager instance.
     <br>
     * This is optional, by default we provide it for you.
     */
    synchronized public static void setInstance(ProducttypevalManager instance)
    {
        singleton = instance;
    }


    /**
     * Creates a new ProducttypevalBean instance.
     *
     * @return the new ProducttypevalBean 
     */
    public ProducttypevalBean createProducttypevalBean()
    {
        return new ProducttypevalBean();
    }

    //////////////////////////////////////
    // PRIMARY KEY METHODS
    //////////////////////////////////////

    /**
     * Loads a ProducttypevalBean from the producttypeval using its key fields.
     *
     * @return a unique ProducttypevalBean 
     */
    //12
    public ProducttypevalBean loadByPrimaryKey(Long productpropertyid, java.util.Date valuedate) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM producttypeval WHERE producttypeval.productpropertyid=? and producttypeval.valuedate=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, productpropertyid);
            if (valuedate == null) ps.setNull(2, Types.DATE); else ps.setDate(2, new Date(valuedate.getTime()));
            ProducttypevalBean pReturn[] = loadByPreparedStatement(ps);
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
    public int deleteByPrimaryKey(Long productpropertyid, java.util.Date valuedate) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        try
        {
            c = getConnection();
            ps = c.prepareStatement("DELETE from producttypeval WHERE producttypeval.productpropertyid=? and producttypeval.valuedate=?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Manager.setLong(ps, 1, productpropertyid);
            if (valuedate == null) ps.setNull(2, Types.DATE); else ps.setDate(2, new Date(valuedate.getTime()));
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
     * Loads all the rows from producttypeval.
     *
     * @return an array of ProducttypevalManager pObject
     */
    //38
    public ProducttypevalBean[] loadAll() throws SQLException 
    {
        Connection c = null;
        PreparedStatement ps = null;
        try 
        {
            c = getConnection();
            ps = c.prepareStatement("SELECT " + ALL_FIELDS + " FROM producttypeval",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
     * Retrieves an array of ProducttypevalBean given a sql 'where' clause.
     *
     * @param where the sql 'where' clause
     * @return the resulting ProducttypevalBean table 
     */
    //49
    public ProducttypevalBean[] loadByWhere(String where) throws SQLException
    {
        return loadByWhere(where, null);
    }

    /**
     * Retrieves an array of ProducttypevalBean given a sql where clause, and a list of fields.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the sql 'where' clause
     * @param fieldList table of the field's associated constants
     * @return the resulting ProducttypevalBean table 
     */
    //51
    public ProducttypevalBean[] loadByWhere(String where, int[] fieldList) throws SQLException
    {
        String sql = null;
        if(fieldList == null)
            sql = "select " + ALL_FIELDS + " from producttypeval " + where;
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
            buff.append(" from producttypeval ");
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

            return (ProducttypevalBean[])v.toArray(new ProducttypevalBean[0]);
        }
        finally
        {
            if (v != null) { v.clear(); }
            getManager().close(pStatement, rs);
            freeConnection(c);
        }
    }


    /**
     * Deletes all rows from producttypeval table.
     * @return the number of deleted rows.
     */
    public int deleteAll() throws SQLException
    {
        return deleteByWhere("");
    }


    /**
     * Deletes rows from the producttypeval table using a 'where' clause.
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
            String delByWhereSQL = "DELETE FROM producttypeval " + where;
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
     * Saves the ProducttypevalBean pObject into the database.
     *
     * @param pObject the ProducttypevalBean pObject to be saved
     */
    //100
    public ProducttypevalBean save(ProducttypevalBean pObject) throws SQLException
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
                _sql = new StringBuffer("INSERT into producttypeval (");
    
                if (pObject.isProductpropertyidModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("productpropertyid");
                    _dirtyCount++;
                }

                if (pObject.isValuedateModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("valuedate");
                    _dirtyCount++;
                }

                if (pObject.isValueModified()) {
                    if (_dirtyCount>0) {
                        _sql.append(",");
                    }
                    _sql.append("value");
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

                if (pObject.isProductpropertyidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getProductpropertyid());
                }
    
                if (pObject.isValuedateModified()) {
                    if (pObject.getValuedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getValuedate().getTime()));
                }
    
                if (pObject.isValueModified()) {
                    ps.setString(++_dirtyCount, pObject.getValue());
                }
    
                ps.executeUpdate();
    
                pObject.isNew(false);
                pObject.resetIsModified();
                afterInsert(pObject); // listener callback
            }
            else 
            { // UPDATE 
                beforeUpdate(pObject); // listener callback
                _sql = new StringBuffer("UPDATE producttypeval SET ");
                boolean useComma=false;

                if (pObject.isProductpropertyidModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("productpropertyid").append("=?");
                }

                if (pObject.isValuedateModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("valuedate").append("=?");
                }

                if (pObject.isValueModified()) {
                    if (useComma) {
                        _sql.append(",");
                    } else {
                        useComma=true;
                    }
                    _sql.append("value").append("=?");
                }
                _sql.append(" WHERE ");
                _sql.append("producttypeval.productpropertyid=? AND producttypeval.valuedate=?");
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                int _dirtyCount = 0;

                if (pObject.isProductpropertyidModified()) {
                      Manager.setLong(ps, ++_dirtyCount, pObject.getProductpropertyid());
                }

                if (pObject.isValuedateModified()) {
                      if (pObject.getValuedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getValuedate().getTime()));
                }

                if (pObject.isValueModified()) {
                      ps.setString(++_dirtyCount, pObject.getValue());
                }
    
                if (_dirtyCount == 0) {
                     return pObject;
                }
    
                Manager.setLong(ps, ++_dirtyCount, pObject.getProductpropertyid());
                if (pObject.getValuedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getValuedate().getTime()));
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
     * Saves an array of ProducttypevalBean pObjects into the database.
     *
     * @param pObjects the ProducttypevalBean pObject table to be saved
     * @return the saved ProducttypevalBean array.
     */
    //65
    public ProducttypevalBean[] save(ProducttypevalBean[] pObjects) throws SQLException 
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
     * Loads a unique ProducttypevalBean pObject from a template one giving a c
     *
     * @param pObject the ProducttypevalBean pObject to look for
     * @return the pObject matching the template
     */
    //85
    public ProducttypevalBean loadUniqueUsingTemplate(ProducttypevalBean pObject) throws SQLException
    {
         ProducttypevalBean[] pReturn = loadUsingTemplate(pObject);
         if (pReturn.length == 0)
             return null;
         if (pReturn.length > 1)
             throw new SQLException("More than one element !!");
         return pReturn[0];
     }

    /**
     * Loads an array of ProducttypevalBean from a template one.
     *
     * @param pObject the ProducttypevalBean template to look for
     * @return all the ProducttypevalBean matching the template
     */
    //88
    public ProducttypevalBean[] loadUsingTemplate(ProducttypevalBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer where = new StringBuffer("");
        StringBuffer _sql = new StringBuffer("SELECT " + ALL_FIELDS + " from producttypeval WHERE ");
        StringBuffer _sqlWhere = new StringBuffer("");
        try
        {
            int _dirtyCount = 0;
    
             if (pObject.isProductpropertyidModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("productpropertyid= ?");
             }
    
             if (pObject.isValuedateModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("valuedate= ?");
             }
    
             if (pObject.isValueModified()) {
                 _dirtyCount ++; 
                 _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("value= ?");
             }
    
             if (_dirtyCount == 0) {
                 throw new SQLException ("The pObject to look for is invalid : not initialized !");
             }
             _sql.append(_sqlWhere);
             c = getConnection();
             ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             _dirtyCount = 0;
    
             if (pObject.isProductpropertyidModified()) {
                 Manager.setLong(ps, ++_dirtyCount, pObject.getProductpropertyid());
             }
    
             if (pObject.isValuedateModified()) {
                 if (pObject.getValuedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getValuedate().getTime()));
             }
    
             if (pObject.isValueModified()) {
                 ps.setString(++_dirtyCount, pObject.getValue());
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
     * Deletes rows using a ProducttypevalBean template.
     *
     * @param pObject the ProducttypevalBean object(s) to be deleted
     * @return the number of deleted objects
     */
    //63
    public int deleteUsingTemplate(ProducttypevalBean pObject) throws SQLException
    {
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer sql = null;
    
        try 
        {
            sql = new StringBuffer("DELETE FROM producttypeval WHERE ");
            int _dirtyAnd = 0;
            if (pObject.isProductpropertyidInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("productpropertyid").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isValuedateInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("valuedate").append("=?");
                _dirtyAnd ++;
            }
    
            if (pObject.isValueInitialized()) {
                if (_dirtyAnd > 0)
                    sql.append(" AND ");
                sql.append("value").append("=?");
                _dirtyAnd ++;
            }
    
            c = getConnection();
            ps = c.prepareStatement(sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            int _dirtyCount = 0;
    
            if (pObject.isProductpropertyidInitialized()) {
                Manager.setLong(ps, ++_dirtyCount, pObject.getProductpropertyid());
            }
    
            if (pObject.isValuedateInitialized()) {
                if (pObject.getValuedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getValuedate().getTime()));
            }
    
            if (pObject.isValueInitialized()) {
                ps.setString(++_dirtyCount, pObject.getValue());
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
     * Retrieves the number of rows of the table producttypeval.
     *
     * @return the number of rows returned
     */
    //78
    public int countAll() throws SQLException
    {
        return countWhere("");
    }



    /**
     * Retrieves the number of rows of the table producttypeval with a 'where' clause.
     * It is up to you to pass the 'WHERE' in your where clausis.
     *
     * @param where the restriction clause
     * @return the number of rows returned
     */
    public int countWhere(String where) throws SQLException
    {
        String sql = "select count(*) as MCOUNT from producttypeval " + where;
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
     * Retrieves the number of rows of the table producttypeval with a prepared statement.
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
     * Looks for the number of elements of a specific ProducttypevalBean pObject given a c
     *
     * @param pObject the ProducttypevalBean pObject to look for
     * @return the number of rows returned
     */
    //83
    public int countUsingTemplate(ProducttypevalBean pObject) throws SQLException
    {
        StringBuffer where = new StringBuffer("");
        Connection c = null;
        PreparedStatement ps = null;
        StringBuffer _sql = null;
        StringBuffer _sqlWhere = null;
    
        try
        {
                _sql = new StringBuffer("SELECT count(*) as MCOUNT  from producttypeval WHERE ");
                _sqlWhere = new StringBuffer("");
                int _dirtyCount = 0;
    
                if (pObject.isProductpropertyidModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("productpropertyid= ?");
                }
    
                if (pObject.isValuedateModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("valuedate= ?");
                }
    
                if (pObject.isValueModified()) {
                    _dirtyCount++; 
                    _sqlWhere.append((_sqlWhere.length() == 0) ? " " : " AND ").append("value= ?");
                }
    
                if (_dirtyCount == 0)
                   throw new SQLException ("The pObject to look is unvalid : not initialized !");
    
                _sql.append(_sqlWhere);
                c = getConnection();
                ps = c.prepareStatement(_sql.toString(),ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    
                _dirtyCount = 0;
    
                if (pObject.isProductpropertyidModified()) {
                    Manager.setLong(ps, ++_dirtyCount, pObject.getProductpropertyid());
                }
    
                if (pObject.isValuedateModified()) {
                    if (pObject.getValuedate() == null) ps.setNull(++_dirtyCount, Types.DATE); else ps.setDate(++_dirtyCount, new Date(pObject.getValuedate().getTime()));
                }
    
                if (pObject.isValueModified()) {
                    ps.setString(++_dirtyCount, pObject.getValue());
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
     * Transforms a ResultSet iterating on the producttypeval on a ProducttypevalBean pObject.
     *
     * @param rs the ResultSet to be transformed
     * @return pObject resulting ProducttypevalBean pObject
     */
    //72
    public ProducttypevalBean decodeRow(ResultSet rs) throws SQLException
    {
        ProducttypevalBean pObject = createProducttypevalBean();
        pObject.setProductpropertyid(Manager.getLong(rs, 1));
        pObject.setValuedate(rs.getDate(2));
        pObject.setValue(rs.getString(3));

        pObject.isNew(false);
        pObject.resetIsModified();

        return pObject;
    }

    /**
     * Transforms a ResultSet iterating on the producttypeval table on a ProducttypevalBean pObject according to a list of fields.
     *
     * @param rs the ResultSet to be transformed
     * @param fieldList table of the field's associated constants
     * @return pObject resulting ProducttypevalBean pObject
     */
    //73
    public ProducttypevalBean decodeRow(ResultSet rs, int[] fieldList) throws SQLException
    {
        ProducttypevalBean pObject = createProducttypevalBean();
        int pos = 0;
        for(int i = 0; i < fieldList.length; i++)
        {
            switch(fieldList[i]) {
                case ID_PRODUCTPROPERTYID:
                    ++pos;
                    pObject.setProductpropertyid(Manager.getLong(rs, pos));
                    break;
                case ID_VALUEDATE:
                    ++pos;
                    pObject.setValuedate(rs.getDate(pos));
                    break;
                case ID_VALUE:
                    ++pos;
                    pObject.setValue(rs.getString(pos));
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
     * @return an array of ProducttypevalBean 
     */
    //41
    public ProducttypevalBean[] loadByPreparedStatement(PreparedStatement ps) throws SQLException
    {
        return loadByPreparedStatement(ps, null);
    }

    /**
     * Loads all the elements using a prepared statement specifying a list of fields to be retrieved.
     *
     * @param ps the PreparedStatement to be used
     * @param fieldList table of the field's associated constants
     * @return an array of ProducttypevalBean 
     */
    public ProducttypevalBean[] loadByPreparedStatement(PreparedStatement ps, int[] fieldList) throws SQLException
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
            return (ProducttypevalBean[])v.toArray(new ProducttypevalBean[0]);
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
    private ProducttypevalListener listener = null;

    /**
     * Registers a unique ProducttypevalListener listener.
     */
    //66.5
    public void registerListener(ProducttypevalListener listener) {
        this.listener = listener;
    }

    /**
     * Before the save of the ProducttypevalBean pObject.
     *
     * @param pObject the ProducttypevalBean pObject to be saved
     */
    //67
    void beforeInsert(ProducttypevalBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeInsert(pObject);
    }

    /**
     * After the save of the ProducttypevalBean pObject.
     *
     * @param pObject the ProducttypevalBean pObject to be saved
     */
    //68
    void afterInsert(ProducttypevalBean pObject) throws SQLException {
        if (listener != null)
            listener.afterInsert(pObject);
    }

    /**
     * Before the update of the ProducttypevalBean pObject.
     *
     * @param pObject the ProducttypevalBean pObject to be updated
     */
    //69
    void beforeUpdate(ProducttypevalBean pObject) throws SQLException {
        if (listener != null)
            listener.beforeUpdate(pObject);
    }

    /**
     * After the update of the ProducttypevalBean pObject.
     *
     * @param pObject the ProducttypevalBean pObject to be updated
     */
    //70
    void afterUpdate(ProducttypevalBean pObject) throws SQLException {
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
