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


public class TaxsequenceBean
// extends+ 

// extends- 

{
    private Integer taxid;
    private boolean taxid_is_modified = false;
    private boolean taxid_is_initialized = false;
    
    private Integer afterid;
    private boolean afterid_is_modified = false;
    private boolean afterid_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    TaxsequenceBean()
    {
    }
    
    /**
     * Getter method for taxid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: taxsequence.taxid
     * <li> foreign key: tax.taxid
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
     * Getter method for afterid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: taxsequence.afterid
     * <li> foreign key: tax.taxid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of afterid
     */
    public Integer getAfterid()
    {
        return afterid; 
    }

    /**
     * Setter method for afterid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to afterid
     */
    public void setAfterid(Integer newVal) {
        if ((newVal != null && this.afterid != null && (newVal.compareTo(this.afterid) == 0)) || 
            (newVal == null && this.afterid == null && afterid_is_initialized)) {
            return; 
        } 
        this.afterid = newVal; 
        afterid_is_modified = true; 
        afterid_is_initialized = true; 
    }

    /**
     * Setter method for afterid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to afterid
     */
    public void setAfterid(int newVal) {
        setAfterid(new Integer(newVal));
    }

    /**
     * Determines if the afterid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAfteridModified() {
        return afterid_is_modified; 
    }

    /**
     * Determines if the afterid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAfteridInitialized() {
        return afterid_is_initialized; 
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
		afterid_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        taxid_is_modified = false;
        afterid_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(TaxsequenceBean bean) {
        setTaxid(bean.getTaxid());
        setAfterid(bean.getAfterid());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[taxsequence] "
                 + "\n - taxsequence.taxid = " + (taxid_is_initialized ? ("[" + (taxid == null ? null : taxid.toString()) + "]") : "not initialized") + ""
                 + "\n - taxsequence.afterid = " + (afterid_is_initialized ? ("[" + (afterid == null ? null : afterid.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
