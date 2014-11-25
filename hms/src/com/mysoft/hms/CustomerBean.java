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


public class CustomerBean
// extends+ 

// extends- 

{
    private Long customerid;
    private boolean customerid_is_modified = false;
    private boolean customerid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private String lname;
    private boolean lname_is_modified = false;
    private boolean lname_is_initialized = false;
    
    private String fname;
    private boolean fname_is_modified = false;
    private boolean fname_is_initialized = false;
    
    private Boolean type;
    private boolean type_is_modified = false;
    private boolean type_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    CustomerBean()
    {
    }
    
    /**
     * Getter method for customerid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: customer.customerid
     * <li>column size: 8
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of customerid
     */
    public Long getCustomerid()
    {
        return customerid; 
    }

    /**
     * Setter method for customerid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to customerid
     */
    public void setCustomerid(Long newVal) {
        if ((newVal != null && this.customerid != null && (newVal.compareTo(this.customerid) == 0)) || 
            (newVal == null && this.customerid == null && customerid_is_initialized)) {
            return; 
        } 
        this.customerid = newVal; 
        customerid_is_modified = true; 
        customerid_is_initialized = true; 
    }

    /**
     * Setter method for customerid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to customerid
     */
    public void setCustomerid(long newVal) {
        setCustomerid(new Long(newVal));
    }

    /**
     * Determines if the customerid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCustomeridModified() {
        return customerid_is_modified; 
    }

    /**
     * Determines if the customerid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCustomeridInitialized() {
        return customerid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: customer.name
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
     * Getter method for lname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: customer.lname
     * <li>column size: -1
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of lname
     */
    public String getLname()
    {
        return lname; 
    }

    /**
     * Setter method for lname.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to lname
     */
    public void setLname(String newVal) {
        if ((newVal != null && this.lname != null && (newVal.compareTo(this.lname) == 0)) || 
            (newVal == null && this.lname == null && lname_is_initialized)) {
            return; 
        } 
        this.lname = newVal; 
        lname_is_modified = true; 
        lname_is_initialized = true; 
    }

    /**
     * Determines if the lname has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isLnameModified() {
        return lname_is_modified; 
    }

    /**
     * Determines if the lname has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isLnameInitialized() {
        return lname_is_initialized; 
    }

    /**
     * Getter method for fname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: customer.fname
     * <li>column size: -1
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of fname
     */
    public String getFname()
    {
        return fname; 
    }

    /**
     * Setter method for fname.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to fname
     */
    public void setFname(String newVal) {
        if ((newVal != null && this.fname != null && (newVal.compareTo(this.fname) == 0)) || 
            (newVal == null && this.fname == null && fname_is_initialized)) {
            return; 
        } 
        this.fname = newVal; 
        fname_is_modified = true; 
        fname_is_initialized = true; 
    }

    /**
     * Determines if the fname has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFnameModified() {
        return fname_is_modified; 
    }

    /**
     * Determines if the fname has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFnameInitialized() {
        return fname_is_initialized; 
    }

    /**
     * Getter method for type.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: customer.type
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of type
     */
    public Boolean getType()
    {
        return type; 
    }

    /**
     * Setter method for type.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to type
     */
    public void setType(Boolean newVal) {
        if ((newVal != null && this.type != null && newVal.equals(this.type)) || 
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
    public void setType(boolean newVal) {
        setType(new Boolean(newVal));
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
        return customerid_is_modified || 
		name_is_modified || 
		lname_is_modified || 
		fname_is_modified || 
		type_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        customerid_is_modified = false;
        name_is_modified = false;
        lname_is_modified = false;
        fname_is_modified = false;
        type_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(CustomerBean bean) {
        setCustomerid(bean.getCustomerid());
        setName(bean.getName());
        setLname(bean.getLname());
        setFname(bean.getFname());
        setType(bean.getType());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[customer] "
                 + "\n - customer.customerid = " + (customerid_is_initialized ? ("[" + (customerid == null ? null : customerid.toString()) + "]") : "not initialized") + ""
                 + "\n - customer.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - customer.lname = " + (lname_is_initialized ? ("[" + (lname == null ? null : lname.toString()) + "]") : "not initialized") + ""
                 + "\n - customer.fname = " + (fname_is_initialized ? ("[" + (fname == null ? null : fname.toString()) + "]") : "not initialized") + ""
                 + "\n - customer.type = " + (type_is_initialized ? ("[" + (type == null ? null : type.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}