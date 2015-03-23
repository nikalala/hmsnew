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

// imports+ 

// imports- 


public class ReportsearchBean
// extends+ 

// extends- 

{
    private Integer reportsearchid;
    private boolean reportsearchid_is_modified = false;
    private boolean reportsearchid_is_initialized = false;
    
    private Integer reportid;
    private boolean reportid_is_modified = false;
    private boolean reportid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Integer type;
    private boolean type_is_modified = false;
    private boolean type_is_initialized = false;
    
    private String sql;
    private boolean sql_is_modified = false;
    private boolean sql_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    ReportsearchBean()
    {
    }
    
    /**
     * Getter method for reportsearchid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportsearch.reportsearchid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of reportsearchid
     */
    public Integer getReportsearchid()
    {
        return reportsearchid; 
    }

    /**
     * Setter method for reportsearchid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to reportsearchid
     */
    public void setReportsearchid(Integer newVal) {
        if ((newVal != null && this.reportsearchid != null && (newVal.compareTo(this.reportsearchid) == 0)) || 
            (newVal == null && this.reportsearchid == null && reportsearchid_is_initialized)) {
            return; 
        } 
        this.reportsearchid = newVal; 
        reportsearchid_is_modified = true; 
        reportsearchid_is_initialized = true; 
    }

    /**
     * Setter method for reportsearchid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to reportsearchid
     */
    public void setReportsearchid(int newVal) {
        setReportsearchid(new Integer(newVal));
    }

    /**
     * Determines if the reportsearchid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isReportsearchidModified() {
        return reportsearchid_is_modified; 
    }

    /**
     * Determines if the reportsearchid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isReportsearchidInitialized() {
        return reportsearchid_is_initialized; 
    }

    /**
     * Getter method for reportid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportsearch.reportid
     * <li> foreign key: report.reportid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of reportid
     */
    public Integer getReportid()
    {
        return reportid; 
    }

    /**
     * Setter method for reportid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to reportid
     */
    public void setReportid(Integer newVal) {
        if ((newVal != null && this.reportid != null && (newVal.compareTo(this.reportid) == 0)) || 
            (newVal == null && this.reportid == null && reportid_is_initialized)) {
            return; 
        } 
        this.reportid = newVal; 
        reportid_is_modified = true; 
        reportid_is_initialized = true; 
    }

    /**
     * Setter method for reportid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to reportid
     */
    public void setReportid(int newVal) {
        setReportid(new Integer(newVal));
    }

    /**
     * Determines if the reportid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isReportidModified() {
        return reportid_is_modified; 
    }

    /**
     * Determines if the reportid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isReportidInitialized() {
        return reportid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportsearch.name
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of name
     */
    public String getName()
    {
        return name; 
    }

    /**
     * Setter method for name.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to name
     */
    public void setName(String newVal) {
        if ((newVal != null && this.name != null && (newVal.compareTo(this.name) == 0)) || 
            (newVal == null && this.name == null && name_is_initialized)) {
            return; 
        } 
        this.name = newVal; 
        name_is_modified = true; 
        name_is_initialized = true; 
    }

    /**
     * Determines if the name has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isNameModified() {
        return name_is_modified; 
    }

    /**
     * Determines if the name has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isNameInitialized() {
        return name_is_initialized; 
    }

    /**
     * Getter method for type.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportsearch.type
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of type
     */
    public Integer getType()
    {
        return type; 
    }

    /**
     * Setter method for type.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to type
     */
    public void setType(Integer newVal) {
        if ((newVal != null && this.type != null && (newVal.compareTo(this.type) == 0)) || 
            (newVal == null && this.type == null && type_is_initialized)) {
            return; 
        } 
        this.type = newVal; 
        type_is_modified = true; 
        type_is_initialized = true; 
    }

    /**
     * Setter method for type.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to type
     */
    public void setType(int newVal) {
        setType(new Integer(newVal));
    }

    /**
     * Determines if the type has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTypeModified() {
        return type_is_modified; 
    }

    /**
     * Determines if the type has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTypeInitialized() {
        return type_is_initialized; 
    }

    /**
     * Getter method for sql.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportsearch.sql
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of sql
     */
    public String getSql()
    {
        return sql; 
    }

    /**
     * Setter method for sql.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to sql
     */
    public void setSql(String newVal) {
        if ((newVal != null && this.sql != null && (newVal.compareTo(this.sql) == 0)) || 
            (newVal == null && this.sql == null && sql_is_initialized)) {
            return; 
        } 
        this.sql = newVal; 
        sql_is_modified = true; 
        sql_is_initialized = true; 
    }

    /**
     * Determines if the sql has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSqlModified() {
        return sql_is_modified; 
    }

    /**
     * Determines if the sql has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSqlInitialized() {
        return sql_is_initialized; 
    }

    /**
     * Determines if the current object is new.
     *
     * @return true if the current object is new, false if the object is not new
     */
    public boolean isNew() {
        return _isNew;
    }

    /**
     * Specifies to the object if it has been set as new.
     *
     * @param isNew the boolean value to be assigned to the isNew field
     */
    public void isNew(boolean isNew) {
        this._isNew = isNew;
    }

    /**
     * Determines if the object has been modified since the last time this method was called.
     * <br>
     * We can also determine if this object has ever been modified since its creation.
     *
     * @return true if the object has been modified, false if the object has not been modified
     */
    public boolean isModified() {
        return reportsearchid_is_modified || 
		reportid_is_modified || 
		name_is_modified || 
		type_is_modified || 
		sql_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        reportsearchid_is_modified = false;
        reportid_is_modified = false;
        name_is_modified = false;
        type_is_modified = false;
        sql_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(ReportsearchBean bean) {
        setReportsearchid(bean.getReportsearchid());
        setReportid(bean.getReportid());
        setName(bean.getName());
        setType(bean.getType());
        setSql(bean.getSql());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[reportsearch] "
                 + "\n - reportsearch.reportsearchid = " + (reportsearchid_is_initialized ? ("[" + (reportsearchid == null ? null : reportsearchid.toString()) + "]") : "not initialized") + ""
                 + "\n - reportsearch.reportid = " + (reportid_is_initialized ? ("[" + (reportid == null ? null : reportid.toString()) + "]") : "not initialized") + ""
                 + "\n - reportsearch.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - reportsearch.type = " + (type_is_initialized ? ("[" + (type == null ? null : type.toString()) + "]") : "not initialized") + ""
                 + "\n - reportsearch.sql = " + (sql_is_initialized ? ("[" + (sql == null ? null : sql.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
