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

public class TemplatesBean
// extends+ 

// extends- 
{
    private Integer templatesid;
    private boolean templatesid_is_modified = false;
    private boolean templatesid_is_initialized = false;
    
    private Integer templatecategoryid;
    private boolean templatecategoryid_is_modified = false;
    private boolean templatecategoryid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Boolean status;
    private boolean status_is_modified = false;
    private boolean status_is_initialized = false;
    
    private String note;
    private boolean note_is_modified = false;
    private boolean note_is_initialized = false;
    
    private byte[] content;
    private boolean content_is_modified = false;
    private boolean content_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    TemplatesBean()
    {
    }
    
    /**
     * Getter method for templatesid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templates.templatesid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of templatesid
     */
    public Integer getTemplatesid()
    {
        return templatesid; 
    }

    /**
     * Setter method for templatesid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to templatesid
     */
    public void setTemplatesid(Integer newVal) {
        if ((newVal != null && this.templatesid != null && (newVal.compareTo(this.templatesid) == 0)) || 
            (newVal == null && this.templatesid == null && templatesid_is_initialized)) {
            return; 
        } 
        this.templatesid = newVal; 
        templatesid_is_modified = true; 
        templatesid_is_initialized = true; 
    }

    /**
     * Setter method for templatesid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to templatesid
     */
    public void setTemplatesid(int newVal) {
        setTemplatesid(new Integer(newVal));
    }

    /**
     * Determines if the templatesid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTemplatesidModified() {
        return templatesid_is_modified; 
    }

    /**
     * Determines if the templatesid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTemplatesidInitialized() {
        return templatesid_is_initialized; 
    }

    /**
     * Getter method for templatecategoryid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templates.templatecategoryid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of templatecategoryid
     */
    public Integer getTemplatecategoryid()
    {
        return templatecategoryid; 
    }

    /**
     * Setter method for templatecategoryid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to templatecategoryid
     */
    public void setTemplatecategoryid(Integer newVal) {
        if ((newVal != null && this.templatecategoryid != null && (newVal.compareTo(this.templatecategoryid) == 0)) || 
            (newVal == null && this.templatecategoryid == null && templatecategoryid_is_initialized)) {
            return; 
        } 
        this.templatecategoryid = newVal; 
        templatecategoryid_is_modified = true; 
        templatecategoryid_is_initialized = true; 
    }

    /**
     * Setter method for templatecategoryid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to templatecategoryid
     */
    public void setTemplatecategoryid(int newVal) {
        setTemplatecategoryid(new Integer(newVal));
    }

    /**
     * Determines if the templatecategoryid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTemplatecategoryidModified() {
        return templatecategoryid_is_modified; 
    }

    /**
     * Determines if the templatecategoryid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTemplatecategoryidInitialized() {
        return templatecategoryid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templates.name
     * <li>column size: -1
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
     * Getter method for status.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templates.status
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of status
     */
    public Boolean getStatus()
    {
        return status; 
    }

    /**
     * Setter method for status.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to status
     */
    public void setStatus(Boolean newVal) {
        if ((newVal != null && this.status != null && newVal.equals(this.status)) || 
            (newVal == null && this.status == null && status_is_initialized)) {
            return; 
        } 
        this.status = newVal; 
        status_is_modified = true; 
        status_is_initialized = true; 
    }

    /**
     * Setter method for status.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to status
     */
    public void setStatus(boolean newVal) {
        setStatus(new Boolean(newVal));
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
     * <li>full name: templates.note
     * <li>column size: -1
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
     * Getter method for content.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: templates.content
     * <li>column size: -1
     * <li>jdbc type returned by the driver: Types.BINARY
     * </ul>
     *
     * @return the value of content
     */
    public byte[] getContent()
    {
        return content; 
    }

    /**
     * Setter method for content.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to content
     */
    public void setContent(byte[] newVal) {
        this.content = newVal; 
        content_is_modified = true; 
        content_is_initialized = true; 
    }

    /**
     * Determines if the content has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isContentModified() {
        return content_is_modified; 
    }

    /**
     * Determines if the content has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isContentInitialized() {
        return content_is_initialized; 
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
        return templatesid_is_modified || 
		templatecategoryid_is_modified || 
		name_is_modified || 
		status_is_modified || 
		note_is_modified || 
		content_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        templatesid_is_modified = false;
        templatecategoryid_is_modified = false;
        name_is_modified = false;
        status_is_modified = false;
        note_is_modified = false;
        content_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(TemplatesBean bean) {
        setTemplatesid(bean.getTemplatesid());
        setTemplatecategoryid(bean.getTemplatecategoryid());
        setName(bean.getName());
        setStatus(bean.getStatus());
        setNote(bean.getNote());
        setContent(bean.getContent());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[templates] "
                 + "\n - templates.templatesid = " + (templatesid_is_initialized ? ("[" + (templatesid == null ? null : templatesid.toString()) + "]") : "not initialized") + ""
                 + "\n - templates.templatecategoryid = " + (templatecategoryid_is_initialized ? ("[" + (templatecategoryid == null ? null : templatecategoryid.toString()) + "]") : "not initialized") + ""
                 + "\n - templates.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - templates.status = " + (status_is_initialized ? ("[" + (status == null ? null : status.toString()) + "]") : "not initialized") + ""
                 + "\n - templates.note = " + (note_is_initialized ? ("[" + (note == null ? null : note.toString()) + "]") : "not initialized") + ""
                 + "\n - templates.content = " + (content_is_initialized ? ("[" + (content == null ? null : content.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
