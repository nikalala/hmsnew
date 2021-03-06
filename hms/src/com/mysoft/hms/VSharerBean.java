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


public class VSharerBean
// extends+ 

// extends- 

{
    private String guest;
    private boolean guest_is_modified = false;
    private boolean guest_is_initialized = false;
    
    private Long guestid;
    private boolean guestid_is_modified = false;
    private boolean guestid_is_initialized = false;
    
    private Long reservationroomid;
    private boolean reservationroomid_is_modified = false;
    private boolean reservationroomid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    VSharerBean()
    {
    }
    
    /**
     * Getter method for guest.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_sharer.guest
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of guest
     */
    public String getGuest()
    {
        return guest; 
    }

    /**
     * Setter method for guest.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to guest
     */
    public void setGuest(String newVal) {
        if ((newVal != null && this.guest != null && (newVal.compareTo(this.guest) == 0)) || 
            (newVal == null && this.guest == null && guest_is_initialized)) {
            return; 
        } 
        this.guest = newVal; 
        guest_is_modified = true; 
        guest_is_initialized = true; 
    }

    /**
     * Determines if the guest has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isGuestModified() {
        return guest_is_modified; 
    }

    /**
     * Determines if the guest has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isGuestInitialized() {
        return guest_is_initialized; 
    }

    /**
     * Getter method for guestid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_sharer.guestid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of guestid
     */
    public Long getGuestid()
    {
        return guestid; 
    }

    /**
     * Setter method for guestid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to guestid
     */
    public void setGuestid(Long newVal) {
        if ((newVal != null && this.guestid != null && (newVal.compareTo(this.guestid) == 0)) || 
            (newVal == null && this.guestid == null && guestid_is_initialized)) {
            return; 
        } 
        this.guestid = newVal; 
        guestid_is_modified = true; 
        guestid_is_initialized = true; 
    }

    /**
     * Setter method for guestid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to guestid
     */
    public void setGuestid(long newVal) {
        setGuestid(new Long(newVal));
    }

    /**
     * Determines if the guestid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isGuestidModified() {
        return guestid_is_modified; 
    }

    /**
     * Determines if the guestid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isGuestidInitialized() {
        return guestid_is_initialized; 
    }

    /**
     * Getter method for reservationroomid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_sharer.reservationroomid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of reservationroomid
     */
    public Long getReservationroomid()
    {
        return reservationroomid; 
    }

    /**
     * Setter method for reservationroomid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to reservationroomid
     */
    public void setReservationroomid(Long newVal) {
        if ((newVal != null && this.reservationroomid != null && (newVal.compareTo(this.reservationroomid) == 0)) || 
            (newVal == null && this.reservationroomid == null && reservationroomid_is_initialized)) {
            return; 
        } 
        this.reservationroomid = newVal; 
        reservationroomid_is_modified = true; 
        reservationroomid_is_initialized = true; 
    }

    /**
     * Setter method for reservationroomid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to reservationroomid
     */
    public void setReservationroomid(long newVal) {
        setReservationroomid(new Long(newVal));
    }

    /**
     * Determines if the reservationroomid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isReservationroomidModified() {
        return reservationroomid_is_modified; 
    }

    /**
     * Determines if the reservationroomid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isReservationroomidInitialized() {
        return reservationroomid_is_initialized; 
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
        return guest_is_modified || 
		guestid_is_modified || 
		reservationroomid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        guest_is_modified = false;
        guestid_is_modified = false;
        reservationroomid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(VSharerBean bean) {
        setGuest(bean.getGuest());
        setGuestid(bean.getGuestid());
        setReservationroomid(bean.getReservationroomid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[v_sharer] "
                 + "\n - v_sharer.guest = " + (guest_is_initialized ? ("[" + (guest == null ? null : guest.toString()) + "]") : "not initialized") + ""
                 + "\n - v_sharer.guestid = " + (guestid_is_initialized ? ("[" + (guestid == null ? null : guestid.toString()) + "]") : "not initialized") + ""
                 + "\n - v_sharer.reservationroomid = " + (reservationroomid_is_initialized ? ("[" + (reservationroomid == null ? null : reservationroomid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
