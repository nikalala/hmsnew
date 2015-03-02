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


public class StcolorBean
// extends+ 

// extends- 

{
    private Integer stcolorid;
    private boolean stcolorid_is_modified = false;
    private boolean stcolorid_is_initialized = false;
    
    private Integer roomstatus;
    private boolean roomstatus_is_modified = false;
    private boolean roomstatus_is_initialized = false;
    
    private String color;
    private boolean color_is_modified = false;
    private boolean color_is_initialized = false;
    
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
    StcolorBean()
    {
    }
    
    /**
     * Getter method for stcolorid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: stcolor.stcolorid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of stcolorid
     */
    public Integer getStcolorid()
    {
        return stcolorid; 
    }

    /**
     * Setter method for stcolorid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to stcolorid
     */
    public void setStcolorid(Integer newVal) {
        if ((newVal != null && this.stcolorid != null && (newVal.compareTo(this.stcolorid) == 0)) || 
            (newVal == null && this.stcolorid == null && stcolorid_is_initialized)) {
            return; 
        } 
        this.stcolorid = newVal; 
        stcolorid_is_modified = true; 
        stcolorid_is_initialized = true; 
    }

    /**
     * Setter method for stcolorid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to stcolorid
     */
    public void setStcolorid(int newVal) {
        setStcolorid(new Integer(newVal));
    }

    /**
     * Determines if the stcolorid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isStcoloridModified() {
        return stcolorid_is_modified; 
    }

    /**
     * Determines if the stcolorid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isStcoloridInitialized() {
        return stcolorid_is_initialized; 
    }

    /**
     * Getter method for roomstatus.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: stcolor.roomstatus
     * <li>comments: ???????CODEroomstatus
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of roomstatus
     */
    public Integer getRoomstatus()
    {
        return roomstatus; 
    }

    /**
     * Setter method for roomstatus.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to roomstatus
     */
    public void setRoomstatus(Integer newVal) {
        if ((newVal != null && this.roomstatus != null && (newVal.compareTo(this.roomstatus) == 0)) || 
            (newVal == null && this.roomstatus == null && roomstatus_is_initialized)) {
            return; 
        } 
        this.roomstatus = newVal; 
        roomstatus_is_modified = true; 
        roomstatus_is_initialized = true; 
    }

    /**
     * Setter method for roomstatus.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomstatus
     */
    public void setRoomstatus(int newVal) {
        setRoomstatus(new Integer(newVal));
    }

    /**
     * Determines if the roomstatus has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomstatusModified() {
        return roomstatus_is_modified; 
    }

    /**
     * Determines if the roomstatus has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomstatusInitialized() {
        return roomstatus_is_initialized; 
    }

    /**
     * Getter method for color.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: stcolor.color
     * <li>comments: ????
     * <li>default value: '#FFFFFF'::character varying
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of color
     */
    public String getColor()
    {
        return color; 
    }

    /**
     * Setter method for color.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to color
     */
    public void setColor(String newVal) {
        if ((newVal != null && this.color != null && (newVal.compareTo(this.color) == 0)) || 
            (newVal == null && this.color == null && color_is_initialized)) {
            return; 
        } 
        this.color = newVal; 
        color_is_modified = true; 
        color_is_initialized = true; 
    }

    /**
     * Determines if the color has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isColorModified() {
        return color_is_modified; 
    }

    /**
     * Determines if the color has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isColorInitialized() {
        return color_is_initialized; 
    }

    /**
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: stcolor.regbyid
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
     * <li>full name: stcolor.regdate
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
     * <li>full name: stcolor.active
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
     * <li>full name: stcolor.deleted
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
        return stcolorid_is_modified || 
		roomstatus_is_modified || 
		color_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified || 
		deleted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        stcolorid_is_modified = false;
        roomstatus_is_modified = false;
        color_is_modified = false;
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
    public void copy(StcolorBean bean) {
        setStcolorid(bean.getStcolorid());
        setRoomstatus(bean.getRoomstatus());
        setColor(bean.getColor());
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
        return   "\n[stcolor] "
                 + "\n - stcolor.stcolorid = " + (stcolorid_is_initialized ? ("[" + (stcolorid == null ? null : stcolorid.toString()) + "]") : "not initialized") + ""
                 + "\n - stcolor.roomstatus = " + (roomstatus_is_initialized ? ("[" + (roomstatus == null ? null : roomstatus.toString()) + "]") : "not initialized") + ""
                 + "\n - stcolor.color = " + (color_is_initialized ? ("[" + (color == null ? null : color.toString()) + "]") : "not initialized") + ""
                 + "\n - stcolor.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - stcolor.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - stcolor.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
                 + "\n - stcolor.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
