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


public class WorkorderlogBean
// extends+ 

// extends- 

{
    private Integer workorderlogid;
    private boolean workorderlogid_is_modified = false;
    private boolean workorderlogid_is_initialized = false;
    
    private Integer workorderid;
    private boolean workorderid_is_modified = false;
    private boolean workorderid_is_initialized = false;
    
    private String category;
    private boolean category_is_modified = false;
    private boolean category_is_initialized = false;
    
    private String priority;
    private boolean priority_is_modified = false;
    private boolean priority_is_initialized = false;
    
    private String assignedto;
    private boolean assignedto_is_modified = false;
    private boolean assignedto_is_initialized = false;
    
    private String status;
    private boolean status_is_modified = false;
    private boolean status_is_initialized = false;
    
    private String note;
    private boolean note_is_modified = false;
    private boolean note_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private String regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private String room;
    private boolean room_is_modified = false;
    private boolean room_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    WorkorderlogBean()
    {
    }
    
    /**
     * Getter method for workorderlogid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.workorderlogid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of workorderlogid
     */
    public Integer getWorkorderlogid()
    {
        return workorderlogid; 
    }

    /**
     * Setter method for workorderlogid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to workorderlogid
     */
    public void setWorkorderlogid(Integer newVal) {
        if ((newVal != null && this.workorderlogid != null && (newVal.compareTo(this.workorderlogid) == 0)) || 
            (newVal == null && this.workorderlogid == null && workorderlogid_is_initialized)) {
            return; 
        } 
        this.workorderlogid = newVal; 
        workorderlogid_is_modified = true; 
        workorderlogid_is_initialized = true; 
    }

    /**
     * Setter method for workorderlogid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to workorderlogid
     */
    public void setWorkorderlogid(int newVal) {
        setWorkorderlogid(new Integer(newVal));
    }

    /**
     * Determines if the workorderlogid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isWorkorderlogidModified() {
        return workorderlogid_is_modified; 
    }

    /**
     * Determines if the workorderlogid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isWorkorderlogidInitialized() {
        return workorderlogid_is_initialized; 
    }

    /**
     * Getter method for workorderid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.workorderid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of workorderid
     */
    public Integer getWorkorderid()
    {
        return workorderid; 
    }

    /**
     * Setter method for workorderid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to workorderid
     */
    public void setWorkorderid(Integer newVal) {
        if ((newVal != null && this.workorderid != null && (newVal.compareTo(this.workorderid) == 0)) || 
            (newVal == null && this.workorderid == null && workorderid_is_initialized)) {
            return; 
        } 
        this.workorderid = newVal; 
        workorderid_is_modified = true; 
        workorderid_is_initialized = true; 
    }

    /**
     * Setter method for workorderid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to workorderid
     */
    public void setWorkorderid(int newVal) {
        setWorkorderid(new Integer(newVal));
    }

    /**
     * Determines if the workorderid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isWorkorderidModified() {
        return workorderid_is_modified; 
    }

    /**
     * Determines if the workorderid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isWorkorderidInitialized() {
        return workorderid_is_initialized; 
    }

    /**
     * Getter method for category.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.category
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of category
     */
    public String getCategory()
    {
        return category; 
    }

    /**
     * Setter method for category.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to category
     */
    public void setCategory(String newVal) {
        if ((newVal != null && this.category != null && (newVal.compareTo(this.category) == 0)) || 
            (newVal == null && this.category == null && category_is_initialized)) {
            return; 
        } 
        this.category = newVal; 
        category_is_modified = true; 
        category_is_initialized = true; 
    }

    /**
     * Determines if the category has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCategoryModified() {
        return category_is_modified; 
    }

    /**
     * Determines if the category has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCategoryInitialized() {
        return category_is_initialized; 
    }

    /**
     * Getter method for priority.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.priority
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of priority
     */
    public String getPriority()
    {
        return priority; 
    }

    /**
     * Setter method for priority.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to priority
     */
    public void setPriority(String newVal) {
        if ((newVal != null && this.priority != null && (newVal.compareTo(this.priority) == 0)) || 
            (newVal == null && this.priority == null && priority_is_initialized)) {
            return; 
        } 
        this.priority = newVal; 
        priority_is_modified = true; 
        priority_is_initialized = true; 
    }

    /**
     * Determines if the priority has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPriorityModified() {
        return priority_is_modified; 
    }

    /**
     * Determines if the priority has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPriorityInitialized() {
        return priority_is_initialized; 
    }

    /**
     * Getter method for assignedto.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.assignedto
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of assignedto
     */
    public String getAssignedto()
    {
        return assignedto; 
    }

    /**
     * Setter method for assignedto.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to assignedto
     */
    public void setAssignedto(String newVal) {
        if ((newVal != null && this.assignedto != null && (newVal.compareTo(this.assignedto) == 0)) || 
            (newVal == null && this.assignedto == null && assignedto_is_initialized)) {
            return; 
        } 
        this.assignedto = newVal; 
        assignedto_is_modified = true; 
        assignedto_is_initialized = true; 
    }

    /**
     * Determines if the assignedto has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAssignedtoModified() {
        return assignedto_is_modified; 
    }

    /**
     * Determines if the assignedto has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAssignedtoInitialized() {
        return assignedto_is_initialized; 
    }

    /**
     * Getter method for status.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.status
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of status
     */
    public String getStatus()
    {
        return status; 
    }

    /**
     * Setter method for status.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to status
     */
    public void setStatus(String newVal) {
        if ((newVal != null && this.status != null && (newVal.compareTo(this.status) == 0)) || 
            (newVal == null && this.status == null && status_is_initialized)) {
            return; 
        } 
        this.status = newVal; 
        status_is_modified = true; 
        status_is_initialized = true; 
    }

    /**
     * Determines if the status has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isStatusModified() {
        return status_is_modified; 
    }

    /**
     * Determines if the status has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isStatusInitialized() {
        return status_is_initialized; 
    }

    /**
     * Getter method for note.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.note
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of note
     */
    public String getNote()
    {
        return note; 
    }

    /**
     * Setter method for note.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to note
     */
    public void setNote(String newVal) {
        if ((newVal != null && this.note != null && (newVal.compareTo(this.note) == 0)) || 
            (newVal == null && this.note == null && note_is_initialized)) {
            return; 
        } 
        this.note = newVal; 
        note_is_modified = true; 
        note_is_initialized = true; 
    }

    /**
     * Determines if the note has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isNoteModified() {
        return note_is_modified; 
    }

    /**
     * Determines if the note has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isNoteInitialized() {
        return note_is_initialized; 
    }

    /**
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.regdate
     * <li>default value: now()
     * <li>column size: 35
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
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.regbyid
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of regbyid
     */
    public String getRegbyid()
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
    public void setRegbyid(String newVal) {
        if ((newVal != null && this.regbyid != null && (newVal.compareTo(this.regbyid) == 0)) || 
            (newVal == null && this.regbyid == null && regbyid_is_initialized)) {
            return; 
        } 
        this.regbyid = newVal; 
        regbyid_is_modified = true; 
        regbyid_is_initialized = true; 
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
     * Getter method for room.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: workorderlog.room
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of room
     */
    public String getRoom()
    {
        return room; 
    }

    /**
     * Setter method for room.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to room
     */
    public void setRoom(String newVal) {
        if ((newVal != null && this.room != null && (newVal.compareTo(this.room) == 0)) || 
            (newVal == null && this.room == null && room_is_initialized)) {
            return; 
        } 
        this.room = newVal; 
        room_is_modified = true; 
        room_is_initialized = true; 
    }

    /**
     * Determines if the room has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomModified() {
        return room_is_modified; 
    }

    /**
     * Determines if the room has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomInitialized() {
        return room_is_initialized; 
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
        return workorderlogid_is_modified || 
		workorderid_is_modified || 
		category_is_modified || 
		priority_is_modified || 
		assignedto_is_modified || 
		status_is_modified || 
		note_is_modified || 
		regdate_is_modified || 
		regbyid_is_modified || 
		room_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        workorderlogid_is_modified = false;
        workorderid_is_modified = false;
        category_is_modified = false;
        priority_is_modified = false;
        assignedto_is_modified = false;
        status_is_modified = false;
        note_is_modified = false;
        regdate_is_modified = false;
        regbyid_is_modified = false;
        room_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(WorkorderlogBean bean) {
        setWorkorderlogid(bean.getWorkorderlogid());
        setWorkorderid(bean.getWorkorderid());
        setCategory(bean.getCategory());
        setPriority(bean.getPriority());
        setAssignedto(bean.getAssignedto());
        setStatus(bean.getStatus());
        setNote(bean.getNote());
        setRegdate(bean.getRegdate());
        setRegbyid(bean.getRegbyid());
        setRoom(bean.getRoom());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[workorderlog] "
                 + "\n - workorderlog.workorderlogid = " + (workorderlogid_is_initialized ? ("[" + (workorderlogid == null ? null : workorderlogid.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.workorderid = " + (workorderid_is_initialized ? ("[" + (workorderid == null ? null : workorderid.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.category = " + (category_is_initialized ? ("[" + (category == null ? null : category.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.priority = " + (priority_is_initialized ? ("[" + (priority == null ? null : priority.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.assignedto = " + (assignedto_is_initialized ? ("[" + (assignedto == null ? null : assignedto.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.status = " + (status_is_initialized ? ("[" + (status == null ? null : status.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.note = " + (note_is_initialized ? ("[" + (note == null ? null : note.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - workorderlog.room = " + (room_is_initialized ? ("[" + (room == null ? null : room.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
