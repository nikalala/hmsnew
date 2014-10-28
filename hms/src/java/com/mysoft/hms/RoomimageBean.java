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

public class RoomimageBean
// extends+ 

// extends- 
{
    private Integer roomimageid;
    private boolean roomimageid_is_modified = false;
    private boolean roomimageid_is_initialized = false;
    
    private Integer roomid;
    private boolean roomid_is_modified = false;
    private boolean roomid_is_initialized = false;
    
    private String path;
    private boolean path_is_modified = false;
    private boolean path_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Boolean active;
    private boolean active_is_modified = false;
    private boolean active_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    RoomimageBean()
    {
    }
    
    /**
     * Getter method for roomimageid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomimage.roomimageid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of roomimageid
     */
    public Integer getRoomimageid()
    {
        return roomimageid; 
    }

    /**
     * Setter method for roomimageid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to roomimageid
     */
    public void setRoomimageid(Integer newVal) {
        if ((newVal != null && this.roomimageid != null && (newVal.compareTo(this.roomimageid) == 0)) || 
            (newVal == null && this.roomimageid == null && roomimageid_is_initialized)) {
            return; 
        } 
        this.roomimageid = newVal; 
        roomimageid_is_modified = true; 
        roomimageid_is_initialized = true; 
    }

    /**
     * Setter method for roomimageid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomimageid
     */
    public void setRoomimageid(int newVal) {
        setRoomimageid(new Integer(newVal));
    }

    /**
     * Determines if the roomimageid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomimageidModified() {
        return roomimageid_is_modified; 
    }

    /**
     * Determines if the roomimageid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomimageidInitialized() {
        return roomimageid_is_initialized; 
    }

    /**
     * Getter method for roomid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomimage.roomid
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
     * Getter method for path.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomimage.path
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of path
     */
    public String getPath()
    {
        return path; 
    }

    /**
     * Setter method for path.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to path
     */
    public void setPath(String newVal) {
        if ((newVal != null && this.path != null && (newVal.compareTo(this.path) == 0)) || 
            (newVal == null && this.path == null && path_is_initialized)) {
            return; 
        } 
        this.path = newVal; 
        path_is_modified = true; 
        path_is_initialized = true; 
    }

    /**
     * Determines if the path has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPathModified() {
        return path_is_modified; 
    }

    /**
     * Determines if the path has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPathInitialized() {
        return path_is_initialized; 
    }

    /**
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomimage.regbyid
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
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomimage.regdate
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
     * <li>full name: roomimage.active
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
        return roomimageid_is_modified || 
		roomid_is_modified || 
		path_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        roomimageid_is_modified = false;
        roomid_is_modified = false;
        path_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        active_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(RoomimageBean bean) {
        setRoomimageid(bean.getRoomimageid());
        setRoomid(bean.getRoomid());
        setPath(bean.getPath());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setActive(bean.getActive());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[roomimage] "
                 + "\n - roomimage.roomimageid = " + (roomimageid_is_initialized ? ("[" + (roomimageid == null ? null : roomimageid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomimage.roomid = " + (roomid_is_initialized ? ("[" + (roomid == null ? null : roomid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomimage.path = " + (path_is_initialized ? ("[" + (path == null ? null : path.toString()) + "]") : "not initialized") + ""
                 + "\n - roomimage.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomimage.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - roomimage.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
