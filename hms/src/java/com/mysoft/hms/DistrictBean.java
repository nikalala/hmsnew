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

public class DistrictBean
// extends+ 

// extends- 
{
    private Integer districtid;
    private boolean districtid_is_modified = false;
    private boolean districtid_is_initialized = false;
    
    private Integer cityid;
    private boolean cityid_is_modified = false;
    private boolean cityid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    DistrictBean()
    {
    }
    
    /**
     * Getter method for districtid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: district.districtid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of districtid
     */
    public Integer getDistrictid()
    {
        return districtid; 
    }

    /**
     * Setter method for districtid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to districtid
     */
    public void setDistrictid(Integer newVal) {
        if ((newVal != null && this.districtid != null && (newVal.compareTo(this.districtid) == 0)) || 
            (newVal == null && this.districtid == null && districtid_is_initialized)) {
            return; 
        } 
        this.districtid = newVal; 
        districtid_is_modified = true; 
        districtid_is_initialized = true; 
    }

    /**
     * Setter method for districtid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to districtid
     */
    public void setDistrictid(int newVal) {
        setDistrictid(new Integer(newVal));
    }

    /**
     * Determines if the districtid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDistrictidModified() {
        return districtid_is_modified; 
    }

    /**
     * Determines if the districtid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDistrictidInitialized() {
        return districtid_is_initialized; 
    }

    /**
     * Getter method for cityid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: district.cityid
     * <li> foreign key: city.cityid
     * <li>comments: ქალაქი
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of cityid
     */
    public Integer getCityid()
    {
        return cityid; 
    }

    /**
     * Setter method for cityid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to cityid
     */
    public void setCityid(Integer newVal) {
        if ((newVal != null && this.cityid != null && (newVal.compareTo(this.cityid) == 0)) || 
            (newVal == null && this.cityid == null && cityid_is_initialized)) {
            return; 
        } 
        this.cityid = newVal; 
        cityid_is_modified = true; 
        cityid_is_initialized = true; 
    }

    /**
     * Setter method for cityid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to cityid
     */
    public void setCityid(int newVal) {
        setCityid(new Integer(newVal));
    }

    /**
     * Determines if the cityid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCityidModified() {
        return cityid_is_modified; 
    }

    /**
     * Determines if the cityid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCityidInitialized() {
        return cityid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: district.name
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
        return districtid_is_modified || 
		cityid_is_modified || 
		name_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        districtid_is_modified = false;
        cityid_is_modified = false;
        name_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(DistrictBean bean) {
        setDistrictid(bean.getDistrictid());
        setCityid(bean.getCityid());
        setName(bean.getName());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[district] "
                 + "\n - district.districtid = " + (districtid_is_initialized ? ("[" + (districtid == null ? null : districtid.toString()) + "]") : "not initialized") + ""
                 + "\n - district.cityid = " + (cityid_is_initialized ? ("[" + (cityid == null ? null : cityid.toString()) + "]") : "not initialized") + ""
                 + "\n - district.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 
}
