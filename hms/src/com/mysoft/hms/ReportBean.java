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


public class ReportBean
// extends+ 

// extends- 

{
    private Integer reportid;
    private boolean reportid_is_modified = false;
    private boolean reportid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private String displayname;
    private boolean displayname_is_modified = false;
    private boolean displayname_is_initialized = false;
    
    private String sqlquery;
    private boolean sqlquery_is_modified = false;
    private boolean sqlquery_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Integer repcatid;
    private boolean repcatid_is_modified = false;
    private boolean repcatid_is_initialized = false;
    
    private Integer ord;
    private boolean ord_is_modified = false;
    private boolean ord_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    ReportBean()
    {
    }
    
    /**
     * Getter method for reportid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.reportid
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
     * <li>full name: report.name
     * <li>comments: დასახელება
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
     * Getter method for displayname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.displayname
     * <li>comments: სათაური
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of displayname
     */
    public String getDisplayname()
    {
        return displayname; 
    }

    /**
     * Setter method for displayname.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to displayname
     */
    public void setDisplayname(String newVal) {
        if ((newVal != null && this.displayname != null && (newVal.compareTo(this.displayname) == 0)) || 
            (newVal == null && this.displayname == null && displayname_is_initialized)) {
            return; 
        } 
        this.displayname = newVal; 
        displayname_is_modified = true; 
        displayname_is_initialized = true; 
    }

    /**
     * Determines if the displayname has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDisplaynameModified() {
        return displayname_is_modified; 
    }

    /**
     * Determines if the displayname has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDisplaynameInitialized() {
        return displayname_is_initialized; 
    }

    /**
     * Getter method for sqlquery.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.sqlquery
     * <li>comments: SQL კოდი
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of sqlquery
     */
    public String getSqlquery()
    {
        return sqlquery; 
    }

    /**
     * Setter method for sqlquery.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to sqlquery
     */
    public void setSqlquery(String newVal) {
        if ((newVal != null && this.sqlquery != null && (newVal.compareTo(this.sqlquery) == 0)) || 
            (newVal == null && this.sqlquery == null && sqlquery_is_initialized)) {
            return; 
        } 
        this.sqlquery = newVal; 
        sqlquery_is_modified = true; 
        sqlquery_is_initialized = true; 
    }

    /**
     * Determines if the sqlquery has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSqlqueryModified() {
        return sqlquery_is_modified; 
    }

    /**
     * Determines if the sqlquery has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSqlqueryInitialized() {
        return sqlquery_is_initialized; 
    }

    /**
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.regbyid
     * <li> foreign key: personnel.personnelid
     * <li>comments: ავტორი
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of regbyid
     */
    public Integer getRegbyid()
    {
        return regbyid; 
    }

    /**
     * Setter method for regbyid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to regbyid
     */
    public void setRegbyid(Integer newVal) {
        if ((newVal != null && this.regbyid != null && (newVal.compareTo(this.regbyid) == 0)) || 
            (newVal == null && this.regbyid == null && regbyid_is_initialized)) {
            return; 
        } 
        this.regbyid = newVal; 
        regbyid_is_modified = true; 
        regbyid_is_initialized = true; 
    }

    /**
     * Setter method for regbyid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to regbyid
     */
    public void setRegbyid(int newVal) {
        setRegbyid(new Integer(newVal));
    }

    /**
     * Determines if the regbyid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRegbyidModified() {
        return regbyid_is_modified; 
    }

    /**
     * Determines if the regbyid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRegbyidInitialized() {
        return regbyid_is_initialized; 
    }

    /**
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.regdate
     * <li>comments: რეგ. თარიღი
     * <li>default value: now()
     * <li>column size: 29
     * <li>jdbc type returned by the driver: Types.TIMESTAMP
     * </ul>
     *
     * @return the value of regdate
     */
    public java.sql.Timestamp getRegdate()
    {
        return regdate; 
    }

    /**
     * Setter method for regdate.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to regdate
     */
    public void setRegdate(java.sql.Timestamp newVal) {
        if ((newVal != null && this.regdate != null && (newVal.compareTo(this.regdate) == 0)) || 
            (newVal == null && this.regdate == null && regdate_is_initialized)) {
            return; 
        } 
        this.regdate = newVal; 
        regdate_is_modified = true; 
        regdate_is_initialized = true; 
    }

    /**
     * Setter method for regdate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to regdate
     */
    public void setRegdate(long newVal) {
        setRegdate(new java.sql.Timestamp(newVal));
    }

    /**
     * Determines if the regdate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRegdateModified() {
        return regdate_is_modified; 
    }

    /**
     * Determines if the regdate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRegdateInitialized() {
        return regdate_is_initialized; 
    }

    /**
     * Getter method for repcatid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.repcatid
     * <li>default value: 1
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of repcatid
     */
    public Integer getRepcatid()
    {
        return repcatid; 
    }

    /**
     * Setter method for repcatid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to repcatid
     */
    public void setRepcatid(Integer newVal) {
        if ((newVal != null && this.repcatid != null && (newVal.compareTo(this.repcatid) == 0)) || 
            (newVal == null && this.repcatid == null && repcatid_is_initialized)) {
            return; 
        } 
        this.repcatid = newVal; 
        repcatid_is_modified = true; 
        repcatid_is_initialized = true; 
    }

    /**
     * Setter method for repcatid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to repcatid
     */
    public void setRepcatid(int newVal) {
        setRepcatid(new Integer(newVal));
    }

    /**
     * Determines if the repcatid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRepcatidModified() {
        return repcatid_is_modified; 
    }

    /**
     * Determines if the repcatid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRepcatidInitialized() {
        return repcatid_is_initialized; 
    }

    /**
     * Getter method for ord.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: report.ord
     * <li>default value: 0
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of ord
     */
    public Integer getOrd()
    {
        return ord; 
    }

    /**
     * Setter method for ord.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to ord
     */
    public void setOrd(Integer newVal) {
        if ((newVal != null && this.ord != null && (newVal.compareTo(this.ord) == 0)) || 
            (newVal == null && this.ord == null && ord_is_initialized)) {
            return; 
        } 
        this.ord = newVal; 
        ord_is_modified = true; 
        ord_is_initialized = true; 
    }

    /**
     * Setter method for ord.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to ord
     */
    public void setOrd(int newVal) {
        setOrd(new Integer(newVal));
    }

    /**
     * Determines if the ord has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isOrdModified() {
        return ord_is_modified; 
    }

    /**
     * Determines if the ord has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isOrdInitialized() {
        return ord_is_initialized; 
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
        return reportid_is_modified || 
		name_is_modified || 
		displayname_is_modified || 
		sqlquery_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		repcatid_is_modified || 
		ord_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        reportid_is_modified = false;
        name_is_modified = false;
        displayname_is_modified = false;
        sqlquery_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        repcatid_is_modified = false;
        ord_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(ReportBean bean) {
        setReportid(bean.getReportid());
        setName(bean.getName());
        setDisplayname(bean.getDisplayname());
        setSqlquery(bean.getSqlquery());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setRepcatid(bean.getRepcatid());
        setOrd(bean.getOrd());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[report] "
                 + "\n - report.reportid = " + (reportid_is_initialized ? ("[" + (reportid == null ? null : reportid.toString()) + "]") : "not initialized") + ""
                 + "\n - report.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - report.displayname = " + (displayname_is_initialized ? ("[" + (displayname == null ? null : displayname.toString()) + "]") : "not initialized") + ""
                 + "\n - report.sqlquery = " + (sqlquery_is_initialized ? ("[" + (sqlquery == null ? null : sqlquery.toString()) + "]") : "not initialized") + ""
                 + "\n - report.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - report.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - report.repcatid = " + (repcatid_is_initialized ? ("[" + (repcatid == null ? null : repcatid.toString()) + "]") : "not initialized") + ""
                 + "\n - report.ord = " + (ord_is_initialized ? ("[" + (ord == null ? null : ord.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
