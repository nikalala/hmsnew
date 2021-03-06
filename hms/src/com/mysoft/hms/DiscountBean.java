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


public class DiscountBean
// extends+ 

// extends- 

{
    private Integer discountid;
    private boolean discountid_is_modified = false;
    private boolean discountid_is_initialized = false;
    
    private String code;
    private boolean code_is_modified = false;
    private boolean code_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Boolean perctype;
    private boolean perctype_is_modified = false;
    private boolean perctype_is_initialized = false;
    
    private Boolean open;
    private boolean open_is_modified = false;
    private boolean open_is_initialized = false;
    
    private Double val;
    private boolean val_is_modified = false;
    private boolean val_is_initialized = false;
    
    private Boolean roomrate;
    private boolean roomrate_is_modified = false;
    private boolean roomrate_is_initialized = false;
    
    private Boolean extracharge;
    private boolean extracharge_is_modified = false;
    private boolean extracharge_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Boolean active;
    private boolean active_is_modified = false;
    private boolean active_is_initialized = false;
    
    private Boolean deleted;
    private boolean deleted_is_modified = false;
    private boolean deleted_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    DiscountBean()
    {
    }
    
    /**
     * Getter method for discountid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.discountid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of discountid
     */
    public Integer getDiscountid()
    {
        return discountid; 
    }

    /**
     * Setter method for discountid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to discountid
     */
    public void setDiscountid(Integer newVal) {
        if ((newVal != null && this.discountid != null && (newVal.compareTo(this.discountid) == 0)) || 
            (newVal == null && this.discountid == null && discountid_is_initialized)) {
            return; 
        } 
        this.discountid = newVal; 
        discountid_is_modified = true; 
        discountid_is_initialized = true; 
    }

    /**
     * Setter method for discountid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to discountid
     */
    public void setDiscountid(int newVal) {
        setDiscountid(new Integer(newVal));
    }

    /**
     * Determines if the discountid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDiscountidModified() {
        return discountid_is_modified; 
    }

    /**
     * Determines if the discountid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDiscountidInitialized() {
        return discountid_is_initialized; 
    }

    /**
     * Getter method for code.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.code
     * <li>comments: ????? ???????????
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of code
     */
    public String getCode()
    {
        return code; 
    }

    /**
     * Setter method for code.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to code
     */
    public void setCode(String newVal) {
        if ((newVal != null && this.code != null && (newVal.compareTo(this.code) == 0)) || 
            (newVal == null && this.code == null && code_is_initialized)) {
            return; 
        } 
        this.code = newVal; 
        code_is_modified = true; 
        code_is_initialized = true; 
    }

    /**
     * Determines if the code has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCodeModified() {
        return code_is_modified; 
    }

    /**
     * Determines if the code has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCodeInitialized() {
        return code_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.name
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
     * Getter method for perctype.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.perctype
     * <li>comments: ??????????? ????
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of perctype
     */
    public Boolean getPerctype()
    {
        return perctype; 
    }

    /**
     * Setter method for perctype.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to perctype
     */
    public void setPerctype(Boolean newVal) {
        if ((newVal != null && this.perctype != null && newVal.equals(this.perctype)) || 
            (newVal == null && this.perctype == null && perctype_is_initialized)) {
            return; 
        } 
        this.perctype = newVal; 
        perctype_is_modified = true; 
        perctype_is_initialized = true; 
    }

    /**
     * Setter method for perctype.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to perctype
     */
    public void setPerctype(boolean newVal) {
        setPerctype(new Boolean(newVal));
    }

    /**
     * Determines if the perctype has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPerctypeModified() {
        return perctype_is_modified; 
    }

    /**
     * Determines if the perctype has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPerctypeInitialized() {
        return perctype_is_initialized; 
    }

    /**
     * Getter method for open.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.open
     * <li>comments: ??? ??????????
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of open
     */
    public Boolean getOpen()
    {
        return open; 
    }

    /**
     * Setter method for open.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to open
     */
    public void setOpen(Boolean newVal) {
        if ((newVal != null && this.open != null && newVal.equals(this.open)) || 
            (newVal == null && this.open == null && open_is_initialized)) {
            return; 
        } 
        this.open = newVal; 
        open_is_modified = true; 
        open_is_initialized = true; 
    }

    /**
     * Setter method for open.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to open
     */
    public void setOpen(boolean newVal) {
        setOpen(new Boolean(newVal));
    }

    /**
     * Determines if the open has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isOpenModified() {
        return open_is_modified; 
    }

    /**
     * Determines if the open has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isOpenInitialized() {
        return open_is_initialized; 
    }

    /**
     * Getter method for val.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.val
     * <li>comments: ???????
     * <li>column size: 17
     * <li>jdbc type returned by the driver: Types.DOUBLE
     * </ul>
     *
     * @return the value of val
     */
    public Double getVal()
    {
        return val; 
    }

    /**
     * Setter method for val.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to val
     */
    public void setVal(Double newVal) {
        if ((newVal != null && this.val != null && (newVal.compareTo(this.val) == 0)) || 
            (newVal == null && this.val == null && val_is_initialized)) {
            return; 
        } 
        this.val = newVal; 
        val_is_modified = true; 
        val_is_initialized = true; 
    }

    /**
     * Setter method for val.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to val
     */
    public void setVal(double newVal) {
        setVal(new Double(newVal));
    }

    /**
     * Determines if the val has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isValModified() {
        return val_is_modified; 
    }

    /**
     * Determines if the val has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isValInitialized() {
        return val_is_initialized; 
    }

    /**
     * Getter method for roomrate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.roomrate
     * <li>comments: ?????? ?????????????
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of roomrate
     */
    public Boolean getRoomrate()
    {
        return roomrate; 
    }

    /**
     * Setter method for roomrate.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to roomrate
     */
    public void setRoomrate(Boolean newVal) {
        if ((newVal != null && this.roomrate != null && newVal.equals(this.roomrate)) || 
            (newVal == null && this.roomrate == null && roomrate_is_initialized)) {
            return; 
        } 
        this.roomrate = newVal; 
        roomrate_is_modified = true; 
        roomrate_is_initialized = true; 
    }

    /**
     * Setter method for roomrate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomrate
     */
    public void setRoomrate(boolean newVal) {
        setRoomrate(new Boolean(newVal));
    }

    /**
     * Determines if the roomrate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomrateModified() {
        return roomrate_is_modified; 
    }

    /**
     * Determines if the roomrate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomrateInitialized() {
        return roomrate_is_initialized; 
    }

    /**
     * Getter method for extracharge.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.extracharge
     * <li>comments: ????????? ??????????
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of extracharge
     */
    public Boolean getExtracharge()
    {
        return extracharge; 
    }

    /**
     * Setter method for extracharge.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to extracharge
     */
    public void setExtracharge(Boolean newVal) {
        if ((newVal != null && this.extracharge != null && newVal.equals(this.extracharge)) || 
            (newVal == null && this.extracharge == null && extracharge_is_initialized)) {
            return; 
        } 
        this.extracharge = newVal; 
        extracharge_is_modified = true; 
        extracharge_is_initialized = true; 
    }

    /**
     * Setter method for extracharge.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to extracharge
     */
    public void setExtracharge(boolean newVal) {
        setExtracharge(new Boolean(newVal));
    }

    /**
     * Determines if the extracharge has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isExtrachargeModified() {
        return extracharge_is_modified; 
    }

    /**
     * Determines if the extracharge has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isExtrachargeInitialized() {
        return extracharge_is_initialized; 
    }

    /**
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.regbyid
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
     * <li>full name: discount.regdate
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
     * <li>full name: discount.active
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
     * Getter method for deleted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: discount.deleted
     * <li>comments: ???????
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
        return discountid_is_modified || 
		code_is_modified || 
		name_is_modified || 
		perctype_is_modified || 
		open_is_modified || 
		val_is_modified || 
		roomrate_is_modified || 
		extracharge_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified || 
		deleted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        discountid_is_modified = false;
        code_is_modified = false;
        name_is_modified = false;
        perctype_is_modified = false;
        open_is_modified = false;
        val_is_modified = false;
        roomrate_is_modified = false;
        extracharge_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        active_is_modified = false;
        deleted_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(DiscountBean bean) {
        setDiscountid(bean.getDiscountid());
        setCode(bean.getCode());
        setName(bean.getName());
        setPerctype(bean.getPerctype());
        setOpen(bean.getOpen());
        setVal(bean.getVal());
        setRoomrate(bean.getRoomrate());
        setExtracharge(bean.getExtracharge());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setActive(bean.getActive());
        setDeleted(bean.getDeleted());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[discount] "
                 + "\n - discount.discountid = " + (discountid_is_initialized ? ("[" + (discountid == null ? null : discountid.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.code = " + (code_is_initialized ? ("[" + (code == null ? null : code.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.perctype = " + (perctype_is_initialized ? ("[" + (perctype == null ? null : perctype.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.open = " + (open_is_initialized ? ("[" + (open == null ? null : open.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.val = " + (val_is_initialized ? ("[" + (val == null ? null : val.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.roomrate = " + (roomrate_is_initialized ? ("[" + (roomrate == null ? null : roomrate.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.extracharge = " + (extracharge_is_initialized ? ("[" + (extracharge == null ? null : extracharge.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
                 + "\n - discount.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
