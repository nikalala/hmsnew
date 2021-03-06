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


public class PaymentBean
// extends+ 

// extends- 

{
    private Long paymentid;
    private boolean paymentid_is_modified = false;
    private boolean paymentid_is_initialized = false;
    
    private Integer paymentmethodid;
    private boolean paymentmethodid_is_modified = false;
    private boolean paymentmethodid_is_initialized = false;
    
    private Integer currencyid;
    private boolean currencyid_is_modified = false;
    private boolean currencyid_is_initialized = false;
    
    private Double amount;
    private boolean amount_is_modified = false;
    private boolean amount_is_initialized = false;
    
    private java.util.Date paydate;
    private boolean paydate_is_modified = false;
    private boolean paydate_is_initialized = false;
    
    private Long folioid;
    private boolean folioid_is_modified = false;
    private boolean folioid_is_initialized = false;
    
    private String voucherno;
    private boolean voucherno_is_modified = false;
    private boolean voucherno_is_initialized = false;
    
    private String note;
    private boolean note_is_modified = false;
    private boolean note_is_initialized = false;
    
    private Boolean deleted;
    private boolean deleted_is_modified = false;
    private boolean deleted_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Long contracgentid;
    private boolean contracgentid_is_modified = false;
    private boolean contracgentid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    PaymentBean()
    {
    }
    
    /**
     * Getter method for paymentid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.paymentid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of paymentid
     */
    public Long getPaymentid()
    {
        return paymentid; 
    }

    /**
     * Setter method for paymentid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to paymentid
     */
    public void setPaymentid(Long newVal) {
        if ((newVal != null && this.paymentid != null && (newVal.compareTo(this.paymentid) == 0)) || 
            (newVal == null && this.paymentid == null && paymentid_is_initialized)) {
            return; 
        } 
        this.paymentid = newVal; 
        paymentid_is_modified = true; 
        paymentid_is_initialized = true; 
    }

    /**
     * Setter method for paymentid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to paymentid
     */
    public void setPaymentid(long newVal) {
        setPaymentid(new Long(newVal));
    }

    /**
     * Determines if the paymentid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPaymentidModified() {
        return paymentid_is_modified; 
    }

    /**
     * Determines if the paymentid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPaymentidInitialized() {
        return paymentid_is_initialized; 
    }

    /**
     * Getter method for paymentmethodid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.paymentmethodid
     * <li> foreign key: paymentmethod.paymentmethodid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of paymentmethodid
     */
    public Integer getPaymentmethodid()
    {
        return paymentmethodid; 
    }

    /**
     * Setter method for paymentmethodid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to paymentmethodid
     */
    public void setPaymentmethodid(Integer newVal) {
        if ((newVal != null && this.paymentmethodid != null && (newVal.compareTo(this.paymentmethodid) == 0)) || 
            (newVal == null && this.paymentmethodid == null && paymentmethodid_is_initialized)) {
            return; 
        } 
        this.paymentmethodid = newVal; 
        paymentmethodid_is_modified = true; 
        paymentmethodid_is_initialized = true; 
    }

    /**
     * Setter method for paymentmethodid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to paymentmethodid
     */
    public void setPaymentmethodid(int newVal) {
        setPaymentmethodid(new Integer(newVal));
    }

    /**
     * Determines if the paymentmethodid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPaymentmethodidModified() {
        return paymentmethodid_is_modified; 
    }

    /**
     * Determines if the paymentmethodid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPaymentmethodidInitialized() {
        return paymentmethodid_is_initialized; 
    }

    /**
     * Getter method for currencyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.currencyid
     * <li> foreign key: currency.currencyid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of currencyid
     */
    public Integer getCurrencyid()
    {
        return currencyid; 
    }

    /**
     * Setter method for currencyid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to currencyid
     */
    public void setCurrencyid(Integer newVal) {
        if ((newVal != null && this.currencyid != null && (newVal.compareTo(this.currencyid) == 0)) || 
            (newVal == null && this.currencyid == null && currencyid_is_initialized)) {
            return; 
        } 
        this.currencyid = newVal; 
        currencyid_is_modified = true; 
        currencyid_is_initialized = true; 
    }

    /**
     * Setter method for currencyid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to currencyid
     */
    public void setCurrencyid(int newVal) {
        setCurrencyid(new Integer(newVal));
    }

    /**
     * Determines if the currencyid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCurrencyidModified() {
        return currencyid_is_modified; 
    }

    /**
     * Determines if the currencyid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCurrencyidInitialized() {
        return currencyid_is_initialized; 
    }

    /**
     * Getter method for amount.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.amount
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
     * Getter method for paydate.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.paydate
     * <li>column size: 13
     * <li>jdbc type returned by the driver: Types.DATE
     * </ul>
     *
     * @return the value of paydate
     */
    public java.util.Date getPaydate()
    {
        return paydate; 
    }

    /**
     * Setter method for paydate.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to paydate
     */
    public void setPaydate(java.util.Date newVal) {
        if ((newVal != null && this.paydate != null && (newVal.compareTo(this.paydate) == 0)) || 
            (newVal == null && this.paydate == null && paydate_is_initialized)) {
            return; 
        } 
        this.paydate = newVal; 
        paydate_is_modified = true; 
        paydate_is_initialized = true; 
    }

    /**
     * Setter method for paydate.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to paydate
     */
    public void setPaydate(long newVal) {
        setPaydate(new java.util.Date(newVal));
    }

    /**
     * Determines if the paydate has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPaydateModified() {
        return paydate_is_modified; 
    }

    /**
     * Determines if the paydate has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPaydateInitialized() {
        return paydate_is_initialized; 
    }

    /**
     * Getter method for folioid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.folioid
     * <li> foreign key: folio.folioid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of folioid
     */
    public Long getFolioid()
    {
        return folioid; 
    }

    /**
     * Setter method for folioid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to folioid
     */
    public void setFolioid(Long newVal) {
        if ((newVal != null && this.folioid != null && (newVal.compareTo(this.folioid) == 0)) || 
            (newVal == null && this.folioid == null && folioid_is_initialized)) {
            return; 
        } 
        this.folioid = newVal; 
        folioid_is_modified = true; 
        folioid_is_initialized = true; 
    }

    /**
     * Setter method for folioid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to folioid
     */
    public void setFolioid(long newVal) {
        setFolioid(new Long(newVal));
    }

    /**
     * Determines if the folioid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFolioidModified() {
        return folioid_is_modified; 
    }

    /**
     * Determines if the folioid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFolioidInitialized() {
        return folioid_is_initialized; 
    }

    /**
     * Getter method for voucherno.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.voucherno
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of voucherno
     */
    public String getVoucherno()
    {
        return voucherno; 
    }

    /**
     * Setter method for voucherno.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to voucherno
     */
    public void setVoucherno(String newVal) {
        if ((newVal != null && this.voucherno != null && (newVal.compareTo(this.voucherno) == 0)) || 
            (newVal == null && this.voucherno == null && voucherno_is_initialized)) {
            return; 
        } 
        this.voucherno = newVal; 
        voucherno_is_modified = true; 
        voucherno_is_initialized = true; 
    }

    /**
     * Determines if the voucherno has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isVouchernoModified() {
        return voucherno_is_modified; 
    }

    /**
     * Determines if the voucherno has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isVouchernoInitialized() {
        return voucherno_is_initialized; 
    }

    /**
     * Getter method for note.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.note
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
     * Getter method for deleted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.deleted
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
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.regbyid
     * <li> foreign key: personnel.personnelid
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
     * <li>full name: payment.regdate
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
     * Getter method for contracgentid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: payment.contracgentid
     * <li> foreign key: contragent.contragentid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of contracgentid
     */
    public Long getContracgentid()
    {
        return contracgentid; 
    }

    /**
     * Setter method for contracgentid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to contracgentid
     */
    public void setContracgentid(Long newVal) {
        if ((newVal != null && this.contracgentid != null && (newVal.compareTo(this.contracgentid) == 0)) || 
            (newVal == null && this.contracgentid == null && contracgentid_is_initialized)) {
            return; 
        } 
        this.contracgentid = newVal; 
        contracgentid_is_modified = true; 
        contracgentid_is_initialized = true; 
    }

    /**
     * Setter method for contracgentid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to contracgentid
     */
    public void setContracgentid(long newVal) {
        setContracgentid(new Long(newVal));
    }

    /**
     * Determines if the contracgentid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isContracgentidModified() {
        return contracgentid_is_modified; 
    }

    /**
     * Determines if the contracgentid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isContracgentidInitialized() {
        return contracgentid_is_initialized; 
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
        return paymentid_is_modified || 
		paymentmethodid_is_modified || 
		currencyid_is_modified || 
		amount_is_modified || 
		paydate_is_modified || 
		folioid_is_modified || 
		voucherno_is_modified || 
		note_is_modified || 
		deleted_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		contracgentid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        paymentid_is_modified = false;
        paymentmethodid_is_modified = false;
        currencyid_is_modified = false;
        amount_is_modified = false;
        paydate_is_modified = false;
        folioid_is_modified = false;
        voucherno_is_modified = false;
        note_is_modified = false;
        deleted_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        contracgentid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(PaymentBean bean) {
        setPaymentid(bean.getPaymentid());
        setPaymentmethodid(bean.getPaymentmethodid());
        setCurrencyid(bean.getCurrencyid());
        setAmount(bean.getAmount());
        setPaydate(bean.getPaydate());
        setFolioid(bean.getFolioid());
        setVoucherno(bean.getVoucherno());
        setNote(bean.getNote());
        setDeleted(bean.getDeleted());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setContracgentid(bean.getContracgentid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[payment] "
                 + "\n - payment.paymentid = " + (paymentid_is_initialized ? ("[" + (paymentid == null ? null : paymentid.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.paymentmethodid = " + (paymentmethodid_is_initialized ? ("[" + (paymentmethodid == null ? null : paymentmethodid.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.currencyid = " + (currencyid_is_initialized ? ("[" + (currencyid == null ? null : currencyid.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.amount = " + (amount_is_initialized ? ("[" + (amount == null ? null : amount.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.paydate = " + (paydate_is_initialized ? ("[" + (paydate == null ? null : paydate.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.folioid = " + (folioid_is_initialized ? ("[" + (folioid == null ? null : folioid.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.voucherno = " + (voucherno_is_initialized ? ("[" + (voucherno == null ? null : voucherno.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.note = " + (note_is_initialized ? ("[" + (note == null ? null : note.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - payment.contracgentid = " + (contracgentid_is_initialized ? ("[" + (contracgentid == null ? null : contracgentid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
