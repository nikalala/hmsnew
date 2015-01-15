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

public class RoomhstBean
// extends+ 

// extends- 
{
    private Long roomhstid;
    private boolean roomhstid_is_modified = false;
    private boolean roomhstid_is_initialized = false;
    
    private Integer roomid;
    private boolean roomid_is_modified = false;
    private boolean roomid_is_initialized = false;
    
    private Integer housekeepingstatusid;
    private boolean housekeepingstatusid_is_modified = false;
    private boolean housekeepingstatusid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private Integer houseunitid;
    private boolean houseunitid_is_modified = false;
    private boolean houseunitid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    RoomhstBean()
    {
    }
    
    /**
     * Getter method for roomhstid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomhst.roomhstid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of roomhstid
     */
    public Long getRoomhstid()
    {
        return roomhstid; 
    }

    /**
     * Setter method for roomhstid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to roomhstid
     */
    public void setRoomhstid(Long newVal) {
        if ((newVal != null && this.roomhstid != null && (newVal.compareTo(this.roomhstid) == 0)) || 
            (newVal == null && this.roomhstid == null && roomhstid_is_initialized)) {
            return; 
        } 
        this.roomhstid = newVal; 
        roomhstid_is_modified = true; 
        roomhstid_is_initialized = true; 
    }

    /**
     * Setter method for roomhstid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomhstid
     */
    public void setRoomhstid(long newVal) {
        setRoomhstid(new Long(newVal));
    }

    /**
     * Determines if the roomhstid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomhstidModified() {
        return roomhstid_is_modified; 
    }

    /**
     * Determines if the roomhstid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomhstidInitialized() {
        return roomhstid_is_initialized; 
    }

    /**
     * Getter method for roomid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomhst.roomid
     * <li> foreign key: room.roomid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of roomid
     */
    public Integer getRoomid()
    {
        return roomid; 
    }

    /**
     * Setter method for roomid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to roomid
     */
    public void setRoomid(Integer newVal) {
        if ((newVal != null && this.roomid != null && (newVal.compareTo(this.roomid) == 0)) || 
            (newVal == null && this.roomid == null && roomid_is_initialized)) {
            return; 
        } 
        this.roomid = newVal; 
        roomid_is_modified = true; 
        roomid_is_initialized = true; 
    }

    /**
     * Setter method for roomid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomid
     */
    public void setRoomid(int newVal) {
        setRoomid(new Integer(newVal));
    }

    /**
     * Determines if the roomid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomidModified() {
        return roomid_is_modified; 
    }

    /**
     * Determines if the roomid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomidInitialized() {
        return roomid_is_initialized; 
    }

    /**
     * Getter method for housekeepingstatusid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomhst.housekeepingstatusid
     * <li> foreign key: housekeepingstatus.housekeepingstatusid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of housekeepingstatusid
     */
    public Integer getHousekeepingstatusid()
    {
        return housekeepingstatusid; 
    }

    /**
     * Setter method for housekeepingstatusid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to housekeepingstatusid
     */
    public void setHousekeepingstatusid(Integer newVal) {
        if ((newVal != null && this.housekeepingstatusid != null && (newVal.compareTo(this.housekeepingstatusid) == 0)) || 
            (newVal == null && this.housekeepingstatusid == null && housekeepingstatusid_is_initialized)) {
            return; 
        } 
        this.housekeepingstatusid = newVal; 
        housekeepingstatusid_is_modified = true; 
        housekeepingstatusid_is_initialized = true; 
    }

    /**
     * Setter method for housekeepingstatusid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to housekeepingstatusid
     */
    public void setHousekeepingstatusid(int newVal) {
        setHousekeepingstatusid(new Integer(newVal));
    }

    /**
     * Determines if the housekeepingstatusid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isHousekeepingstatusidModified() {
        return housekeepingstatusid_is_modified; 
    }

    /**
     * Determines if the housekeepingstatusid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isHousekeepingstatusidInitialized() {
        return housekeepingstatusid_is_initialized; 
    }

    /**
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomhst.regdate
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
     * <li>full name: roomhst.regbyid
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
     * Getter method for houseunitid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomhst.houseunitid
     * <li> foreign key: houseunit.houseunitid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of houseunitid
     */
    public Integer getHouseunitid()
    {
        return houseunitid; 
    }

    /**
     * Setter method for houseunitid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to houseunitid
     */
    public void setHouseunitid(Integer newVal) {
        if ((newVal != null && this.houseunitid != null && (newVal.compareTo(this.houseunitid) == 0)) || 
            (newVal == null && this.houseunitid == null && houseunitid_is_initialized)) {
            return; 
        } 
        this.houseunitid = newVal; 
        houseunitid_is_modified = true; 
        houseunitid_is_initialized = true; 
    }

    /**
     * Setter method for houseunitid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to houseunitid
     */
    public void setHouseunitid(int newVal) {
        setHouseunitid(new Integer(newVal));
    }

    /**
     * Determines if the houseunitid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isHouseunitidModified() {
        return houseunitid_is_modified; 
    }

    /**
     * Determines if the houseunitid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isHouseunitidInitialized() {
        return houseunitid_is_initialized; 
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
        return roomhstid_is_modified || 
		roomid_is_modified || 
		housekeepingstatusid_is_modified || 
		regdate_is_modified || 
		regbyid_is_modified || 
		houseunitid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        roomhstid_is_modified = false;
        roomid_is_modified = false;
        housekeepingstatusid_is_modified = false;
        regdate_is_modified = false;
        regbyid_is_modified = false;
        houseunitid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(RoomhstBean bean) {
        setRoomhstid(bean.getRoomhstid());
        setRoomid(bean.getRoomid());
        setHousekeepingstatusid(bean.getHousekeepingstatusid());
        setRegdate(bean.getRegdate());
        setRegbyid(bean.getRegbyid());
        setHouseunitid(bean.getHouseunitid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[roomhst] "
                 + "\n - roomhst.roomhstid = " + (roomhstid_is_initialized ? ("[" + (roomhstid == null ? null : roomhstid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomhst.roomid = " + (roomid_is_initialized ? ("[" + (roomid == null ? null : roomid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomhst.housekeepingstatusid = " + (housekeepingstatusid_is_initialized ? ("[" + (housekeepingstatusid == null ? null : housekeepingstatusid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomhst.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - roomhst.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomhst.houseunitid = " + (houseunitid_is_initialized ? ("[" + (houseunitid == null ? null : houseunitid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
