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


public class RemarksBean
// extends+ 

// extends- 

{
    private Integer remarkid;
    private boolean remarkid_is_modified = false;
    private boolean remarkid_is_initialized = false;
    
    private String remark;
    private boolean remark_is_modified = false;
    private boolean remark_is_initialized = false;
    
    private Integer roomid;
    private boolean roomid_is_modified = false;
    private boolean roomid_is_initialized = false;
    
    private Integer houseunitid;
    private boolean houseunitid_is_modified = false;
    private boolean houseunitid_is_initialized = false;
    
    private java.sql.Timestamp recdate;
    private boolean recdate_is_modified = false;
    private boolean recdate_is_initialized = false;
    
    private Boolean deleted;
    private boolean deleted_is_modified = false;
    private boolean deleted_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    RemarksBean()
    {
    }
    
    /**
     * Getter method for remarkid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: remarks.remarkid
     * <li>default value: nextval('remarks_remarkid_seq'::regclass)
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of remarkid
     */
    public Integer getRemarkid()
    {
        return remarkid; 
    }

    /**
     * Setter method for remarkid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to remarkid
     */
    public void setRemarkid(Integer newVal) {
        if ((newVal != null && this.remarkid != null && (newVal.compareTo(this.remarkid) == 0)) || 
            (newVal == null && this.remarkid == null && remarkid_is_initialized)) {
            return; 
        } 
        this.remarkid = newVal; 
        remarkid_is_modified = true; 
        remarkid_is_initialized = true; 
    }

    /**
     * Setter method for remarkid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to remarkid
     */
    public void setRemarkid(int newVal) {
        setRemarkid(new Integer(newVal));
    }

    /**
     * Determines if the remarkid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRemarkidModified() {
        return remarkid_is_modified; 
    }

    /**
     * Determines if the remarkid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRemarkidInitialized() {
        return remarkid_is_initialized; 
    }

    /**
     * Getter method for remark.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: remarks.remark
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
     * Getter method for roomid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: remarks.roomid
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
     * Getter method for houseunitid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: remarks.houseunitid
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
     * Getter method for recdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: remarks.recdate
     * <li>default value: now()
     * <li>column size: 35
     * <li>jdbc type returned by the driver: Types.TIMESTAMP
     * </ul>
     *
     * @return the value of recdate
     */
    public java.sql.Timestamp getRecdate()
    {
        return recdate; 
    }

    /**
     * Setter method for recdate.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to recdate
     */
    public void setRecdate(java.sql.Timestamp newVal) {
        if ((newVal != null && this.recdate != null && (newVal.compareTo(this.recdate) == 0)) || 
            (newVal == null && this.recdate == null && recdate_is_initialized)) {
            return; 
        } 
        this.recdate = newVal; 
        recdate_is_modified = true; 
        recdate_is_initialized = true; 
    }

    /**
     * Setter method for recdate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to recdate
     */
    public void setRecdate(long newVal) {
        setRecdate(new java.sql.Timestamp(newVal));
    }

    /**
     * Determines if the recdate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRecdateModified() {
        return recdate_is_modified; 
    }

    /**
     * Determines if the recdate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRecdateInitialized() {
        return recdate_is_initialized; 
    }

    /**
     * Getter method for deleted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: remarks.deleted
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of deleted
     */
    public Boolean getDeleted()
    {
        return deleted; 
    }

    /**
     * Setter method for deleted.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to deleted
     */
    public void setDeleted(Boolean newVal) {
        if ((newVal != null && this.deleted != null && newVal.equals(this.deleted)) || 
            (newVal == null && this.deleted == null && deleted_is_initialized)) {
            return; 
        } 
        this.deleted = newVal; 
        deleted_is_modified = true; 
        deleted_is_initialized = true; 
    }

    /**
     * Setter method for deleted.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to deleted
     */
    public void setDeleted(boolean newVal) {
        setDeleted(new Boolean(newVal));
    }

    /**
     * Determines if the deleted has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDeletedModified() {
        return deleted_is_modified; 
    }

    /**
     * Determines if the deleted has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDeletedInitialized() {
        return deleted_is_initialized; 
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
        return remarkid_is_modified || 
		remark_is_modified || 
		roomid_is_modified || 
		houseunitid_is_modified || 
		recdate_is_modified || 
		deleted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        remarkid_is_modified = false;
        remark_is_modified = false;
        roomid_is_modified = false;
        houseunitid_is_modified = false;
        recdate_is_modified = false;
        deleted_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(RemarksBean bean) {
        setRemarkid(bean.getRemarkid());
        setRemark(bean.getRemark());
        setRoomid(bean.getRoomid());
        setHouseunitid(bean.getHouseunitid());
        setRecdate(bean.getRecdate());
        setDeleted(bean.getDeleted());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[remarks] "
                 + "\n - remarks.remarkid = " + (remarkid_is_initialized ? ("[" + (remarkid == null ? null : remarkid.toString()) + "]") : "not initialized") + ""
                 + "\n - remarks.remark = " + (remark_is_initialized ? ("[" + (remark == null ? null : remark.toString()) + "]") : "not initialized") + ""
                 + "\n - remarks.roomid = " + (roomid_is_initialized ? ("[" + (roomid == null ? null : roomid.toString()) + "]") : "not initialized") + ""
                 + "\n - remarks.houseunitid = " + (houseunitid_is_initialized ? ("[" + (houseunitid == null ? null : houseunitid.toString()) + "]") : "not initialized") + ""
                 + "\n - remarks.recdate = " + (recdate_is_initialized ? ("[" + (recdate == null ? null : recdate.toString()) + "]") : "not initialized") + ""
                 + "\n - remarks.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
