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


public class TariffBean
// extends+ 

// extends- 

{
    private Long tariffid;
    private boolean tariffid_is_modified = false;
    private boolean tariffid_is_initialized = false;
    
    private Integer roomtypeid;
    private boolean roomtypeid_is_modified = false;
    private boolean roomtypeid_is_initialized = false;
    
    private Integer tarifftypeid;
    private boolean tarifftypeid_is_modified = false;
    private boolean tarifftypeid_is_initialized = false;
    
    private Integer seasonid;
    private boolean seasonid_is_modified = false;
    private boolean seasonid_is_initialized = false;
    
    private Long sourceid;
    private boolean sourceid_is_modified = false;
    private boolean sourceid_is_initialized = false;
    
    private Double amount;
    private boolean amount_is_modified = false;
    private boolean amount_is_initialized = false;
    
    private Double amountadult;
    private boolean amountadult_is_modified = false;
    private boolean amountadult_is_initialized = false;
    
    private Double amountchild;
    private boolean amountchild_is_modified = false;
    private boolean amountchild_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    TariffBean()
    {
    }
    
    /**
     * Getter method for tariffid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.tariffid
     * <li>column size: 8
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of tariffid
     */
    public Long getTariffid()
    {
        return tariffid; 
    }

    /**
     * Setter method for tariffid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to tariffid
     */
    public void setTariffid(Long newVal) {
        if ((newVal != null && this.tariffid != null && (newVal.compareTo(this.tariffid) == 0)) || 
            (newVal == null && this.tariffid == null && tariffid_is_initialized)) {
            return; 
        } 
        this.tariffid = newVal; 
        tariffid_is_modified = true; 
        tariffid_is_initialized = true; 
    }

    /**
     * Setter method for tariffid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to tariffid
     */
    public void setTariffid(long newVal) {
        setTariffid(new Long(newVal));
    }

    /**
     * Determines if the tariffid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTariffidModified() {
        return tariffid_is_modified; 
    }

    /**
     * Determines if the tariffid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTariffidInitialized() {
        return tariffid_is_initialized; 
    }

    /**
     * Getter method for roomtypeid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.roomtypeid
     * <li> foreign key: roomtype.roomtypeid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of roomtypeid
     */
    public Integer getRoomtypeid()
    {
        return roomtypeid; 
    }

    /**
     * Setter method for roomtypeid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to roomtypeid
     */
    public void setRoomtypeid(Integer newVal) {
        if ((newVal != null && this.roomtypeid != null && (newVal.compareTo(this.roomtypeid) == 0)) || 
            (newVal == null && this.roomtypeid == null && roomtypeid_is_initialized)) {
            return; 
        } 
        this.roomtypeid = newVal; 
        roomtypeid_is_modified = true; 
        roomtypeid_is_initialized = true; 
    }

    /**
     * Setter method for roomtypeid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to roomtypeid
     */
    public void setRoomtypeid(int newVal) {
        setRoomtypeid(new Integer(newVal));
    }

    /**
     * Determines if the roomtypeid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isRoomtypeidModified() {
        return roomtypeid_is_modified; 
    }

    /**
     * Determines if the roomtypeid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isRoomtypeidInitialized() {
        return roomtypeid_is_initialized; 
    }

    /**
     * Getter method for tarifftypeid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.tarifftypeid
     * <li> foreign key: tarifftype.tarifftypeid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of tarifftypeid
     */
    public Integer getTarifftypeid()
    {
        return tarifftypeid; 
    }

    /**
     * Setter method for tarifftypeid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to tarifftypeid
     */
    public void setTarifftypeid(Integer newVal) {
        if ((newVal != null && this.tarifftypeid != null && (newVal.compareTo(this.tarifftypeid) == 0)) || 
            (newVal == null && this.tarifftypeid == null && tarifftypeid_is_initialized)) {
            return; 
        } 
        this.tarifftypeid = newVal; 
        tarifftypeid_is_modified = true; 
        tarifftypeid_is_initialized = true; 
    }

    /**
     * Setter method for tarifftypeid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to tarifftypeid
     */
    public void setTarifftypeid(int newVal) {
        setTarifftypeid(new Integer(newVal));
    }

    /**
     * Determines if the tarifftypeid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTarifftypeidModified() {
        return tarifftypeid_is_modified; 
    }

    /**
     * Determines if the tarifftypeid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTarifftypeidInitialized() {
        return tarifftypeid_is_initialized; 
    }

    /**
     * Getter method for seasonid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.seasonid
     * <li> foreign key: season.seasonid
     * <li>column size: 4
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of seasonid
     */
    public Integer getSeasonid()
    {
        return seasonid; 
    }

    /**
     * Setter method for seasonid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to seasonid
     */
    public void setSeasonid(Integer newVal) {
        if ((newVal != null && this.seasonid != null && (newVal.compareTo(this.seasonid) == 0)) || 
            (newVal == null && this.seasonid == null && seasonid_is_initialized)) {
            return; 
        } 
        this.seasonid = newVal; 
        seasonid_is_modified = true; 
        seasonid_is_initialized = true; 
    }

    /**
     * Setter method for seasonid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to seasonid
     */
    public void setSeasonid(int newVal) {
        setSeasonid(new Integer(newVal));
    }

    /**
     * Determines if the seasonid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSeasonidModified() {
        return seasonid_is_modified; 
    }

    /**
     * Determines if the seasonid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSeasonidInitialized() {
        return seasonid_is_initialized; 
    }

    /**
     * Getter method for sourceid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.sourceid
     * <li> foreign key: agent.agentid
     * <li>column size: 8
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of sourceid
     */
    public Long getSourceid()
    {
        return sourceid; 
    }

    /**
     * Setter method for sourceid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to sourceid
     */
    public void setSourceid(Long newVal) {
        if ((newVal != null && this.sourceid != null && (newVal.compareTo(this.sourceid) == 0)) || 
            (newVal == null && this.sourceid == null && sourceid_is_initialized)) {
            return; 
        } 
        this.sourceid = newVal; 
        sourceid_is_modified = true; 
        sourceid_is_initialized = true; 
    }

    /**
     * Setter method for sourceid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to sourceid
     */
    public void setSourceid(long newVal) {
        setSourceid(new Long(newVal));
    }

    /**
     * Determines if the sourceid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSourceidModified() {
        return sourceid_is_modified; 
    }

    /**
     * Determines if the sourceid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSourceidInitialized() {
        return sourceid_is_initialized; 
    }

    /**
     * Getter method for amount.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.amount
     * <li>column size: 8
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
     * Getter method for amountadult.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.amountadult
     * <li>column size: 8
     * <li>jdbc type returned by the driver: Types.DOUBLE
     * </ul>
     *
     * @return the value of amountadult
     */
    public Double getAmountadult()
    {
        return amountadult; 
    }

    /**
     * Setter method for amountadult.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to amountadult
     */
    public void setAmountadult(Double newVal) {
        if ((newVal != null && this.amountadult != null && (newVal.compareTo(this.amountadult) == 0)) || 
            (newVal == null && this.amountadult == null && amountadult_is_initialized)) {
            return; 
        } 
        this.amountadult = newVal; 
        amountadult_is_modified = true; 
        amountadult_is_initialized = true; 
    }

    /**
     * Setter method for amountadult.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to amountadult
     */
    public void setAmountadult(double newVal) {
        setAmountadult(new Double(newVal));
    }

    /**
     * Determines if the amountadult has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAmountadultModified() {
        return amountadult_is_modified; 
    }

    /**
     * Determines if the amountadult has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAmountadultInitialized() {
        return amountadult_is_initialized; 
    }

    /**
     * Getter method for amountchild.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: tariff.amountchild
     * <li>column size: 8
     * <li>jdbc type returned by the driver: Types.DOUBLE
     * </ul>
     *
     * @return the value of amountchild
     */
    public Double getAmountchild()
    {
        return amountchild; 
    }

    /**
     * Setter method for amountchild.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to amountchild
     */
    public void setAmountchild(Double newVal) {
        if ((newVal != null && this.amountchild != null && (newVal.compareTo(this.amountchild) == 0)) || 
            (newVal == null && this.amountchild == null && amountchild_is_initialized)) {
            return; 
        } 
        this.amountchild = newVal; 
        amountchild_is_modified = true; 
        amountchild_is_initialized = true; 
    }

    /**
     * Setter method for amountchild.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to amountchild
     */
    public void setAmountchild(double newVal) {
        setAmountchild(new Double(newVal));
    }

    /**
     * Determines if the amountchild has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAmountchildModified() {
        return amountchild_is_modified; 
    }

    /**
     * Determines if the amountchild has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAmountchildInitialized() {
        return amountchild_is_initialized; 
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
        return tariffid_is_modified || 
		roomtypeid_is_modified || 
		tarifftypeid_is_modified || 
		seasonid_is_modified || 
		sourceid_is_modified || 
		amount_is_modified || 
		amountadult_is_modified || 
		amountchild_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        tariffid_is_modified = false;
        roomtypeid_is_modified = false;
        tarifftypeid_is_modified = false;
        seasonid_is_modified = false;
        sourceid_is_modified = false;
        amount_is_modified = false;
        amountadult_is_modified = false;
        amountchild_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(TariffBean bean) {
        setTariffid(bean.getTariffid());
        setRoomtypeid(bean.getRoomtypeid());
        setTarifftypeid(bean.getTarifftypeid());
        setSeasonid(bean.getSeasonid());
        setSourceid(bean.getSourceid());
        setAmount(bean.getAmount());
        setAmountadult(bean.getAmountadult());
        setAmountchild(bean.getAmountchild());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[tariff] "
                 + "\n - tariff.tariffid = " + (tariffid_is_initialized ? ("[" + (tariffid == null ? null : tariffid.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.roomtypeid = " + (roomtypeid_is_initialized ? ("[" + (roomtypeid == null ? null : roomtypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.tarifftypeid = " + (tarifftypeid_is_initialized ? ("[" + (tarifftypeid == null ? null : tarifftypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.seasonid = " + (seasonid_is_initialized ? ("[" + (seasonid == null ? null : seasonid.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.sourceid = " + (sourceid_is_initialized ? ("[" + (sourceid == null ? null : sourceid.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.amount = " + (amount_is_initialized ? ("[" + (amount == null ? null : amount.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.amountadult = " + (amountadult_is_initialized ? ("[" + (amountadult == null ? null : amountadult.toString()) + "]") : "not initialized") + ""
                 + "\n - tariff.amountchild = " + (amountchild_is_initialized ? ("[" + (amountchild == null ? null : amountchild.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
