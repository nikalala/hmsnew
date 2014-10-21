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

public class PersonnelBean
// extends+ 

// extends- 
{
    private Integer personnelid;
    private boolean personnelid_is_modified = false;
    private boolean personnelid_is_initialized = false;
    
    private String fname;
    private boolean fname_is_modified = false;
    private boolean fname_is_initialized = false;
    
    private String lname;
    private boolean lname_is_modified = false;
    private boolean lname_is_initialized = false;
    
    private String phone;
    private boolean phone_is_modified = false;
    private boolean phone_is_initialized = false;
    
    private Integer personneltypeid;
    private boolean personneltypeid_is_modified = false;
    private boolean personneltypeid_is_initialized = false;
    
    private String loginid;
    private boolean loginid_is_modified = false;
    private boolean loginid_is_initialized = false;
    
    private String password;
    private boolean password_is_modified = false;
    private boolean password_is_initialized = false;
    
    private String email;
    private boolean email_is_modified = false;
    private boolean email_is_initialized = false;
    
    private String address;
    private boolean address_is_modified = false;
    private boolean address_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Boolean deleted;
    private boolean deleted_is_modified = false;
    private boolean deleted_is_initialized = false;
    
    private Integer changebyid;
    private boolean changebyid_is_modified = false;
    private boolean changebyid_is_initialized = false;
    
    private java.sql.Timestamp changedate;
    private boolean changedate_is_modified = false;
    private boolean changedate_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    PersonnelBean()
    {
    }
    
    /**
     * Getter method for personnelid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.personnelid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of personnelid
     */
    public Integer getPersonnelid()
    {
        return personnelid; 
    }

    /**
     * Setter method for personnelid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to personnelid
     */
    public void setPersonnelid(Integer newVal) {
        if ((newVal != null && this.personnelid != null && (newVal.compareTo(this.personnelid) == 0)) || 
            (newVal == null && this.personnelid == null && personnelid_is_initialized)) {
            return; 
        } 
        this.personnelid = newVal; 
        personnelid_is_modified = true; 
        personnelid_is_initialized = true; 
    }

    /**
     * Setter method for personnelid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to personnelid
     */
    public void setPersonnelid(int newVal) {
        setPersonnelid(new Integer(newVal));
    }

    /**
     * Determines if the personnelid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPersonnelidModified() {
        return personnelid_is_modified; 
    }

    /**
     * Determines if the personnelid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPersonnelidInitialized() {
        return personnelid_is_initialized; 
    }

    /**
     * Getter method for fname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.fname
     * <li>column size: 2147483647
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
     * Getter method for lname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.lname
     * <li>column size: 2147483647
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
     * Getter method for phone.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.phone
     * <li>column size: 50
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of phone
     */
    public String getPhone()
    {
        return phone; 
    }

    /**
     * Setter method for phone.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to phone
     */
    public void setPhone(String newVal) {
        if ((newVal != null && this.phone != null && (newVal.compareTo(this.phone) == 0)) || 
            (newVal == null && this.phone == null && phone_is_initialized)) {
            return; 
        } 
        this.phone = newVal; 
        phone_is_modified = true; 
        phone_is_initialized = true; 
    }

    /**
     * Determines if the phone has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPhoneModified() {
        return phone_is_modified; 
    }

    /**
     * Determines if the phone has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPhoneInitialized() {
        return phone_is_initialized; 
    }

    /**
     * Getter method for personneltypeid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.personneltypeid
     * <li> foreign key: personneltype.personneltypeid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of personneltypeid
     */
    public Integer getPersonneltypeid()
    {
        return personneltypeid; 
    }

    /**
     * Setter method for personneltypeid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to personneltypeid
     */
    public void setPersonneltypeid(Integer newVal) {
        if ((newVal != null && this.personneltypeid != null && (newVal.compareTo(this.personneltypeid) == 0)) || 
            (newVal == null && this.personneltypeid == null && personneltypeid_is_initialized)) {
            return; 
        } 
        this.personneltypeid = newVal; 
        personneltypeid_is_modified = true; 
        personneltypeid_is_initialized = true; 
    }

    /**
     * Setter method for personneltypeid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to personneltypeid
     */
    public void setPersonneltypeid(int newVal) {
        setPersonneltypeid(new Integer(newVal));
    }

    /**
     * Determines if the personneltypeid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPersonneltypeidModified() {
        return personneltypeid_is_modified; 
    }

    /**
     * Determines if the personneltypeid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPersonneltypeidInitialized() {
        return personneltypeid_is_initialized; 
    }

    /**
     * Getter method for loginid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.loginid
     * <li>column size: 15
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of loginid
     */
    public String getLoginid()
    {
        return loginid; 
    }

    /**
     * Setter method for loginid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to loginid
     */
    public void setLoginid(String newVal) {
        if ((newVal != null && this.loginid != null && (newVal.compareTo(this.loginid) == 0)) || 
            (newVal == null && this.loginid == null && loginid_is_initialized)) {
            return; 
        } 
        this.loginid = newVal; 
        loginid_is_modified = true; 
        loginid_is_initialized = true; 
    }

    /**
     * Determines if the loginid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isLoginidModified() {
        return loginid_is_modified; 
    }

    /**
     * Determines if the loginid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isLoginidInitialized() {
        return loginid_is_initialized; 
    }

    /**
     * Getter method for password.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.password
     * <li>column size: 15
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of password
     */
    public String getPassword()
    {
        return password; 
    }

    /**
     * Setter method for password.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to password
     */
    public void setPassword(String newVal) {
        if ((newVal != null && this.password != null && (newVal.compareTo(this.password) == 0)) || 
            (newVal == null && this.password == null && password_is_initialized)) {
            return; 
        } 
        this.password = newVal; 
        password_is_modified = true; 
        password_is_initialized = true; 
    }

    /**
     * Determines if the password has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPasswordModified() {
        return password_is_modified; 
    }

    /**
     * Determines if the password has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPasswordInitialized() {
        return password_is_initialized; 
    }

    /**
     * Getter method for email.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.email
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of email
     */
    public String getEmail()
    {
        return email; 
    }

    /**
     * Setter method for email.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to email
     */
    public void setEmail(String newVal) {
        if ((newVal != null && this.email != null && (newVal.compareTo(this.email) == 0)) || 
            (newVal == null && this.email == null && email_is_initialized)) {
            return; 
        } 
        this.email = newVal; 
        email_is_modified = true; 
        email_is_initialized = true; 
    }

    /**
     * Determines if the email has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isEmailModified() {
        return email_is_modified; 
    }

    /**
     * Determines if the email has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isEmailInitialized() {
        return email_is_initialized; 
    }

    /**
     * Getter method for address.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.address
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of address
     */
    public String getAddress()
    {
        return address; 
    }

    /**
     * Setter method for address.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to address
     */
    public void setAddress(String newVal) {
        if ((newVal != null && this.address != null && (newVal.compareTo(this.address) == 0)) || 
            (newVal == null && this.address == null && address_is_initialized)) {
            return; 
        } 
        this.address = newVal; 
        address_is_modified = true; 
        address_is_initialized = true; 
    }

    /**
     * Determines if the address has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAddressModified() {
        return address_is_modified; 
    }

    /**
     * Determines if the address has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAddressInitialized() {
        return address_is_initialized; 
    }

    /**
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.regdate
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
     * Getter method for deleted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.deleted
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of deleted
     */
    public Boolean getDeleted()
    {
        return deleted; 
    }

    /**
     * Setter method for deleted.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to deleted
     */
    public void setDeleted(Boolean newVal) {
        if ((newVal != null && this.deleted != null && newVal.equals(this.deleted)) || 
            (newVal == null && this.deleted == null && deleted_is_initialized)) {
            return; 
        } 
        this.deleted = newVal; 
        deleted_is_modified = true; 
        deleted_is_initialized = true; 
    }

    /**
     * Setter method for deleted.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to deleted
     */
    public void setDeleted(boolean newVal) {
        setDeleted(new Boolean(newVal));
    }

    /**
     * Determines if the deleted has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDeletedModified() {
        return deleted_is_modified; 
    }

    /**
     * Determines if the deleted has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDeletedInitialized() {
        return deleted_is_initialized; 
    }

    /**
     * Getter method for changebyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.changebyid
     * <li> foreign key: personnel.personnelid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of changebyid
     */
    public Integer getChangebyid()
    {
        return changebyid; 
    }

    /**
     * Setter method for changebyid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to changebyid
     */
    public void setChangebyid(Integer newVal) {
        if ((newVal != null && this.changebyid != null && (newVal.compareTo(this.changebyid) == 0)) || 
            (newVal == null && this.changebyid == null && changebyid_is_initialized)) {
            return; 
        } 
        this.changebyid = newVal; 
        changebyid_is_modified = true; 
        changebyid_is_initialized = true; 
    }

    /**
     * Setter method for changebyid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to changebyid
     */
    public void setChangebyid(int newVal) {
        setChangebyid(new Integer(newVal));
    }

    /**
     * Determines if the changebyid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isChangebyidModified() {
        return changebyid_is_modified; 
    }

    /**
     * Determines if the changebyid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isChangebyidInitialized() {
        return changebyid_is_initialized; 
    }

    /**
     * Getter method for changedate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: personnel.changedate
     * <li>default value: now()
     * <li>column size: 29
     * <li>jdbc type returned by the driver: Types.TIMESTAMP
     * </ul>
     *
     * @return the value of changedate
     */
    public java.sql.Timestamp getChangedate()
    {
        return changedate; 
    }

    /**
     * Setter method for changedate.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to changedate
     */
    public void setChangedate(java.sql.Timestamp newVal) {
        if ((newVal != null && this.changedate != null && (newVal.compareTo(this.changedate) == 0)) || 
            (newVal == null && this.changedate == null && changedate_is_initialized)) {
            return; 
        } 
        this.changedate = newVal; 
        changedate_is_modified = true; 
        changedate_is_initialized = true; 
    }

    /**
     * Setter method for changedate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to changedate
     */
    public void setChangedate(long newVal) {
        setChangedate(new java.sql.Timestamp(newVal));
    }

    /**
     * Determines if the changedate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isChangedateModified() {
        return changedate_is_modified; 
    }

    /**
     * Determines if the changedate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isChangedateInitialized() {
        return changedate_is_initialized; 
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
        return personnelid_is_modified || 
		fname_is_modified || 
		lname_is_modified || 
		phone_is_modified || 
		personneltypeid_is_modified || 
		loginid_is_modified || 
		password_is_modified || 
		email_is_modified || 
		address_is_modified || 
		regdate_is_modified || 
		deleted_is_modified || 
		changebyid_is_modified || 
		changedate_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        personnelid_is_modified = false;
        fname_is_modified = false;
        lname_is_modified = false;
        phone_is_modified = false;
        personneltypeid_is_modified = false;
        loginid_is_modified = false;
        password_is_modified = false;
        email_is_modified = false;
        address_is_modified = false;
        regdate_is_modified = false;
        deleted_is_modified = false;
        changebyid_is_modified = false;
        changedate_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(PersonnelBean bean) {
        setPersonnelid(bean.getPersonnelid());
        setFname(bean.getFname());
        setLname(bean.getLname());
        setPhone(bean.getPhone());
        setPersonneltypeid(bean.getPersonneltypeid());
        setLoginid(bean.getLoginid());
        setPassword(bean.getPassword());
        setEmail(bean.getEmail());
        setAddress(bean.getAddress());
        setRegdate(bean.getRegdate());
        setDeleted(bean.getDeleted());
        setChangebyid(bean.getChangebyid());
        setChangedate(bean.getChangedate());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[personnel] "
                 + "\n - personnel.personnelid = " + (personnelid_is_initialized ? ("[" + (personnelid == null ? null : personnelid.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.fname = " + (fname_is_initialized ? ("[" + (fname == null ? null : fname.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.lname = " + (lname_is_initialized ? ("[" + (lname == null ? null : lname.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.phone = " + (phone_is_initialized ? ("[" + (phone == null ? null : phone.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.personneltypeid = " + (personneltypeid_is_initialized ? ("[" + (personneltypeid == null ? null : personneltypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.loginid = " + (loginid_is_initialized ? ("[" + (loginid == null ? null : loginid.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.password = " + (password_is_initialized ? ("[" + (password == null ? null : password.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.email = " + (email_is_initialized ? ("[" + (email == null ? null : email.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.address = " + (address_is_initialized ? ("[" + (address == null ? null : address.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.changebyid = " + (changebyid_is_initialized ? ("[" + (changebyid == null ? null : changebyid.toString()) + "]") : "not initialized") + ""
                 + "\n - personnel.changedate = " + (changedate_is_initialized ? ("[" + (changedate == null ? null : changedate.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
