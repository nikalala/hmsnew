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


public class TemplatecategoryBean
// extends+ 

// extends- 

{
    private Integer templatecategoryid;
    private boolean templatecategoryid_is_modified = false;
    private boolean templatecategoryid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Boolean active;
    private boolean active_is_modified = false;
    private boolean active_is_initialized = false;
    
    private Boolean deteted;
    private boolean deteted_is_modified = false;
    private boolean deteted_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    TemplatecategoryBean()
    {
    }
    
    /**
     * Getter method for templatecategoryid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templatecategory.templatecategoryid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of templatecategoryid
     */
    public Integer getTemplatecategoryid()
    {
        return templatecategoryid; 
    }

    /**
     * Setter method for templatecategoryid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to templatecategoryid
     */
    public void setTemplatecategoryid(Integer newVal) {
        if ((newVal != null && this.templatecategoryid != null && (newVal.compareTo(this.templatecategoryid) == 0)) || 
            (newVal == null && this.templatecategoryid == null && templatecategoryid_is_initialized)) {
            return; 
        } 
        this.templatecategoryid = newVal; 
        templatecategoryid_is_modified = true; 
        templatecategoryid_is_initialized = true; 
    }

    /**
     * Setter method for templatecategoryid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to templatecategoryid
     */
    public void setTemplatecategoryid(int newVal) {
        setTemplatecategoryid(new Integer(newVal));
    }

    /**
     * Determines if the templatecategoryid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTemplatecategoryidModified() {
        return templatecategoryid_is_modified; 
    }

    /**
     * Determines if the templatecategoryid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTemplatecategoryidInitialized() {
        return templatecategoryid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templatecategory.name
     * <li>comments: ??????????
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
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templatecategory.regbyid
     * <li> foreign key: personnel.personnelid
     * <li>comments: ??????
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
     * <li>full name: templatecategory.regdate
     * <li>comments: ???????????? ??????
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
     * Getter method for active.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templatecategory.active
     * <li>comments: ???????
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of active
     */
    public Boolean getActive()
    {
        return active; 
    }

    /**
     * Setter method for active.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to active
     */
    public void setActive(Boolean newVal) {
        if ((newVal != null && this.active != null && newVal.equals(this.active)) || 
            (newVal == null && this.active == null && active_is_initialized)) {
            return; 
        } 
        this.active = newVal; 
        active_is_modified = true; 
        active_is_initialized = true; 
    }

    /**
     * Setter method for active.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to active
     */
    public void setActive(boolean newVal) {
        setActive(new Boolean(newVal));
    }

    /**
     * Determines if the active has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isActiveModified() {
        return active_is_modified; 
    }

    /**
     * Determines if the active has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isActiveInitialized() {
        return active_is_initialized; 
    }

    /**
     * Getter method for deteted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templatecategory.deteted
     * <li>comments: ???????
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of deteted
     */
    public Boolean getDeteted()
    {
        return deteted; 
    }

    /**
     * Setter method for deteted.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to deteted
     */
    public void setDeteted(Boolean newVal) {
        if ((newVal != null && this.deteted != null && newVal.equals(this.deteted)) || 
            (newVal == null && this.deteted == null && deteted_is_initialized)) {
            return; 
        } 
        this.deteted = newVal; 
        deteted_is_modified = true; 
        deteted_is_initialized = true; 
    }

    /**
     * Setter method for deteted.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to deteted
     */
    public void setDeteted(boolean newVal) {
        setDeteted(new Boolean(newVal));
    }

    /**
     * Determines if the deteted has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDetetedModified() {
        return deteted_is_modified; 
    }

    /**
     * Determines if the deteted has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDetetedInitialized() {
        return deteted_is_initialized; 
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
        return templatecategoryid_is_modified || 
		name_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified || 
		deteted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        templatecategoryid_is_modified = false;
        name_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        active_is_modified = false;
        deteted_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(TemplatecategoryBean bean) {
        setTemplatecategoryid(bean.getTemplatecategoryid());
        setName(bean.getName());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setActive(bean.getActive());
        setDeteted(bean.getDeteted());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[templatecategory] "
                 + "\n - templatecategory.templatecategoryid = " + (templatecategoryid_is_initialized ? ("[" + (templatecategoryid == null ? null : templatecategoryid.toString()) + "]") : "not initialized") + ""
                 + "\n - templatecategory.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - templatecategory.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - templatecategory.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - templatecategory.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
                 + "\n - templatecategory.deteted = " + (deteted_is_initialized ? ("[" + (deteted == null ? null : deteted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
