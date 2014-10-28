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

public class ConnectedroomBean
// extends+ 

// extends- 
{
    private Integer roomid;
    private boolean roomid_is_modified = false;
    private boolean roomid_is_initialized = false;
    
    private Integer connectedid;
    private boolean connectedid_is_modified = false;
    private boolean connectedid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    ConnectedroomBean()
    {
    }
    
    /**
     * Getter method for roomid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: connectedroom.roomid
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
     * Getter method for connectedid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: connectedroom.connectedid
     * <li> foreign key: room.roomid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of connectedid
     */
    public Integer getConnectedid()
    {
        return connectedid; 
    }

    /**
     * Setter method for connectedid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to connectedid
     */
    public void setConnectedid(Integer newVal) {
        if ((newVal != null && this.connectedid != null && (newVal.compareTo(this.connectedid) == 0)) || 
            (newVal == null && this.connectedid == null && connectedid_is_initialized)) {
            return; 
        } 
        this.connectedid = newVal; 
        connectedid_is_modified = true; 
        connectedid_is_initialized = true; 
    }

    /**
     * Setter method for connectedid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to connectedid
     */
    public void setConnectedid(int newVal) {
        setConnectedid(new Integer(newVal));
    }

    /**
     * Determines if the connectedid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isConnectedidModified() {
        return connectedid_is_modified; 
    }

    /**
     * Determines if the connectedid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isConnectedidInitialized() {
        return connectedid_is_initialized; 
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
        return roomid_is_modified || 
		connectedid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        roomid_is_modified = false;
        connectedid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(ConnectedroomBean bean) {
        setRoomid(bean.getRoomid());
        setConnectedid(bean.getConnectedid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[connectedroom] "
                 + "\n - connectedroom.roomid = " + (roomid_is_initialized ? ("[" + (roomid == null ? null : roomid.toString()) + "]") : "not initialized") + ""
                 + "\n - connectedroom.connectedid = " + (connectedid_is_initialized ? ("[" + (connectedid == null ? null : connectedid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
