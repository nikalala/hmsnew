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

public class VTariffRoomtypeTarifftypeSeasonBean
// extends+ 

// extends- 
{
    private Integer tid;
    private boolean tid_is_modified = false;
    private boolean tid_is_initialized = false;
    
    private Integer rid;
    private boolean rid_is_modified = false;
    private boolean rid_is_initialized = false;
    
    private Integer sid;
    private boolean sid_is_modified = false;
    private boolean sid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    VTariffRoomtypeTarifftypeSeasonBean()
    {
    }
    
    /**
     * Getter method for tid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_tariff_roomtype_tarifftype_season.tid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of tid
     */
    public Integer getTid()
    {
        return tid; 
    }

    /**
     * Setter method for tid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to tid
     */
    public void setTid(Integer newVal) {
        if ((newVal != null && this.tid != null && (newVal.compareTo(this.tid) == 0)) || 
            (newVal == null && this.tid == null && tid_is_initialized)) {
            return; 
        } 
        this.tid = newVal; 
        tid_is_modified = true; 
        tid_is_initialized = true; 
    }

    /**
     * Setter method for tid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to tid
     */
    public void setTid(int newVal) {
        setTid(new Integer(newVal));
    }

    /**
     * Determines if the tid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTidModified() {
        return tid_is_modified; 
    }

    /**
     * Determines if the tid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTidInitialized() {
        return tid_is_initialized; 
    }

    /**
     * Getter method for rid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_tariff_roomtype_tarifftype_season.rid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of rid
     */
    public Integer getRid()
    {
        return rid; 
    }

    /**
     * Setter method for rid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to rid
     */
    public void setRid(Integer newVal) {
        if ((newVal != null && this.rid != null && (newVal.compareTo(this.rid) == 0)) || 
            (newVal == null && this.rid == null && rid_is_initialized)) {
            return; 
        } 
        this.rid = newVal; 
        rid_is_modified = true; 
        rid_is_initialized = true; 
    }

    /**
     * Setter method for rid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to rid
     */
    public void setRid(int newVal) {
        setRid(new Integer(newVal));
    }

    /**
     * Determines if the rid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRidModified() {
        return rid_is_modified; 
    }

    /**
     * Determines if the rid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRidInitialized() {
        return rid_is_initialized; 
    }

    /**
     * Getter method for sid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_tariff_roomtype_tarifftype_season.sid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of sid
     */
    public Integer getSid()
    {
        return sid; 
    }

    /**
     * Setter method for sid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to sid
     */
    public void setSid(Integer newVal) {
        if ((newVal != null && this.sid != null && (newVal.compareTo(this.sid) == 0)) || 
            (newVal == null && this.sid == null && sid_is_initialized)) {
            return; 
        } 
        this.sid = newVal; 
        sid_is_modified = true; 
        sid_is_initialized = true; 
    }

    /**
     * Setter method for sid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to sid
     */
    public void setSid(int newVal) {
        setSid(new Integer(newVal));
    }

    /**
     * Determines if the sid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSidModified() {
        return sid_is_modified; 
    }

    /**
     * Determines if the sid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSidInitialized() {
        return sid_is_initialized; 
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
        return tid_is_modified || 
		rid_is_modified || 
		sid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        tid_is_modified = false;
        rid_is_modified = false;
        sid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(VTariffRoomtypeTarifftypeSeasonBean bean) {
        setTid(bean.getTid());
        setRid(bean.getRid());
        setSid(bean.getSid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[v_tariff_roomtype_tarifftype_season] "
                 + "\n - v_tariff_roomtype_tarifftype_season.tid = " + (tid_is_initialized ? ("[" + (tid == null ? null : tid.toString()) + "]") : "not initialized") + ""
                 + "\n - v_tariff_roomtype_tarifftype_season.rid = " + (rid_is_initialized ? ("[" + (rid == null ? null : rid.toString()) + "]") : "not initialized") + ""
                 + "\n - v_tariff_roomtype_tarifftype_season.sid = " + (sid_is_initialized ? ("[" + (sid == null ? null : sid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
