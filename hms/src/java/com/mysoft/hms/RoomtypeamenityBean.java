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


public class RoomtypeamenityBean
// extends+ 

// extends- 

{
    private Integer roomtypeid;
    private boolean roomtypeid_is_modified = false;
    private boolean roomtypeid_is_initialized = false;
    
    private Integer amenityid;
    private boolean amenityid_is_modified = false;
    private boolean amenityid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    RoomtypeamenityBean()
    {
    }
    
    /**
     * Getter method for roomtypeid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtypeamenity.roomtypeid
     * <li> foreign key: roomtype.roomtypeid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of roomtypeid
     */
    public Integer getRoomtypeid()
    {
        return roomtypeid; 
    }

    /**
     * Setter method for roomtypeid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to roomtypeid
     */
    public void setRoomtypeid(Integer newVal) {
        if ((newVal != null && this.roomtypeid != null && (newVal.compareTo(this.roomtypeid) == 0)) || 
            (newVal == null && this.roomtypeid == null && roomtypeid_is_initialized)) {
            return; 
        } 
        this.roomtypeid = newVal; 
        roomtypeid_is_modified = true; 
        roomtypeid_is_initialized = true; 
    }

    /**
     * Setter method for roomtypeid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomtypeid
     */
    public void setRoomtypeid(int newVal) {
        setRoomtypeid(new Integer(newVal));
    }

    /**
     * Determines if the roomtypeid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomtypeidModified() {
        return roomtypeid_is_modified; 
    }

    /**
     * Determines if the roomtypeid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomtypeidInitialized() {
        return roomtypeid_is_initialized; 
    }

    /**
     * Getter method for amenityid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtypeamenity.amenityid
     * <li> foreign key: amenity.amenityid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of amenityid
     */
    public Integer getAmenityid()
    {
        return amenityid; 
    }

    /**
     * Setter method for amenityid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to amenityid
     */
    public void setAmenityid(Integer newVal) {
        if ((newVal != null && this.amenityid != null && (newVal.compareTo(this.amenityid) == 0)) || 
            (newVal == null && this.amenityid == null && amenityid_is_initialized)) {
            return; 
        } 
        this.amenityid = newVal; 
        amenityid_is_modified = true; 
        amenityid_is_initialized = true; 
    }

    /**
     * Setter method for amenityid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to amenityid
     */
    public void setAmenityid(int newVal) {
        setAmenityid(new Integer(newVal));
    }

    /**
     * Determines if the amenityid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAmenityidModified() {
        return amenityid_is_modified; 
    }

    /**
     * Determines if the amenityid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAmenityidInitialized() {
        return amenityid_is_initialized; 
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
        return roomtypeid_is_modified || 
		amenityid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        roomtypeid_is_modified = false;
        amenityid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(RoomtypeamenityBean bean) {
        setRoomtypeid(bean.getRoomtypeid());
        setAmenityid(bean.getAmenityid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[roomtypeamenity] "
                 + "\n - roomtypeamenity.roomtypeid = " + (roomtypeid_is_initialized ? ("[" + (roomtypeid == null ? null : roomtypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtypeamenity.amenityid = " + (amenityid_is_initialized ? ("[" + (amenityid == null ? null : amenityid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}