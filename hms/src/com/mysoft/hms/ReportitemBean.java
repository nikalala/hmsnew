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


public class ReportitemBean
// extends+ 

// extends- 

{
    private Long reportitemid;
    private boolean reportitemid_is_modified = false;
    private boolean reportitemid_is_initialized = false;
    
    private Integer reportid;
    private boolean reportid_is_modified = false;
    private boolean reportid_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Integer idx;
    private boolean idx_is_modified = false;
    private boolean idx_is_initialized = false;
    
    private Integer fieldtype;
    private boolean fieldtype_is_modified = false;
    private boolean fieldtype_is_initialized = false;
    
    private String align;
    private boolean align_is_modified = false;
    private boolean align_is_initialized = false;
    
    private Integer wd;
    private boolean wd_is_modified = false;
    private boolean wd_is_initialized = false;
    
    private Boolean hassum;
    private boolean hassum_is_modified = false;
    private boolean hassum_is_initialized = false;
    
    private Boolean ordered;
    private boolean ordered_is_modified = false;
    private boolean ordered_is_initialized = false;
    
    private Boolean search;
    private boolean search_is_modified = false;
    private boolean search_is_initialized = false;
    
    private String param;
    private boolean param_is_modified = false;
    private boolean param_is_initialized = false;
    
    private Boolean mandatory;
    private boolean mandatory_is_modified = false;
    private boolean mandatory_is_initialized = false;
    
    private String defval1;
    private boolean defval1_is_modified = false;
    private boolean defval1_is_initialized = false;
    
    private String defval2;
    private boolean defval2_is_modified = false;
    private boolean defval2_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    ReportitemBean()
    {
    }
    
    /**
     * Getter method for reportitemid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.reportitemid
     * <li>column size: 19
     * <li>jdbc type returned by the driver: Types.BIGINT
     * </ul>
     *
     * @return the value of reportitemid
     */
    public Long getReportitemid()
    {
        return reportitemid; 
    }

    /**
     * Setter method for reportitemid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to reportitemid
     */
    public void setReportitemid(Long newVal) {
        if ((newVal != null && this.reportitemid != null && (newVal.compareTo(this.reportitemid) == 0)) || 
            (newVal == null && this.reportitemid == null && reportitemid_is_initialized)) {
            return; 
        } 
        this.reportitemid = newVal; 
        reportitemid_is_modified = true; 
        reportitemid_is_initialized = true; 
    }

    /**
     * Setter method for reportitemid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to reportitemid
     */
    public void setReportitemid(long newVal) {
        setReportitemid(new Long(newVal));
    }

    /**
     * Determines if the reportitemid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isReportitemidModified() {
        return reportitemid_is_modified; 
    }

    /**
     * Determines if the reportitemid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isReportitemidInitialized() {
        return reportitemid_is_initialized; 
    }

    /**
     * Getter method for reportid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.reportid
     * <li> foreign key: report.reportid
     * <li>comments: ???????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of reportid
     */
    public Integer getReportid()
    {
        return reportid; 
    }

    /**
     * Setter method for reportid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to reportid
     */
    public void setReportid(Integer newVal) {
        if ((newVal != null && this.reportid != null && (newVal.compareTo(this.reportid) == 0)) || 
            (newVal == null && this.reportid == null && reportid_is_initialized)) {
            return; 
        } 
        this.reportid = newVal; 
        reportid_is_modified = true; 
        reportid_is_initialized = true; 
    }

    /**
     * Setter method for reportid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to reportid
     */
    public void setReportid(int newVal) {
        setReportid(new Integer(newVal));
    }

    /**
     * Determines if the reportid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isReportidModified() {
        return reportid_is_modified; 
    }

    /**
     * Determines if the reportid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isReportidInitialized() {
        return reportid_is_initialized; 
    }

    /**
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.name
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
     * Getter method for idx.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.idx
     * <li>comments: ???????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of idx
     */
    public Integer getIdx()
    {
        return idx; 
    }

    /**
     * Setter method for idx.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to idx
     */
    public void setIdx(Integer newVal) {
        if ((newVal != null && this.idx != null && (newVal.compareTo(this.idx) == 0)) || 
            (newVal == null && this.idx == null && idx_is_initialized)) {
            return; 
        } 
        this.idx = newVal; 
        idx_is_modified = true; 
        idx_is_initialized = true; 
    }

    /**
     * Setter method for idx.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to idx
     */
    public void setIdx(int newVal) {
        setIdx(new Integer(newVal));
    }

    /**
     * Determines if the idx has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isIdxModified() {
        return idx_is_modified; 
    }

    /**
     * Determines if the idx has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isIdxInitialized() {
        return idx_is_initialized; 
    }

    /**
     * Getter method for fieldtype.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.fieldtype
     * <li>comments: ????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of fieldtype
     */
    public Integer getFieldtype()
    {
        return fieldtype; 
    }

    /**
     * Setter method for fieldtype.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to fieldtype
     */
    public void setFieldtype(Integer newVal) {
        if ((newVal != null && this.fieldtype != null && (newVal.compareTo(this.fieldtype) == 0)) || 
            (newVal == null && this.fieldtype == null && fieldtype_is_initialized)) {
            return; 
        } 
        this.fieldtype = newVal; 
        fieldtype_is_modified = true; 
        fieldtype_is_initialized = true; 
    }

    /**
     * Setter method for fieldtype.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to fieldtype
     */
    public void setFieldtype(int newVal) {
        setFieldtype(new Integer(newVal));
    }

    /**
     * Determines if the fieldtype has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFieldtypeModified() {
        return fieldtype_is_modified; 
    }

    /**
     * Determines if the fieldtype has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFieldtypeInitialized() {
        return fieldtype_is_initialized; 
    }

    /**
     * Getter method for align.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.align
     * <li>comments: ???????
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of align
     */
    public String getAlign()
    {
        return align; 
    }

    /**
     * Setter method for align.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to align
     */
    public void setAlign(String newVal) {
        if ((newVal != null && this.align != null && (newVal.compareTo(this.align) == 0)) || 
            (newVal == null && this.align == null && align_is_initialized)) {
            return; 
        } 
        this.align = newVal; 
        align_is_modified = true; 
        align_is_initialized = true; 
    }

    /**
     * Determines if the align has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isAlignModified() {
        return align_is_modified; 
    }

    /**
     * Determines if the align has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isAlignInitialized() {
        return align_is_initialized; 
    }

    /**
     * Getter method for wd.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.wd
     * <li>comments: ??????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of wd
     */
    public Integer getWd()
    {
        return wd; 
    }

    /**
     * Setter method for wd.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to wd
     */
    public void setWd(Integer newVal) {
        if ((newVal != null && this.wd != null && (newVal.compareTo(this.wd) == 0)) || 
            (newVal == null && this.wd == null && wd_is_initialized)) {
            return; 
        } 
        this.wd = newVal; 
        wd_is_modified = true; 
        wd_is_initialized = true; 
    }

    /**
     * Setter method for wd.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to wd
     */
    public void setWd(int newVal) {
        setWd(new Integer(newVal));
    }

    /**
     * Determines if the wd has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isWdModified() {
        return wd_is_modified; 
    }

    /**
     * Determines if the wd has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isWdInitialized() {
        return wd_is_initialized; 
    }

    /**
     * Getter method for hassum.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.hassum
     * <li>comments: ???? ????
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of hassum
     */
    public Boolean getHassum()
    {
        return hassum; 
    }

    /**
     * Setter method for hassum.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to hassum
     */
    public void setHassum(Boolean newVal) {
        if ((newVal != null && this.hassum != null && newVal.equals(this.hassum)) || 
            (newVal == null && this.hassum == null && hassum_is_initialized)) {
            return; 
        } 
        this.hassum = newVal; 
        hassum_is_modified = true; 
        hassum_is_initialized = true; 
    }

    /**
     * Setter method for hassum.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to hassum
     */
    public void setHassum(boolean newVal) {
        setHassum(new Boolean(newVal));
    }

    /**
     * Determines if the hassum has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isHassumModified() {
        return hassum_is_modified; 
    }

    /**
     * Determines if the hassum has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isHassumInitialized() {
        return hassum_is_initialized; 
    }

    /**
     * Getter method for ordered.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.ordered
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of ordered
     */
    public Boolean getOrdered()
    {
        return ordered; 
    }

    /**
     * Setter method for ordered.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to ordered
     */
    public void setOrdered(Boolean newVal) {
        if ((newVal != null && this.ordered != null && newVal.equals(this.ordered)) || 
            (newVal == null && this.ordered == null && ordered_is_initialized)) {
            return; 
        } 
        this.ordered = newVal; 
        ordered_is_modified = true; 
        ordered_is_initialized = true; 
    }

    /**
     * Setter method for ordered.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to ordered
     */
    public void setOrdered(boolean newVal) {
        setOrdered(new Boolean(newVal));
    }

    /**
     * Determines if the ordered has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isOrderedModified() {
        return ordered_is_modified; 
    }

    /**
     * Determines if the ordered has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isOrderedInitialized() {
        return ordered_is_initialized; 
    }

    /**
     * Getter method for search.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.search
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of search
     */
    public Boolean getSearch()
    {
        return search; 
    }

    /**
     * Setter method for search.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to search
     */
    public void setSearch(Boolean newVal) {
        if ((newVal != null && this.search != null && newVal.equals(this.search)) || 
            (newVal == null && this.search == null && search_is_initialized)) {
            return; 
        } 
        this.search = newVal; 
        search_is_modified = true; 
        search_is_initialized = true; 
    }

    /**
     * Setter method for search.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to search
     */
    public void setSearch(boolean newVal) {
        setSearch(new Boolean(newVal));
    }

    /**
     * Determines if the search has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSearchModified() {
        return search_is_modified; 
    }

    /**
     * Determines if the search has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSearchInitialized() {
        return search_is_initialized; 
    }

    /**
     * Getter method for param.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.param
     * <li>default value: ''::text
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of param
     */
    public String getParam()
    {
        return param; 
    }

    /**
     * Setter method for param.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to param
     */
    public void setParam(String newVal) {
        if ((newVal != null && this.param != null && (newVal.compareTo(this.param) == 0)) || 
            (newVal == null && this.param == null && param_is_initialized)) {
            return; 
        } 
        this.param = newVal; 
        param_is_modified = true; 
        param_is_initialized = true; 
    }

    /**
     * Determines if the param has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isParamModified() {
        return param_is_modified; 
    }

    /**
     * Determines if the param has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isParamInitialized() {
        return param_is_initialized; 
    }

    /**
     * Getter method for mandatory.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.mandatory
     * <li>default value: false
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of mandatory
     */
    public Boolean getMandatory()
    {
        return mandatory; 
    }

    /**
     * Setter method for mandatory.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to mandatory
     */
    public void setMandatory(Boolean newVal) {
        if ((newVal != null && this.mandatory != null && newVal.equals(this.mandatory)) || 
            (newVal == null && this.mandatory == null && mandatory_is_initialized)) {
            return; 
        } 
        this.mandatory = newVal; 
        mandatory_is_modified = true; 
        mandatory_is_initialized = true; 
    }

    /**
     * Setter method for mandatory.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to mandatory
     */
    public void setMandatory(boolean newVal) {
        setMandatory(new Boolean(newVal));
    }

    /**
     * Determines if the mandatory has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isMandatoryModified() {
        return mandatory_is_modified; 
    }

    /**
     * Determines if the mandatory has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isMandatoryInitialized() {
        return mandatory_is_initialized; 
    }

    /**
     * Getter method for defval1.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.defval1
     * <li>default value: ''::text
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of defval1
     */
    public String getDefval1()
    {
        return defval1; 
    }

    /**
     * Setter method for defval1.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to defval1
     */
    public void setDefval1(String newVal) {
        if ((newVal != null && this.defval1 != null && (newVal.compareTo(this.defval1) == 0)) || 
            (newVal == null && this.defval1 == null && defval1_is_initialized)) {
            return; 
        } 
        this.defval1 = newVal; 
        defval1_is_modified = true; 
        defval1_is_initialized = true; 
    }

    /**
     * Determines if the defval1 has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDefval1Modified() {
        return defval1_is_modified; 
    }

    /**
     * Determines if the defval1 has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDefval1Initialized() {
        return defval1_is_initialized; 
    }

    /**
     * Getter method for defval2.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: reportitem.defval2
     * <li>default value: ''::text
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of defval2
     */
    public String getDefval2()
    {
        return defval2; 
    }

    /**
     * Setter method for defval2.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to defval2
     */
    public void setDefval2(String newVal) {
        if ((newVal != null && this.defval2 != null && (newVal.compareTo(this.defval2) == 0)) || 
            (newVal == null && this.defval2 == null && defval2_is_initialized)) {
            return; 
        } 
        this.defval2 = newVal; 
        defval2_is_modified = true; 
        defval2_is_initialized = true; 
    }

    /**
     * Determines if the defval2 has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isDefval2Modified() {
        return defval2_is_modified; 
    }

    /**
     * Determines if the defval2 has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isDefval2Initialized() {
        return defval2_is_initialized; 
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
        return reportitemid_is_modified || 
		reportid_is_modified || 
		name_is_modified || 
		idx_is_modified || 
		fieldtype_is_modified || 
		align_is_modified || 
		wd_is_modified || 
		hassum_is_modified || 
		ordered_is_modified || 
		search_is_modified || 
		param_is_modified || 
		mandatory_is_modified || 
		defval1_is_modified || 
		defval2_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        reportitemid_is_modified = false;
        reportid_is_modified = false;
        name_is_modified = false;
        idx_is_modified = false;
        fieldtype_is_modified = false;
        align_is_modified = false;
        wd_is_modified = false;
        hassum_is_modified = false;
        ordered_is_modified = false;
        search_is_modified = false;
        param_is_modified = false;
        mandatory_is_modified = false;
        defval1_is_modified = false;
        defval2_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(ReportitemBean bean) {
        setReportitemid(bean.getReportitemid());
        setReportid(bean.getReportid());
        setName(bean.getName());
        setIdx(bean.getIdx());
        setFieldtype(bean.getFieldtype());
        setAlign(bean.getAlign());
        setWd(bean.getWd());
        setHassum(bean.getHassum());
        setOrdered(bean.getOrdered());
        setSearch(bean.getSearch());
        setParam(bean.getParam());
        setMandatory(bean.getMandatory());
        setDefval1(bean.getDefval1());
        setDefval2(bean.getDefval2());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[reportitem] "
                 + "\n - reportitem.reportitemid = " + (reportitemid_is_initialized ? ("[" + (reportitemid == null ? null : reportitemid.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.reportid = " + (reportid_is_initialized ? ("[" + (reportid == null ? null : reportid.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.idx = " + (idx_is_initialized ? ("[" + (idx == null ? null : idx.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.fieldtype = " + (fieldtype_is_initialized ? ("[" + (fieldtype == null ? null : fieldtype.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.align = " + (align_is_initialized ? ("[" + (align == null ? null : align.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.wd = " + (wd_is_initialized ? ("[" + (wd == null ? null : wd.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.hassum = " + (hassum_is_initialized ? ("[" + (hassum == null ? null : hassum.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.ordered = " + (ordered_is_initialized ? ("[" + (ordered == null ? null : ordered.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.search = " + (search_is_initialized ? ("[" + (search == null ? null : search.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.param = " + (param_is_initialized ? ("[" + (param == null ? null : param.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.mandatory = " + (mandatory_is_initialized ? ("[" + (mandatory == null ? null : mandatory.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.defval1 = " + (defval1_is_initialized ? ("[" + (defval1 == null ? null : defval1.toString()) + "]") : "not initialized") + ""
                 + "\n - reportitem.defval2 = " + (defval2_is_initialized ? ("[" + (defval2 == null ? null : defval2.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
