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


public class RatetyperoomtypeBean
// extends+ 

// extends- 

{
    private Integer ratetypeid;
    private boolean ratetypeid_is_modified = false;
    private boolean ratetypeid_is_initialized = false;
    
    private Integer roomtypeid;
    private boolean roomtypeid_is_modified = false;
    private boolean roomtypeid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    RatetyperoomtypeBean()
    {
    }
    
    /**
     * Getter method for ratetypeid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: ratetyperoomtype.ratetypeid
     * <li> foreign key: ratetype.ratetypeid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of ratetypeid
     */
    public Integer getRatetypeid()
    {
        return ratetypeid; 
    }

    /**
     * Setter method for ratetypeid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to ratetypeid
     */
    public void setRatetypeid(Integer newVal) {
        if ((newVal != null && this.ratetypeid != null && (newVal.compareTo(this.ratetypeid) == 0)) || 
            (newVal == null && this.ratetypeid == null && ratetypeid_is_initialized)) {
            return; 
        } 
        this.ratetypeid = newVal; 
        ratetypeid_is_modified = true; 
        ratetypeid_is_initialized = true; 
    }

    /**
     * Setter method for ratetypeid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to ratetypeid
     */
    public void setRatetypeid(int newVal) {
        setRatetypeid(new Integer(newVal));
    }

    /**
     * Determines if the ratetypeid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRatetypeidModified() {
        return ratetypeid_is_modified; 
    }

    /**
     * Determines if the ratetypeid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRatetypeidInitialized() {
        return ratetypeid_is_initialized; 
    }

    /**
     * Getter method for roomtypeid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: ratetyperoomtype.roomtypeid
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
        return ratetypeid_is_modified || 
		roomtypeid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        ratetypeid_is_modified = false;
        roomtypeid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(RatetyperoomtypeBean bean) {
        setRatetypeid(bean.getRatetypeid());
        setRoomtypeid(bean.getRoomtypeid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[ratetyperoomtype] "
                 + "\n - ratetyperoomtype.ratetypeid = " + (ratetypeid_is_initialized ? ("[" + (ratetypeid == null ? null : ratetypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - ratetyperoomtype.roomtypeid = " + (roomtypeid_is_initialized ? ("[" + (roomtypeid == null ? null : roomtypeid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
