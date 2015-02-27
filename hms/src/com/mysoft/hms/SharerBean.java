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

public class SharerBean
// extends+ 

// extends- 
{
    private Long sharerid;
    private boolean sharerid_is_modified = false;
    private boolean sharerid_is_initialized = false;
    
    private Long reservationroomid;
    private boolean reservationroomid_is_modified = false;
    private boolean reservationroomid_is_initialized = false;
    
    private Long guestid;
    private boolean guestid_is_modified = false;
    private boolean guestid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    SharerBean()
    {
    }
    
    /**
     * Getter method for sharerid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: sharer.sharerid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of sharerid
     */
    public Long getSharerid()
    {
        return sharerid; 
    }

    /**
     * Setter method for sharerid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to sharerid
     */
    public void setSharerid(Long newVal) {
        if ((newVal != null && this.sharerid != null && (newVal.compareTo(this.sharerid) == 0)) || 
            (newVal == null && this.sharerid == null && sharerid_is_initialized)) {
            return; 
        } 
        this.sharerid = newVal; 
        sharerid_is_modified = true; 
        sharerid_is_initialized = true; 
    }

    /**
     * Setter method for sharerid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to sharerid
     */
    public void setSharerid(long newVal) {
        setSharerid(new Long(newVal));
    }

    /**
     * Determines if the sharerid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isShareridModified() {
        return sharerid_is_modified; 
    }

    /**
     * Determines if the sharerid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isShareridInitialized() {
        return sharerid_is_initialized; 
    }

    /**
     * Getter method for reservationroomid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: sharer.reservationroomid
     * <li> foreign key: reservationroom.reservationroomid
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
     * Getter method for guestid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: sharer.guestid
     * <li> foreign key: guest.guestid
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
        return sharerid_is_modified || 
		reservationroomid_is_modified || 
		guestid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        sharerid_is_modified = false;
        reservationroomid_is_modified = false;
        guestid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(SharerBean bean) {
        setSharerid(bean.getSharerid());
        setReservationroomid(bean.getReservationroomid());
        setGuestid(bean.getGuestid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[sharer] "
                 + "\n - sharer.sharerid = " + (sharerid_is_initialized ? ("[" + (sharerid == null ? null : sharerid.toString()) + "]") : "not initialized") + ""
                 + "\n - sharer.reservationroomid = " + (reservationroomid_is_initialized ? ("[" + (reservationroomid == null ? null : reservationroomid.toString()) + "]") : "not initialized") + ""
                 + "\n - sharer.guestid = " + (guestid_is_initialized ? ("[" + (guestid == null ? null : guestid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
