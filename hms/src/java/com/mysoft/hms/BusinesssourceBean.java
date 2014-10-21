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


public class BusinesssourceBean
// extends+ 

// extends- 

{
    private Integer businesssourceid;
    private boolean businesssourceid_is_modified = false;
    private boolean businesssourceid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private String nickname;
    private boolean nickname_is_modified = false;
    private boolean nickname_is_initialized = false;
    
    private Boolean status;
    private boolean status_is_modified = false;
    private boolean status_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    BusinesssourceBean()
    {
    }
    
    /**
     * Getter method for businesssourceid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: businesssource.businesssourceid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of businesssourceid
     */
    public Integer getBusinesssourceid()
    {
        return businesssourceid; 
    }

    /**
     * Setter method for businesssourceid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to businesssourceid
     */
    public void setBusinesssourceid(Integer newVal) {
        if ((newVal != null && this.businesssourceid != null && (newVal.compareTo(this.businesssourceid) == 0)) || 
            (newVal == null && this.businesssourceid == null && businesssourceid_is_initialized)) {
            return; 
        } 
        this.businesssourceid = newVal; 
        businesssourceid_is_modified = true; 
        businesssourceid_is_initialized = true; 
    }

    /**
     * Setter method for businesssourceid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to businesssourceid
     */
    public void setBusinesssourceid(int newVal) {
        setBusinesssourceid(new Integer(newVal));
    }

    /**
     * Determines if the businesssourceid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isBusinesssourceidModified() {
        return businesssourceid_is_modified; 
    }

    /**
     * Determines if the businesssourceid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isBusinesssourceidInitialized() {
        return businesssourceid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: businesssource.name
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
     * Getter method for nickname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: businesssource.nickname
     * <li>column size: -1
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of nickname
     */
    public String getNickname()
    {
        return nickname; 
    }

    /**
     * Setter method for nickname.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to nickname
     */
    public void setNickname(String newVal) {
        if ((newVal != null && this.nickname != null && (newVal.compareTo(this.nickname) == 0)) || 
            (newVal == null && this.nickname == null && nickname_is_initialized)) {
            return; 
        } 
        this.nickname = newVal; 
        nickname_is_modified = true; 
        nickname_is_initialized = true; 
    }

    /**
     * Determines if the nickname has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isNicknameModified() {
        return nickname_is_modified; 
    }

    /**
     * Determines if the nickname has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isNicknameInitialized() {
        return nickname_is_initialized; 
    }

    /**
     * Getter method for status.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: businesssource.status
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of status
     */
    public Boolean getStatus()
    {
        return status; 
    }

    /**
     * Setter method for status.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to status
     */
    public void setStatus(Boolean newVal) {
        if ((newVal != null && this.status != null && newVal.equals(this.status)) || 
            (newVal == null && this.status == null && status_is_initialized)) {
            return; 
        } 
        this.status = newVal; 
        status_is_modified = true; 
        status_is_initialized = true; 
    }

    /**
     * Setter method for status.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to status
     */
    public void setStatus(boolean newVal) {
        setStatus(new Boolean(newVal));
    }

    /**
     * Determines if the status has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isStatusModified() {
        return status_is_modified; 
    }

    /**
     * Determines if the status has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isStatusInitialized() {
        return status_is_initialized; 
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
        return businesssourceid_is_modified || 
		name_is_modified || 
		nickname_is_modified || 
		status_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        businesssourceid_is_modified = false;
        name_is_modified = false;
        nickname_is_modified = false;
        status_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(BusinesssourceBean bean) {
        setBusinesssourceid(bean.getBusinesssourceid());
        setName(bean.getName());
        setNickname(bean.getNickname());
        setStatus(bean.getStatus());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[businesssource] "
                 + "\n - businesssource.businesssourceid = " + (businesssourceid_is_initialized ? ("[" + (businesssourceid == null ? null : businesssourceid.toString()) + "]") : "not initialized") + ""
                 + "\n - businesssource.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - businesssource.nickname = " + (nickname_is_initialized ? ("[" + (nickname == null ? null : nickname.toString()) + "]") : "not initialized") + ""
                 + "\n - businesssource.status = " + (status_is_initialized ? ("[" + (status == null ? null : status.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
