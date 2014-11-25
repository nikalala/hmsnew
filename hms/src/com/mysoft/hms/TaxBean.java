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


public class TaxBean
// extends+ 

// extends- 

{
    private Integer taxid;
    private boolean taxid_is_modified = false;
    private boolean taxid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private String code;
    private boolean code_is_modified = false;
    private boolean code_is_initialized = false;
    
    private java.util.Date startfrom;
    private boolean startfrom_is_modified = false;
    private boolean startfrom_is_initialized = false;
    
    private Integer exemptafter;
    private boolean exemptafter_is_modified = false;
    private boolean exemptafter_is_initialized = false;
    
    private Integer postingtype;
    private boolean postingtype_is_modified = false;
    private boolean postingtype_is_initialized = false;
    
    private Double amount;
    private boolean amount_is_modified = false;
    private boolean amount_is_initialized = false;
    
    private Boolean applybefore;
    private boolean applybefore_is_modified = false;
    private boolean applybefore_is_initialized = false;
    
    private Boolean applyonrate;
    private boolean applyonrate_is_modified = false;
    private boolean applyonrate_is_initialized = false;
    
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
    TaxBean()
    {
    }
    
    /**
     * Getter method for taxid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.taxid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of taxid
     */
    public Integer getTaxid()
    {
        return taxid; 
    }

    /**
     * Setter method for taxid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to taxid
     */
    public void setTaxid(Integer newVal) {
        if ((newVal != null && this.taxid != null && (newVal.compareTo(this.taxid) == 0)) || 
            (newVal == null && this.taxid == null && taxid_is_initialized)) {
            return; 
        } 
        this.taxid = newVal; 
        taxid_is_modified = true; 
        taxid_is_initialized = true; 
    }

    /**
     * Setter method for taxid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to taxid
     */
    public void setTaxid(int newVal) {
        setTaxid(new Integer(newVal));
    }

    /**
     * Determines if the taxid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTaxidModified() {
        return taxid_is_modified; 
    }

    /**
     * Determines if the taxid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTaxidInitialized() {
        return taxid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.name
     * <li>comments: ??????????
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
     * Getter method for code.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.code
     * <li>comments: ????? ??????????
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of code
     */
    public String getCode()
    {
        return code; 
    }

    /**
     * Setter method for code.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to code
     */
    public void setCode(String newVal) {
        if ((newVal != null && this.code != null && (newVal.compareTo(this.code) == 0)) || 
            (newVal == null && this.code == null && code_is_initialized)) {
            return; 
        } 
        this.code = newVal; 
        code_is_modified = true; 
        code_is_initialized = true; 
    }

    /**
     * Determines if the code has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCodeModified() {
        return code_is_modified; 
    }

    /**
     * Determines if the code has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCodeInitialized() {
        return code_is_initialized; 
    }

    /**
     * Getter method for startfrom.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.startfrom
     * <li>comments: ??????? ???????????
     * <li>column size: 13
     * <li>jdbc type returned by the driver: Types.DATE
     * </ul>
     *
     * @return the value of startfrom
     */
    public java.util.Date getStartfrom()
    {
        return startfrom; 
    }

    /**
     * Setter method for startfrom.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to startfrom
     */
    public void setStartfrom(java.util.Date newVal) {
        if ((newVal != null && this.startfrom != null && (newVal.compareTo(this.startfrom) == 0)) || 
            (newVal == null && this.startfrom == null && startfrom_is_initialized)) {
            return; 
        } 
        this.startfrom = newVal; 
        startfrom_is_modified = true; 
        startfrom_is_initialized = true; 
    }

    /**
     * Setter method for startfrom.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to startfrom
     */
    public void setStartfrom(long newVal) {
        setStartfrom(new java.util.Date(newVal));
    }

    /**
     * Determines if the startfrom has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isStartfromModified() {
        return startfrom_is_modified; 
    }

    /**
     * Determines if the startfrom has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isStartfromInitialized() {
        return startfrom_is_initialized; 
    }

    /**
     * Getter method for exemptafter.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.exemptafter
     * <li>comments: ??????? ???????????
     * <li>default value: 0
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of exemptafter
     */
    public Integer getExemptafter()
    {
        return exemptafter; 
    }

    /**
     * Setter method for exemptafter.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to exemptafter
     */
    public void setExemptafter(Integer newVal) {
        if ((newVal != null && this.exemptafter != null && (newVal.compareTo(this.exemptafter) == 0)) || 
            (newVal == null && this.exemptafter == null && exemptafter_is_initialized)) {
            return; 
        } 
        this.exemptafter = newVal; 
        exemptafter_is_modified = true; 
        exemptafter_is_initialized = true; 
    }

    /**
     * Setter method for exemptafter.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to exemptafter
     */
    public void setExemptafter(int newVal) {
        setExemptafter(new Integer(newVal));
    }

    /**
     * Determines if the exemptafter has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isExemptafterModified() {
        return exemptafter_is_modified; 
    }

    /**
     * Determines if the exemptafter has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isExemptafterInitialized() {
        return exemptafter_is_initialized; 
    }

    /**
     * Getter method for postingtype.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.postingtype
     * <li>comments: ????????? ????CODEtaxpostingtype
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of postingtype
     */
    public Integer getPostingtype()
    {
        return postingtype; 
    }

    /**
     * Setter method for postingtype.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to postingtype
     */
    public void setPostingtype(Integer newVal) {
        if ((newVal != null && this.postingtype != null && (newVal.compareTo(this.postingtype) == 0)) || 
            (newVal == null && this.postingtype == null && postingtype_is_initialized)) {
            return; 
        } 
        this.postingtype = newVal; 
        postingtype_is_modified = true; 
        postingtype_is_initialized = true; 
    }

    /**
     * Setter method for postingtype.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to postingtype
     */
    public void setPostingtype(int newVal) {
        setPostingtype(new Integer(newVal));
    }

    /**
     * Determines if the postingtype has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPostingtypeModified() {
        return postingtype_is_modified; 
    }

    /**
     * Determines if the postingtype has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPostingtypeInitialized() {
        return postingtype_is_initialized; 
    }

    /**
     * Getter method for amount.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.amount
     * <li>comments: ???????
     * <li>column size: 17
     * <li>jdbc type returned by the driver: Types.DOUBLE
     * </ul>
     *
     * @return the value of amount
     */
    public Double getAmount()
    {
        return amount; 
    }

    /**
     * Setter method for amount.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to amount
     */
    public void setAmount(Double newVal) {
        if ((newVal != null && this.amount != null && (newVal.compareTo(this.amount) == 0)) || 
            (newVal == null && this.amount == null && amount_is_initialized)) {
            return; 
        } 
        this.amount = newVal; 
        amount_is_modified = true; 
        amount_is_initialized = true; 
    }

    /**
     * Setter method for amount.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to amount
     */
    public void setAmount(double newVal) {
        setAmount(new Double(newVal));
    }

    /**
     * Determines if the amount has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAmountModified() {
        return amount_is_modified; 
    }

    /**
     * Determines if the amount has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAmountInitialized() {
        return amount_is_initialized; 
    }

    /**
     * Getter method for applybefore.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.applybefore
     * <li>comments: ???????? ??????????
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of applybefore
     */
    public Boolean getApplybefore()
    {
        return applybefore; 
    }

    /**
     * Setter method for applybefore.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to applybefore
     */
    public void setApplybefore(Boolean newVal) {
        if ((newVal != null && this.applybefore != null && newVal.equals(this.applybefore)) || 
            (newVal == null && this.applybefore == null && applybefore_is_initialized)) {
            return; 
        } 
        this.applybefore = newVal; 
        applybefore_is_modified = true; 
        applybefore_is_initialized = true; 
    }

    /**
     * Setter method for applybefore.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to applybefore
     */
    public void setApplybefore(boolean newVal) {
        setApplybefore(new Boolean(newVal));
    }

    /**
     * Determines if the applybefore has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isApplybeforeModified() {
        return applybefore_is_modified; 
    }

    /**
     * Determines if the applybefore has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isApplybeforeInitialized() {
        return applybefore_is_initialized; 
    }

    /**
     * Getter method for applyonrate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.applyonrate
     * <li>comments: ????? ????????
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of applyonrate
     */
    public Boolean getApplyonrate()
    {
        return applyonrate; 
    }

    /**
     * Setter method for applyonrate.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to applyonrate
     */
    public void setApplyonrate(Boolean newVal) {
        if ((newVal != null && this.applyonrate != null && newVal.equals(this.applyonrate)) || 
            (newVal == null && this.applyonrate == null && applyonrate_is_initialized)) {
            return; 
        } 
        this.applyonrate = newVal; 
        applyonrate_is_modified = true; 
        applyonrate_is_initialized = true; 
    }

    /**
     * Setter method for applyonrate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to applyonrate
     */
    public void setApplyonrate(boolean newVal) {
        setApplyonrate(new Boolean(newVal));
    }

    /**
     * Determines if the applyonrate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isApplyonrateModified() {
        return applyonrate_is_modified; 
    }

    /**
     * Determines if the applyonrate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isApplyonrateInitialized() {
        return applyonrate_is_initialized; 
    }

    /**
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tax.regbyid
     * <li> foreign key: personnel.personnelid
     * <li>comments: ??????
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
     * <li>full name: tax.regdate
     * <li>comments: ???????????? ??????
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
     * <li>full name: tax.active
     * <li>comments: ???????
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
     * <li>full name: tax.deleted
     * <li>comments: ???????
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
        return taxid_is_modified || 
		name_is_modified || 
		code_is_modified || 
		startfrom_is_modified || 
		exemptafter_is_modified || 
		postingtype_is_modified || 
		amount_is_modified || 
		applybefore_is_modified || 
		applyonrate_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified || 
		deleted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        taxid_is_modified = false;
        name_is_modified = false;
        code_is_modified = false;
        startfrom_is_modified = false;
        exemptafter_is_modified = false;
        postingtype_is_modified = false;
        amount_is_modified = false;
        applybefore_is_modified = false;
        applyonrate_is_modified = false;
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
    public void copy(TaxBean bean) {
        setTaxid(bean.getTaxid());
        setName(bean.getName());
        setCode(bean.getCode());
        setStartfrom(bean.getStartfrom());
        setExemptafter(bean.getExemptafter());
        setPostingtype(bean.getPostingtype());
        setAmount(bean.getAmount());
        setApplybefore(bean.getApplybefore());
        setApplyonrate(bean.getApplyonrate());
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
        return   "\n[tax] "
                 + "\n - tax.taxid = " + (taxid_is_initialized ? ("[" + (taxid == null ? null : taxid.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.code = " + (code_is_initialized ? ("[" + (code == null ? null : code.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.startfrom = " + (startfrom_is_initialized ? ("[" + (startfrom == null ? null : startfrom.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.exemptafter = " + (exemptafter_is_initialized ? ("[" + (exemptafter == null ? null : exemptafter.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.postingtype = " + (postingtype_is_initialized ? ("[" + (postingtype == null ? null : postingtype.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.amount = " + (amount_is_initialized ? ("[" + (amount == null ? null : amount.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.applybefore = " + (applybefore_is_initialized ? ("[" + (applybefore == null ? null : applybefore.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.applyonrate = " + (applyonrate_is_initialized ? ("[" + (applyonrate == null ? null : applyonrate.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
                 + "\n - tax.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}