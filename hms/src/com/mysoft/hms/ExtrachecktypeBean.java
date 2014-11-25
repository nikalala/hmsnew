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


public class ExtrachecktypeBean
// extends+ 

// extends- 

{
    private Integer extrachecktypeid;
    private boolean extrachecktypeid_is_modified = false;
    private boolean extrachecktypeid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Boolean autoincrement;
    private boolean autoincrement_is_modified = false;
    private boolean autoincrement_is_initialized = false;
    
    private String prefix;
    private boolean prefix_is_modified = false;
    private boolean prefix_is_initialized = false;
    
    private Long startvalue;
    private boolean startvalue_is_modified = false;
    private boolean startvalue_is_initialized = false;
    
    private Integer resettype;
    private boolean resettype_is_modified = false;
    private boolean resettype_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    ExtrachecktypeBean()
    {
    }
    
    /**
     * Getter method for extrachecktypeid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: extrachecktype.extrachecktypeid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of extrachecktypeid
     */
    public Integer getExtrachecktypeid()
    {
        return extrachecktypeid; 
    }

    /**
     * Setter method for extrachecktypeid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to extrachecktypeid
     */
    public void setExtrachecktypeid(Integer newVal) {
        if ((newVal != null && this.extrachecktypeid != null && (newVal.compareTo(this.extrachecktypeid) == 0)) || 
            (newVal == null && this.extrachecktypeid == null && extrachecktypeid_is_initialized)) {
            return; 
        } 
        this.extrachecktypeid = newVal; 
        extrachecktypeid_is_modified = true; 
        extrachecktypeid_is_initialized = true; 
    }

    /**
     * Setter method for extrachecktypeid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to extrachecktypeid
     */
    public void setExtrachecktypeid(int newVal) {
        setExtrachecktypeid(new Integer(newVal));
    }

    /**
     * Determines if the extrachecktypeid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isExtrachecktypeidModified() {
        return extrachecktypeid_is_modified; 
    }

    /**
     * Determines if the extrachecktypeid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isExtrachecktypeidInitialized() {
        return extrachecktypeid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: extrachecktype.name
     * <li>column size: -1
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
     * Getter method for autoincrement.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: extrachecktype.autoincrement
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of autoincrement
     */
    public Boolean getAutoincrement()
    {
        return autoincrement; 
    }

    /**
     * Setter method for autoincrement.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to autoincrement
     */
    public void setAutoincrement(Boolean newVal) {
        if ((newVal != null && this.autoincrement != null && newVal.equals(this.autoincrement)) || 
            (newVal == null && this.autoincrement == null && autoincrement_is_initialized)) {
            return; 
        } 
        this.autoincrement = newVal; 
        autoincrement_is_modified = true; 
        autoincrement_is_initialized = true; 
    }

    /**
     * Setter method for autoincrement.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to autoincrement
     */
    public void setAutoincrement(boolean newVal) {
        setAutoincrement(new Boolean(newVal));
    }

    /**
     * Determines if the autoincrement has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAutoincrementModified() {
        return autoincrement_is_modified; 
    }

    /**
     * Determines if the autoincrement has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAutoincrementInitialized() {
        return autoincrement_is_initialized; 
    }

    /**
     * Getter method for prefix.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: extrachecktype.prefix
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of prefix
     */
    public String getPrefix()
    {
        return prefix; 
    }

    /**
     * Setter method for prefix.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to prefix
     */
    public void setPrefix(String newVal) {
        if ((newVal != null && this.prefix != null && (newVal.compareTo(this.prefix) == 0)) || 
            (newVal == null && this.prefix == null && prefix_is_initialized)) {
            return; 
        } 
        this.prefix = newVal; 
        prefix_is_modified = true; 
        prefix_is_initialized = true; 
    }

    /**
     * Determines if the prefix has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPrefixModified() {
        return prefix_is_modified; 
    }

    /**
     * Determines if the prefix has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPrefixInitialized() {
        return prefix_is_initialized; 
    }

    /**
     * Getter method for startvalue.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: extrachecktype.startvalue
     * <li>default value: 1
     * <li>column size: 8
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of startvalue
     */
    public Long getStartvalue()
    {
        return startvalue; 
    }

    /**
     * Setter method for startvalue.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to startvalue
     */
    public void setStartvalue(Long newVal) {
        if ((newVal != null && this.startvalue != null && (newVal.compareTo(this.startvalue) == 0)) || 
            (newVal == null && this.startvalue == null && startvalue_is_initialized)) {
            return; 
        } 
        this.startvalue = newVal; 
        startvalue_is_modified = true; 
        startvalue_is_initialized = true; 
    }

    /**
     * Setter method for startvalue.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to startvalue
     */
    public void setStartvalue(long newVal) {
        setStartvalue(new Long(newVal));
    }

    /**
     * Determines if the startvalue has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isStartvalueModified() {
        return startvalue_is_modified; 
    }

    /**
     * Determines if the startvalue has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isStartvalueInitialized() {
        return startvalue_is_initialized; 
    }

    /**
     * Getter method for resettype.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: extrachecktype.resettype
     * <li>default value: 0
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of resettype
     */
    public Integer getResettype()
    {
        return resettype; 
    }

    /**
     * Setter method for resettype.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to resettype
     */
    public void setResettype(Integer newVal) {
        if ((newVal != null && this.resettype != null && (newVal.compareTo(this.resettype) == 0)) || 
            (newVal == null && this.resettype == null && resettype_is_initialized)) {
            return; 
        } 
        this.resettype = newVal; 
        resettype_is_modified = true; 
        resettype_is_initialized = true; 
    }

    /**
     * Setter method for resettype.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to resettype
     */
    public void setResettype(int newVal) {
        setResettype(new Integer(newVal));
    }

    /**
     * Determines if the resettype has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isResettypeModified() {
        return resettype_is_modified; 
    }

    /**
     * Determines if the resettype has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isResettypeInitialized() {
        return resettype_is_initialized; 
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
        return extrachecktypeid_is_modified || 
		name_is_modified || 
		autoincrement_is_modified || 
		prefix_is_modified || 
		startvalue_is_modified || 
		resettype_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        extrachecktypeid_is_modified = false;
        name_is_modified = false;
        autoincrement_is_modified = false;
        prefix_is_modified = false;
        startvalue_is_modified = false;
        resettype_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(ExtrachecktypeBean bean) {
        setExtrachecktypeid(bean.getExtrachecktypeid());
        setName(bean.getName());
        setAutoincrement(bean.getAutoincrement());
        setPrefix(bean.getPrefix());
        setStartvalue(bean.getStartvalue());
        setResettype(bean.getResettype());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[extrachecktype] "
                 + "\n - extrachecktype.extrachecktypeid = " + (extrachecktypeid_is_initialized ? ("[" + (extrachecktypeid == null ? null : extrachecktypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - extrachecktype.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - extrachecktype.autoincrement = " + (autoincrement_is_initialized ? ("[" + (autoincrement == null ? null : autoincrement.toString()) + "]") : "not initialized") + ""
                 + "\n - extrachecktype.prefix = " + (prefix_is_initialized ? ("[" + (prefix == null ? null : prefix.toString()) + "]") : "not initialized") + ""
                 + "\n - extrachecktype.startvalue = " + (startvalue_is_initialized ? ("[" + (startvalue == null ? null : startvalue.toString()) + "]") : "not initialized") + ""
                 + "\n - extrachecktype.resettype = " + (resettype_is_initialized ? ("[" + (resettype == null ? null : resettype.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}