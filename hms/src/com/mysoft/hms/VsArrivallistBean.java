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

public class VsArrivallistBean
// extends+ 

// extends- 
{
    private Long reservationid;
    private boolean reservationid_is_modified = false;
    private boolean reservationid_is_initialized = false;
    
    private String guestname;
    private boolean guestname_is_modified = false;
    private boolean guestname_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Double float8;
    private boolean float8_is_modified = false;
    private boolean float8_is_initialized = false;
    
    private java.sql.Timestamp arraivaldate;
    private boolean arraivaldate_is_modified = false;
    private boolean arraivaldate_is_initialized = false;
    
    private java.sql.Timestamp departuredate;
    private boolean departuredate_is_modified = false;
    private boolean departuredate_is_initialized = false;
    
    private String pax;
    private boolean pax_is_modified = false;
    private boolean pax_is_initialized = false;
    
    private String rtype;
    private boolean rtype_is_modified = false;
    private boolean rtype_is_initialized = false;
    
    private String company;
    private boolean company_is_modified = false;
    private boolean company_is_initialized = false;
    
    private String user;
    private boolean user_is_modified = false;
    private boolean user_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    VsArrivallistBean()
    {
    }
    
    /**
     * Getter method for reservationid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.reservationid
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
     * Getter method for guestname.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.guestname
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of guestname
     */
    public String getGuestname()
    {
        return guestname; 
    }

    /**
     * Setter method for guestname.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to guestname
     */
    public void setGuestname(String newVal) {
        if ((newVal != null && this.guestname != null && (newVal.compareTo(this.guestname) == 0)) || 
            (newVal == null && this.guestname == null && guestname_is_initialized)) {
            return; 
        } 
        this.guestname = newVal; 
        guestname_is_modified = true; 
        guestname_is_initialized = true; 
    }

    /**
     * Determines if the guestname has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isGuestnameModified() {
        return guestname_is_modified; 
    }

    /**
     * Determines if the guestname has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isGuestnameInitialized() {
        return guestname_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.name
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
     * Getter method for float8.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.float8
     * <li>column size: 17
     * <li>jdbc type returned by the driver: Types.DOUBLE
     * </ul>
     *
     * @return the value of float8
     */
    public Double getFloat8()
    {
        return float8; 
    }

    /**
     * Setter method for float8.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to float8
     */
    public void setFloat8(Double newVal) {
        if ((newVal != null && this.float8 != null && (newVal.compareTo(this.float8) == 0)) || 
            (newVal == null && this.float8 == null && float8_is_initialized)) {
            return; 
        } 
        this.float8 = newVal; 
        float8_is_modified = true; 
        float8_is_initialized = true; 
    }

    /**
     * Setter method for float8.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to float8
     */
    public void setFloat8(double newVal) {
        setFloat8(new Double(newVal));
    }

    /**
     * Determines if the float8 has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFloat8Modified() {
        return float8_is_modified; 
    }

    /**
     * Determines if the float8 has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFloat8Initialized() {
        return float8_is_initialized; 
    }

    /**
     * Getter method for arraivaldate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.arraivaldate
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
     * <li>full name: vs_arrivallist.departuredate
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
     * Getter method for pax.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.pax
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of pax
     */
    public String getPax()
    {
        return pax; 
    }

    /**
     * Setter method for pax.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to pax
     */
    public void setPax(String newVal) {
        if ((newVal != null && this.pax != null && (newVal.compareTo(this.pax) == 0)) || 
            (newVal == null && this.pax == null && pax_is_initialized)) {
            return; 
        } 
        this.pax = newVal; 
        pax_is_modified = true; 
        pax_is_initialized = true; 
    }

    /**
     * Determines if the pax has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPaxModified() {
        return pax_is_modified; 
    }

    /**
     * Determines if the pax has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPaxInitialized() {
        return pax_is_initialized; 
    }

    /**
     * Getter method for rtype.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.rtype
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of rtype
     */
    public String getRtype()
    {
        return rtype; 
    }

    /**
     * Setter method for rtype.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to rtype
     */
    public void setRtype(String newVal) {
        if ((newVal != null && this.rtype != null && (newVal.compareTo(this.rtype) == 0)) || 
            (newVal == null && this.rtype == null && rtype_is_initialized)) {
            return; 
        } 
        this.rtype = newVal; 
        rtype_is_modified = true; 
        rtype_is_initialized = true; 
    }

    /**
     * Determines if the rtype has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRtypeModified() {
        return rtype_is_modified; 
    }

    /**
     * Determines if the rtype has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRtypeInitialized() {
        return rtype_is_initialized; 
    }

    /**
     * Getter method for company.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.company
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of company
     */
    public String getCompany()
    {
        return company; 
    }

    /**
     * Setter method for company.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to company
     */
    public void setCompany(String newVal) {
        if ((newVal != null && this.company != null && (newVal.compareTo(this.company) == 0)) || 
            (newVal == null && this.company == null && company_is_initialized)) {
            return; 
        } 
        this.company = newVal; 
        company_is_modified = true; 
        company_is_initialized = true; 
    }

    /**
     * Determines if the company has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCompanyModified() {
        return company_is_modified; 
    }

    /**
     * Determines if the company has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCompanyInitialized() {
        return company_is_initialized; 
    }

    /**
     * Getter method for user.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: vs_arrivallist.user
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of user
     */
    public String getUser()
    {
        return user; 
    }

    /**
     * Setter method for user.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to user
     */
    public void setUser(String newVal) {
        if ((newVal != null && this.user != null && (newVal.compareTo(this.user) == 0)) || 
            (newVal == null && this.user == null && user_is_initialized)) {
            return; 
        } 
        this.user = newVal; 
        user_is_modified = true; 
        user_is_initialized = true; 
    }

    /**
     * Determines if the user has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isUserModified() {
        return user_is_modified; 
    }

    /**
     * Determines if the user has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isUserInitialized() {
        return user_is_initialized; 
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
		guestname_is_modified || 
		name_is_modified || 
		float8_is_modified || 
		arraivaldate_is_modified || 
		departuredate_is_modified || 
		pax_is_modified || 
		rtype_is_modified || 
		company_is_modified || 
		user_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        reservationid_is_modified = false;
        guestname_is_modified = false;
        name_is_modified = false;
        float8_is_modified = false;
        arraivaldate_is_modified = false;
        departuredate_is_modified = false;
        pax_is_modified = false;
        rtype_is_modified = false;
        company_is_modified = false;
        user_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(VsArrivallistBean bean) {
        setReservationid(bean.getReservationid());
        setGuestname(bean.getGuestname());
        setName(bean.getName());
        setFloat8(bean.getFloat8());
        setArraivaldate(bean.getArraivaldate());
        setDeparturedate(bean.getDeparturedate());
        setPax(bean.getPax());
        setRtype(bean.getRtype());
        setCompany(bean.getCompany());
        setUser(bean.getUser());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[vs_arrivallist] "
                 + "\n - vs_arrivallist.reservationid = " + (reservationid_is_initialized ? ("[" + (reservationid == null ? null : reservationid.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.guestname = " + (guestname_is_initialized ? ("[" + (guestname == null ? null : guestname.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.float8 = " + (float8_is_initialized ? ("[" + (float8 == null ? null : float8.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.arraivaldate = " + (arraivaldate_is_initialized ? ("[" + (arraivaldate == null ? null : arraivaldate.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.departuredate = " + (departuredate_is_initialized ? ("[" + (departuredate == null ? null : departuredate.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.pax = " + (pax_is_initialized ? ("[" + (pax == null ? null : pax.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.rtype = " + (rtype_is_initialized ? ("[" + (rtype == null ? null : rtype.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.company = " + (company_is_initialized ? ("[" + (company == null ? null : company.toString()) + "]") : "not initialized") + ""
                 + "\n - vs_arrivallist.user = " + (user_is_initialized ? ("[" + (user == null ? null : user.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}