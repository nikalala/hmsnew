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

public class TemplateBean
// extends+ 

// extends- 
{
    private Integer templateid;
    private boolean templateid_is_modified = false;
    private boolean templateid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Integer templatecategoryid;
    private boolean templatecategoryid_is_modified = false;
    private boolean templatecategoryid_is_initialized = false;
    
    private String subject;
    private boolean subject_is_modified = false;
    private boolean subject_is_initialized = false;
    
    private Integer personnelid;
    private boolean personnelid_is_modified = false;
    private boolean personnelid_is_initialized = false;
    
    private String cc;
    private boolean cc_is_modified = false;
    private boolean cc_is_initialized = false;
    
    private String bcc;
    private boolean bcc_is_modified = false;
    private boolean bcc_is_initialized = false;
    
    private String content;
    private boolean content_is_modified = false;
    private boolean content_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Boolean active;
    private boolean active_is_modified = false;
    private boolean active_is_initialized = false;
    
    private Boolean deleted;
    private boolean deleted_is_modified = false;
    private boolean deleted_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    TemplateBean()
    {
    }
    
    /**
     * Getter method for templateid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.templateid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of templateid
     */
    public Integer getTemplateid()
    {
        return templateid; 
    }

    /**
     * Setter method for templateid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to templateid
     */
    public void setTemplateid(Integer newVal) {
        if ((newVal != null && this.templateid != null && (newVal.compareTo(this.templateid) == 0)) || 
            (newVal == null && this.templateid == null && templateid_is_initialized)) {
            return; 
        } 
        this.templateid = newVal; 
        templateid_is_modified = true; 
        templateid_is_initialized = true; 
    }

    /**
     * Setter method for templateid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to templateid
     */
    public void setTemplateid(int newVal) {
        setTemplateid(new Integer(newVal));
    }

    /**
     * Determines if the templateid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTemplateidModified() {
        return templateid_is_modified; 
    }

    /**
     * Determines if the templateid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTemplateidInitialized() {
        return templateid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.name
     * <li>comments: დასახელება
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
     * Getter method for templatecategoryid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.templatecategoryid
     * <li> foreign key: templatecategory.templatecategoryid
     * <li>comments: შაბლონის კატეგორია
     * <li>column size: 10
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
     * Getter method for subject.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.subject
     * <li>comments: თემა
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of subject
     */
    public String getSubject()
    {
        return subject; 
    }

    /**
     * Setter method for subject.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to subject
     */
    public void setSubject(String newVal) {
        if ((newVal != null && this.subject != null && (newVal.compareTo(this.subject) == 0)) || 
            (newVal == null && this.subject == null && subject_is_initialized)) {
            return; 
        } 
        this.subject = newVal; 
        subject_is_modified = true; 
        subject_is_initialized = true; 
    }

    /**
     * Determines if the subject has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSubjectModified() {
        return subject_is_modified; 
    }

    /**
     * Determines if the subject has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSubjectInitialized() {
        return subject_is_initialized; 
    }

    /**
     * Getter method for personnelid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.personnelid
     * <li>comments: გამგზავნი ელ ფოსტის მისამართი
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of personnelid
     */
    public Integer getPersonnelid()
    {
        return personnelid; 
    }

    /**
     * Setter method for personnelid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to personnelid
     */
    public void setPersonnelid(Integer newVal) {
        if ((newVal != null && this.personnelid != null && (newVal.compareTo(this.personnelid) == 0)) || 
            (newVal == null && this.personnelid == null && personnelid_is_initialized)) {
            return; 
        } 
        this.personnelid = newVal; 
        personnelid_is_modified = true; 
        personnelid_is_initialized = true; 
    }

    /**
     * Setter method for personnelid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to personnelid
     */
    public void setPersonnelid(int newVal) {
        setPersonnelid(new Integer(newVal));
    }

    /**
     * Determines if the personnelid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPersonnelidModified() {
        return personnelid_is_modified; 
    }

    /**
     * Determines if the personnelid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPersonnelidInitialized() {
        return personnelid_is_initialized; 
    }

    /**
     * Getter method for cc.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.cc
     * <li>comments: CC
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of cc
     */
    public String getCc()
    {
        return cc; 
    }

    /**
     * Setter method for cc.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to cc
     */
    public void setCc(String newVal) {
        if ((newVal != null && this.cc != null && (newVal.compareTo(this.cc) == 0)) || 
            (newVal == null && this.cc == null && cc_is_initialized)) {
            return; 
        } 
        this.cc = newVal; 
        cc_is_modified = true; 
        cc_is_initialized = true; 
    }

    /**
     * Determines if the cc has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCcModified() {
        return cc_is_modified; 
    }

    /**
     * Determines if the cc has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCcInitialized() {
        return cc_is_initialized; 
    }

    /**
     * Getter method for bcc.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.bcc
     * <li>comments: BCC
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of bcc
     */
    public String getBcc()
    {
        return bcc; 
    }

    /**
     * Setter method for bcc.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to bcc
     */
    public void setBcc(String newVal) {
        if ((newVal != null && this.bcc != null && (newVal.compareTo(this.bcc) == 0)) || 
            (newVal == null && this.bcc == null && bcc_is_initialized)) {
            return; 
        } 
        this.bcc = newVal; 
        bcc_is_modified = true; 
        bcc_is_initialized = true; 
    }

    /**
     * Determines if the bcc has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isBccModified() {
        return bcc_is_modified; 
    }

    /**
     * Determines if the bcc has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isBccInitialized() {
        return bcc_is_initialized; 
    }

    /**
     * Getter method for content.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.content
     * <li>comments: შინაარსი
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of content
     */
    public String getContent()
    {
        return content; 
    }

    /**
     * Setter method for content.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to content
     */
    public void setContent(String newVal) {
        if ((newVal != null && this.content != null && (newVal.compareTo(this.content) == 0)) || 
            (newVal == null && this.content == null && content_is_initialized)) {
            return; 
        } 
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
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.regbyid
     * <li> foreign key: personnel.personnelid
     * <li>comments: ავტორი
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of regbyid
     */
    public Integer getRegbyid()
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
    public void setRegbyid(Integer newVal) {
        if ((newVal != null && this.regbyid != null && (newVal.compareTo(this.regbyid) == 0)) || 
            (newVal == null && this.regbyid == null && regbyid_is_initialized)) {
            return; 
        } 
        this.regbyid = newVal; 
        regbyid_is_modified = true; 
        regbyid_is_initialized = true; 
    }

    /**
     * Setter method for regbyid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to regbyid
     */
    public void setRegbyid(int newVal) {
        setRegbyid(new Integer(newVal));
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
     * Getter method for regdate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.regdate
     * <li>comments: რეგისტრაციის თარიღი
     * <li>default value: now()
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
     * Getter method for active.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.active
     * <li>comments: აქტიური
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of active
     */
    public Boolean getActive()
    {
        return active; 
    }

    /**
     * Setter method for active.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to active
     */
    public void setActive(Boolean newVal) {
        if ((newVal != null && this.active != null && newVal.equals(this.active)) || 
            (newVal == null && this.active == null && active_is_initialized)) {
            return; 
        } 
        this.active = newVal; 
        active_is_modified = true; 
        active_is_initialized = true; 
    }

    /**
     * Setter method for active.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to active
     */
    public void setActive(boolean newVal) {
        setActive(new Boolean(newVal));
    }

    /**
     * Determines if the active has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isActiveModified() {
        return active_is_modified; 
    }

    /**
     * Determines if the active has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isActiveInitialized() {
        return active_is_initialized; 
    }

    /**
     * Getter method for deleted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: template.deleted
     * <li>comments: წაშლილი
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
        return templateid_is_modified || 
		name_is_modified || 
		templatecategoryid_is_modified || 
		subject_is_modified || 
		personnelid_is_modified || 
		cc_is_modified || 
		bcc_is_modified || 
		content_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified || 
		deleted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        templateid_is_modified = false;
        name_is_modified = false;
        templatecategoryid_is_modified = false;
        subject_is_modified = false;
        personnelid_is_modified = false;
        cc_is_modified = false;
        bcc_is_modified = false;
        content_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        active_is_modified = false;
        deleted_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(TemplateBean bean) {
        setTemplateid(bean.getTemplateid());
        setName(bean.getName());
        setTemplatecategoryid(bean.getTemplatecategoryid());
        setSubject(bean.getSubject());
        setPersonnelid(bean.getPersonnelid());
        setCc(bean.getCc());
        setBcc(bean.getBcc());
        setContent(bean.getContent());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setActive(bean.getActive());
        setDeleted(bean.getDeleted());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[template] "
                 + "\n - template.templateid = " + (templateid_is_initialized ? ("[" + (templateid == null ? null : templateid.toString()) + "]") : "not initialized") + ""
                 + "\n - template.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - template.templatecategoryid = " + (templatecategoryid_is_initialized ? ("[" + (templatecategoryid == null ? null : templatecategoryid.toString()) + "]") : "not initialized") + ""
                 + "\n - template.subject = " + (subject_is_initialized ? ("[" + (subject == null ? null : subject.toString()) + "]") : "not initialized") + ""
                 + "\n - template.personnelid = " + (personnelid_is_initialized ? ("[" + (personnelid == null ? null : personnelid.toString()) + "]") : "not initialized") + ""
                 + "\n - template.cc = " + (cc_is_initialized ? ("[" + (cc == null ? null : cc.toString()) + "]") : "not initialized") + ""
                 + "\n - template.bcc = " + (bcc_is_initialized ? ("[" + (bcc == null ? null : bcc.toString()) + "]") : "not initialized") + ""
                 + "\n - template.content = " + (content_is_initialized ? ("[" + (content == null ? null : content.toString()) + "]") : "not initialized") + ""
                 + "\n - template.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - template.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - template.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
                 + "\n - template.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
