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


public class FoliologBean
// extends+ 

// extends- 

{
    private Long foliologid;
    private boolean foliologid_is_modified = false;
    private boolean foliologid_is_initialized = false;
    
    private String logname;
    private boolean logname_is_modified = false;
    private boolean logname_is_initialized = false;
    
    private String content;
    private boolean content_is_modified = false;
    private boolean content_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private Long folioitemid;
    private boolean folioitemid_is_modified = false;
    private boolean folioitemid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    FoliologBean()
    {
    }
    
    /**
     * Getter method for foliologid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: foliolog.foliologid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of foliologid
     */
    public Long getFoliologid()
    {
        return foliologid; 
    }

    /**
     * Setter method for foliologid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to foliologid
     */
    public void setFoliologid(Long newVal) {
        if ((newVal != null && this.foliologid != null && (newVal.compareTo(this.foliologid) == 0)) || 
            (newVal == null && this.foliologid == null && foliologid_is_initialized)) {
            return; 
        } 
        this.foliologid = newVal; 
        foliologid_is_modified = true; 
        foliologid_is_initialized = true; 
    }

    /**
     * Setter method for foliologid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to foliologid
     */
    public void setFoliologid(long newVal) {
        setFoliologid(new Long(newVal));
    }

    /**
     * Determines if the foliologid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFoliologidModified() {
        return foliologid_is_modified; 
    }

    /**
     * Determines if the foliologid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFoliologidInitialized() {
        return foliologid_is_initialized; 
    }

    /**
     * Getter method for logname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: foliolog.logname
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of logname
     */
    public String getLogname()
    {
        return logname; 
    }

    /**
     * Setter method for logname.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to logname
     */
    public void setLogname(String newVal) {
        if ((newVal != null && this.logname != null && (newVal.compareTo(this.logname) == 0)) || 
            (newVal == null && this.logname == null && logname_is_initialized)) {
            return; 
        } 
        this.logname = newVal; 
        logname_is_modified = true; 
        logname_is_initialized = true; 
    }

    /**
     * Determines if the logname has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isLognameModified() {
        return logname_is_modified; 
    }

    /**
     * Determines if the logname has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isLognameInitialized() {
        return logname_is_initialized; 
    }

    /**
     * Getter method for content.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: foliolog.content
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of content
     */
    public String getContent()
    {
        return content; 
    }

    /**
     * Setter method for content.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to content
     */
    public void setContent(String newVal) {
        if ((newVal != null && this.content != null && (newVal.compareTo(this.content) == 0)) || 
            (newVal == null && this.content == null && content_is_initialized)) {
            return; 
        } 
        this.content = newVal; 
        content_is_modified = true; 
        content_is_initialized = true; 
    }

    /**
     * Determines if the content has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isContentModified() {
        return content_is_modified; 
    }

    /**
     * Determines if the content has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isContentInitialized() {
        return content_is_initialized; 
    }

    /**
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: foliolog.regdate
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
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: foliolog.regbyid
     * <li> foreign key: personnel.personnelid
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
     * Getter method for folioitemid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: foliolog.folioitemid
     * <li> foreign key: folioitem.folioitemid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of folioitemid
     */
    public Long getFolioitemid()
    {
        return folioitemid; 
    }

    /**
     * Setter method for folioitemid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to folioitemid
     */
    public void setFolioitemid(Long newVal) {
        if ((newVal != null && this.folioitemid != null && (newVal.compareTo(this.folioitemid) == 0)) || 
            (newVal == null && this.folioitemid == null && folioitemid_is_initialized)) {
            return; 
        } 
        this.folioitemid = newVal; 
        folioitemid_is_modified = true; 
        folioitemid_is_initialized = true; 
    }

    /**
     * Setter method for folioitemid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to folioitemid
     */
    public void setFolioitemid(long newVal) {
        setFolioitemid(new Long(newVal));
    }

    /**
     * Determines if the folioitemid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFolioitemidModified() {
        return folioitemid_is_modified; 
    }

    /**
     * Determines if the folioitemid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFolioitemidInitialized() {
        return folioitemid_is_initialized; 
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
        return foliologid_is_modified || 
		logname_is_modified || 
		content_is_modified || 
		regdate_is_modified || 
		regbyid_is_modified || 
		folioitemid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        foliologid_is_modified = false;
        logname_is_modified = false;
        content_is_modified = false;
        regdate_is_modified = false;
        regbyid_is_modified = false;
        folioitemid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(FoliologBean bean) {
        setFoliologid(bean.getFoliologid());
        setLogname(bean.getLogname());
        setContent(bean.getContent());
        setRegdate(bean.getRegdate());
        setRegbyid(bean.getRegbyid());
        setFolioitemid(bean.getFolioitemid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[foliolog] "
                 + "\n - foliolog.foliologid = " + (foliologid_is_initialized ? ("[" + (foliologid == null ? null : foliologid.toString()) + "]") : "not initialized") + ""
                 + "\n - foliolog.logname = " + (logname_is_initialized ? ("[" + (logname == null ? null : logname.toString()) + "]") : "not initialized") + ""
                 + "\n - foliolog.content = " + (content_is_initialized ? ("[" + (content == null ? null : content.toString()) + "]") : "not initialized") + ""
                 + "\n - foliolog.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - foliolog.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - foliolog.folioitemid = " + (folioitemid_is_initialized ? ("[" + (folioitemid == null ? null : folioitemid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}