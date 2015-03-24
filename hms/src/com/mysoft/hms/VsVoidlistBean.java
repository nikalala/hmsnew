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


public class VsVoidlistBean
// extends+ 

// extends- 

{
    private Long reservationid;
    private boolean reservationid_is_modified = false;
    private boolean reservationid_is_initialized = false;
    
    private String guest;
    private boolean guest_is_modified = false;
    private boolean guest_is_initialized = false;
    
    private java.sql.Timestamp arraivaldate;
    private boolean arraivaldate_is_modified = false;
    private boolean arraivaldate_is_initialized = false;
    
    private java.sql.Timestamp departuredate;
    private boolean departuredate_is_modified = false;
    private boolean departuredate_is_initialized = false;
    
    private String num;
    private boolean num_is_modified = false;
    private boolean num_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private String loginid;
    private boolean loginid_is_modified = false;
    private boolean loginid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private String remark;
    private boolean remark_is_modified = false;
    private boolean remark_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    VsVoidlistBean()
    {
    }
    
    /**
     * Getter method for reservationid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.reservationid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of reservationid
     */
    public Long getReservationid()
    {
        return reservationid; 
    }

    /**
     * Setter method for reservationid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to reservationid
     */
    public void setReservationid(Long newVal) {
        if ((newVal != null && this.reservationid != null && (newVal.compareTo(this.reservationid) == 0)) || 
            (newVal == null && this.reservationid == null && reservationid_is_initialized)) {
            return; 
        } 
        this.reservationid = newVal; 
        reservationid_is_modified = true; 
        reservationid_is_initialized = true; 
    }

    /**
     * Setter method for reservationid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to reservationid
     */
    public void setReservationid(long newVal) {
        setReservationid(new Long(newVal));
    }

    /**
     * Determines if the reservationid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isReservationidModified() {
        return reservationid_is_modified; 
    }

    /**
     * Determines if the reservationid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isReservationidInitialized() {
        return reservationid_is_initialized; 
    }

    /**
     * Getter method for guest.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.guest
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
     * Getter method for arraivaldate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.arraivaldate
     * <li>column size: 29
     * <li>jdbc type returned by the driver: Types.TIMESTAMP
     * </ul>
     *
     * @return the value of arraivaldate
     */
    public java.sql.Timestamp getArraivaldate()
    {
        return arraivaldate; 
    }

    /**
     * Setter method for arraivaldate.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to arraivaldate
     */
    public void setArraivaldate(java.sql.Timestamp newVal) {
        if ((newVal != null && this.arraivaldate != null && (newVal.compareTo(this.arraivaldate) == 0)) || 
            (newVal == null && this.arraivaldate == null && arraivaldate_is_initialized)) {
            return; 
        } 
        this.arraivaldate = newVal; 
        arraivaldate_is_modified = true; 
        arraivaldate_is_initialized = true; 
    }

    /**
     * Setter method for arraivaldate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to arraivaldate
     */
    public void setArraivaldate(long newVal) {
        setArraivaldate(new java.sql.Timestamp(newVal));
    }

    /**
     * Determines if the arraivaldate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isArraivaldateModified() {
        return arraivaldate_is_modified; 
    }

    /**
     * Determines if the arraivaldate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isArraivaldateInitialized() {
        return arraivaldate_is_initialized; 
    }

    /**
     * Getter method for departuredate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.departuredate
     * <li>column size: 29
     * <li>jdbc type returned by the driver: Types.TIMESTAMP
     * </ul>
     *
     * @return the value of departuredate
     */
    public java.sql.Timestamp getDeparturedate()
    {
        return departuredate; 
    }

    /**
     * Setter method for departuredate.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to departuredate
     */
    public void setDeparturedate(java.sql.Timestamp newVal) {
        if ((newVal != null && this.departuredate != null && (newVal.compareTo(this.departuredate) == 0)) || 
            (newVal == null && this.departuredate == null && departuredate_is_initialized)) {
            return; 
        } 
        this.departuredate = newVal; 
        departuredate_is_modified = true; 
        departuredate_is_initialized = true; 
    }

    /**
     * Setter method for departuredate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to departuredate
     */
    public void setDeparturedate(long newVal) {
        setDeparturedate(new java.sql.Timestamp(newVal));
    }

    /**
     * Determines if the departuredate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDeparturedateModified() {
        return departuredate_is_modified; 
    }

    /**
     * Determines if the departuredate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDeparturedateInitialized() {
        return departuredate_is_initialized; 
    }

    /**
     * Getter method for num.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.num
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of num
     */
    public String getNum()
    {
        return num; 
    }

    /**
     * Setter method for num.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to num
     */
    public void setNum(String newVal) {
        if ((newVal != null && this.num != null && (newVal.compareTo(this.num) == 0)) || 
            (newVal == null && this.num == null && num_is_initialized)) {
            return; 
        } 
        this.num = newVal; 
        num_is_modified = true; 
        num_is_initialized = true; 
    }

    /**
     * Determines if the num has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isNumModified() {
        return num_is_modified; 
    }

    /**
     * Determines if the num has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isNumInitialized() {
        return num_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.name
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
     * Getter method for loginid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.loginid
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
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.regdate
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
     * Getter method for remark.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_voidlist.remark
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of remark
     */
    public String getRemark()
    {
        return remark; 
    }

    /**
     * Setter method for remark.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to remark
     */
    public void setRemark(String newVal) {
        if ((newVal != null && this.remark != null && (newVal.compareTo(this.remark) == 0)) || 
            (newVal == null && this.remark == null && remark_is_initialized)) {
            return; 
        } 
        this.remark = newVal; 
        remark_is_modified = true; 
        remark_is_initialized = true; 
    }

    /**
     * Determines if the remark has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRemarkModified() {
        return remark_is_modified; 
    }

    /**
     * Determines if the remark has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRemarkInitialized() {
        return remark_is_initialized; 
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
        return reservationid_is_modified || 
		guest_is_modified || 
		arraivaldate_is_modified || 
		departuredate_is_modified || 
		num_is_modified || 
		name_is_modified || 
		loginid_is_modified || 
		regdate_is_modified || 
		remark_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        reservationid_is_modified = false;
        guest_is_modified = false;
        arraivaldate_is_modified = false;
        departuredate_is_modified = false;
        num_is_modified = false;
        name_is_modified = false;
        loginid_is_modified = false;
        regdate_is_modified = false;
        remark_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(VsVoidlistBean bean) {
        setReservationid(bean.getReservationid());
        setGuest(bean.getGuest());
        setArraivaldate(bean.getArraivaldate());
        setDeparturedate(bean.getDeparturedate());
        setNum(bean.getNum());
        setName(bean.getName());
        setLoginid(bean.getLoginid());
        setRegdate(bean.getRegdate());
        setRemark(bean.getRemark());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[vs_voidlist] "
                 + "\n - vs_voidlist.reservationid = " + (reservationid_is_initialized ? ("[" + (reservationid == null ? null : reservationid.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.guest = " + (guest_is_initialized ? ("[" + (guest == null ? null : guest.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.arraivaldate = " + (arraivaldate_is_initialized ? ("[" + (arraivaldate == null ? null : arraivaldate.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.departuredate = " + (departuredate_is_initialized ? ("[" + (departuredate == null ? null : departuredate.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.num = " + (num_is_initialized ? ("[" + (num == null ? null : num.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.loginid = " + (loginid_is_initialized ? ("[" + (loginid == null ? null : loginid.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_voidlist.remark = " + (remark_is_initialized ? ("[" + (remark == null ? null : remark.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}