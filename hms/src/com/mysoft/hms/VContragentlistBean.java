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


public class VContragentlistBean
// extends+ 

// extends- 

{
    private Long contragentid;
    private boolean contragentid_is_modified = false;
    private boolean contragentid_is_initialized = false;
    
    private String contragent;
    private boolean contragent_is_modified = false;
    private boolean contragent_is_initialized = false;
    
    private String company;
    private boolean company_is_modified = false;
    private boolean company_is_initialized = false;
    
    private String city;
    private boolean city_is_modified = false;
    private boolean city_is_initialized = false;
    
    private Integer type;
    private boolean type_is_modified = false;
    private boolean type_is_initialized = false;
    
    private Integer countryid;
    private boolean countryid_is_modified = false;
    private boolean countryid_is_initialized = false;
    
    private String country;
    private boolean country_is_modified = false;
    private boolean country_is_initialized = false;
    
    private String email;
    private boolean email_is_modified = false;
    private boolean email_is_initialized = false;
    
    private String phone;
    private boolean phone_is_modified = false;
    private boolean phone_is_initialized = false;
    
    private String mobile;
    private boolean mobile_is_modified = false;
    private boolean mobile_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    VContragentlistBean()
    {
    }
    
    /**
     * Getter method for contragentid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.contragentid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of contragentid
     */
    public Long getContragentid()
    {
        return contragentid; 
    }

    /**
     * Setter method for contragentid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to contragentid
     */
    public void setContragentid(Long newVal) {
        if ((newVal != null && this.contragentid != null && (newVal.compareTo(this.contragentid) == 0)) || 
            (newVal == null && this.contragentid == null && contragentid_is_initialized)) {
            return; 
        } 
        this.contragentid = newVal; 
        contragentid_is_modified = true; 
        contragentid_is_initialized = true; 
    }

    /**
     * Setter method for contragentid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to contragentid
     */
    public void setContragentid(long newVal) {
        setContragentid(new Long(newVal));
    }

    /**
     * Determines if the contragentid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isContragentidModified() {
        return contragentid_is_modified; 
    }

    /**
     * Determines if the contragentid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isContragentidInitialized() {
        return contragentid_is_initialized; 
    }

    /**
     * Getter method for contragent.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.contragent
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of contragent
     */
    public String getContragent()
    {
        return contragent; 
    }

    /**
     * Setter method for contragent.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to contragent
     */
    public void setContragent(String newVal) {
        if ((newVal != null && this.contragent != null && (newVal.compareTo(this.contragent) == 0)) || 
            (newVal == null && this.contragent == null && contragent_is_initialized)) {
            return; 
        } 
        this.contragent = newVal; 
        contragent_is_modified = true; 
        contragent_is_initialized = true; 
    }

    /**
     * Determines if the contragent has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isContragentModified() {
        return contragent_is_modified; 
    }

    /**
     * Determines if the contragent has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isContragentInitialized() {
        return contragent_is_initialized; 
    }

    /**
     * Getter method for company.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.company
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of company
     */
    public String getCompany()
    {
        return company; 
    }

    /**
     * Setter method for company.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to company
     */
    public void setCompany(String newVal) {
        if ((newVal != null && this.company != null && (newVal.compareTo(this.company) == 0)) || 
            (newVal == null && this.company == null && company_is_initialized)) {
            return; 
        } 
        this.company = newVal; 
        company_is_modified = true; 
        company_is_initialized = true; 
    }

    /**
     * Determines if the company has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCompanyModified() {
        return company_is_modified; 
    }

    /**
     * Determines if the company has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCompanyInitialized() {
        return company_is_initialized; 
    }

    /**
     * Getter method for city.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.city
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of city
     */
    public String getCity()
    {
        return city; 
    }

    /**
     * Setter method for city.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to city
     */
    public void setCity(String newVal) {
        if ((newVal != null && this.city != null && (newVal.compareTo(this.city) == 0)) || 
            (newVal == null && this.city == null && city_is_initialized)) {
            return; 
        } 
        this.city = newVal; 
        city_is_modified = true; 
        city_is_initialized = true; 
    }

    /**
     * Determines if the city has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCityModified() {
        return city_is_modified; 
    }

    /**
     * Determines if the city has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCityInitialized() {
        return city_is_initialized; 
    }

    /**
     * Getter method for type.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.type
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of type
     */
    public Integer getType()
    {
        return type; 
    }

    /**
     * Setter method for type.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to type
     */
    public void setType(Integer newVal) {
        if ((newVal != null && this.type != null && (newVal.compareTo(this.type) == 0)) || 
            (newVal == null && this.type == null && type_is_initialized)) {
            return; 
        } 
        this.type = newVal; 
        type_is_modified = true; 
        type_is_initialized = true; 
    }

    /**
     * Setter method for type.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to type
     */
    public void setType(int newVal) {
        setType(new Integer(newVal));
    }

    /**
     * Determines if the type has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isTypeModified() {
        return type_is_modified; 
    }

    /**
     * Determines if the type has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isTypeInitialized() {
        return type_is_initialized; 
    }

    /**
     * Getter method for countryid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.countryid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of countryid
     */
    public Integer getCountryid()
    {
        return countryid; 
    }

    /**
     * Setter method for countryid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to countryid
     */
    public void setCountryid(Integer newVal) {
        if ((newVal != null && this.countryid != null && (newVal.compareTo(this.countryid) == 0)) || 
            (newVal == null && this.countryid == null && countryid_is_initialized)) {
            return; 
        } 
        this.countryid = newVal; 
        countryid_is_modified = true; 
        countryid_is_initialized = true; 
    }

    /**
     * Setter method for countryid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to countryid
     */
    public void setCountryid(int newVal) {
        setCountryid(new Integer(newVal));
    }

    /**
     * Determines if the countryid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCountryidModified() {
        return countryid_is_modified; 
    }

    /**
     * Determines if the countryid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCountryidInitialized() {
        return countryid_is_initialized; 
    }

    /**
     * Getter method for country.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.country
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of country
     */
    public String getCountry()
    {
        return country; 
    }

    /**
     * Setter method for country.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to country
     */
    public void setCountry(String newVal) {
        if ((newVal != null && this.country != null && (newVal.compareTo(this.country) == 0)) || 
            (newVal == null && this.country == null && country_is_initialized)) {
            return; 
        } 
        this.country = newVal; 
        country_is_modified = true; 
        country_is_initialized = true; 
    }

    /**
     * Determines if the country has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isCountryModified() {
        return country_is_modified; 
    }

    /**
     * Determines if the country has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isCountryInitialized() {
        return country_is_initialized; 
    }

    /**
     * Getter method for email.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.email
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of email
     */
    public String getEmail()
    {
        return email; 
    }

    /**
     * Setter method for email.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to email
     */
    public void setEmail(String newVal) {
        if ((newVal != null && this.email != null && (newVal.compareTo(this.email) == 0)) || 
            (newVal == null && this.email == null && email_is_initialized)) {
            return; 
        } 
        this.email = newVal; 
        email_is_modified = true; 
        email_is_initialized = true; 
    }

    /**
     * Determines if the email has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isEmailModified() {
        return email_is_modified; 
    }

    /**
     * Determines if the email has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isEmailInitialized() {
        return email_is_initialized; 
    }

    /**
     * Getter method for phone.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.phone
     * <li>column size: 100
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of phone
     */
    public String getPhone()
    {
        return phone; 
    }

    /**
     * Setter method for phone.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to phone
     */
    public void setPhone(String newVal) {
        if ((newVal != null && this.phone != null && (newVal.compareTo(this.phone) == 0)) || 
            (newVal == null && this.phone == null && phone_is_initialized)) {
            return; 
        } 
        this.phone = newVal; 
        phone_is_modified = true; 
        phone_is_initialized = true; 
    }

    /**
     * Determines if the phone has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPhoneModified() {
        return phone_is_modified; 
    }

    /**
     * Determines if the phone has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPhoneInitialized() {
        return phone_is_initialized; 
    }

    /**
     * Getter method for mobile.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: v_contragentlist.mobile
     * <li>column size: 100
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of mobile
     */
    public String getMobile()
    {
        return mobile; 
    }

    /**
     * Setter method for mobile.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to mobile
     */
    public void setMobile(String newVal) {
        if ((newVal != null && this.mobile != null && (newVal.compareTo(this.mobile) == 0)) || 
            (newVal == null && this.mobile == null && mobile_is_initialized)) {
            return; 
        } 
        this.mobile = newVal; 
        mobile_is_modified = true; 
        mobile_is_initialized = true; 
    }

    /**
     * Determines if the mobile has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isMobileModified() {
        return mobile_is_modified; 
    }

    /**
     * Determines if the mobile has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isMobileInitialized() {
        return mobile_is_initialized; 
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
        return contragentid_is_modified || 
		contragent_is_modified || 
		company_is_modified || 
		city_is_modified || 
		type_is_modified || 
		countryid_is_modified || 
		country_is_modified || 
		email_is_modified || 
		phone_is_modified || 
		mobile_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        contragentid_is_modified = false;
        contragent_is_modified = false;
        company_is_modified = false;
        city_is_modified = false;
        type_is_modified = false;
        countryid_is_modified = false;
        country_is_modified = false;
        email_is_modified = false;
        phone_is_modified = false;
        mobile_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(VContragentlistBean bean) {
        setContragentid(bean.getContragentid());
        setContragent(bean.getContragent());
        setCompany(bean.getCompany());
        setCity(bean.getCity());
        setType(bean.getType());
        setCountryid(bean.getCountryid());
        setCountry(bean.getCountry());
        setEmail(bean.getEmail());
        setPhone(bean.getPhone());
        setMobile(bean.getMobile());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[v_contragentlist] "
                 + "\n - v_contragentlist.contragentid = " + (contragentid_is_initialized ? ("[" + (contragentid == null ? null : contragentid.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.contragent = " + (contragent_is_initialized ? ("[" + (contragent == null ? null : contragent.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.company = " + (company_is_initialized ? ("[" + (company == null ? null : company.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.city = " + (city_is_initialized ? ("[" + (city == null ? null : city.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.type = " + (type_is_initialized ? ("[" + (type == null ? null : type.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.countryid = " + (countryid_is_initialized ? ("[" + (countryid == null ? null : countryid.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.country = " + (country_is_initialized ? ("[" + (country == null ? null : country.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.email = " + (email_is_initialized ? ("[" + (email == null ? null : email.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.phone = " + (phone_is_initialized ? ("[" + (phone == null ? null : phone.toString()) + "]") : "not initialized") + ""
                 + "\n - v_contragentlist.mobile = " + (mobile_is_initialized ? ("[" + (mobile == null ? null : mobile.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}