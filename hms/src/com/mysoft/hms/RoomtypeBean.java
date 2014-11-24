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


public class RoomtypeBean
// extends+ 

// extends- 

{
    private Integer roomtypeid;
    private boolean roomtypeid_is_modified = false;
    private boolean roomtypeid_is_initialized = false;
    
    private String code;
    private boolean code_is_modified = false;
    private boolean code_is_initialized = false;
    
    private String name;
    private boolean name_is_modified = false;
    private boolean name_is_initialized = false;
    
    private Integer badult;
    private boolean badult_is_modified = false;
    private boolean badult_is_initialized = false;
    
    private Integer bchild;
    private boolean bchild_is_modified = false;
    private boolean bchild_is_initialized = false;
    
    private Integer madult;
    private boolean madult_is_modified = false;
    private boolean madult_is_initialized = false;
    
    private Integer mchild;
    private boolean mchild_is_modified = false;
    private boolean mchild_is_initialized = false;
    
    private Boolean web;
    private boolean web_is_modified = false;
    private boolean web_is_initialized = false;
    
    private String color;
    private boolean color_is_modified = false;
    private boolean color_is_initialized = false;
    
    private Integer webinventory;
    private boolean webinventory_is_modified = false;
    private boolean webinventory_is_initialized = false;
    
    private Integer regbyid;
    private boolean regbyid_is_modified = false;
    private boolean regbyid_is_initialized = false;
    
    private java.sql.Timestamp regdate;
    private boolean regdate_is_modified = false;
    private boolean regdate_is_initialized = false;
    
    private Boolean active;
    private boolean active_is_modified = false;
    private boolean active_is_initialized = false;
    
    private Integer ord;
    private boolean ord_is_modified = false;
    private boolean ord_is_initialized = false;
    
    private Boolean deleted;
    private boolean deleted_is_modified = false;
    private boolean deleted_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    RoomtypeBean()
    {
    }
    
    /**
     * Getter method for roomtypeid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.roomtypeid
     * <li>column size: 10
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
     * Getter method for code.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.code
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
     * Getter method for name.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.name
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
     * Getter method for badult.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.badult
     * <li>comments: ???????? ??????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of badult
     */
    public Integer getBadult()
    {
        return badult; 
    }

    /**
     * Setter method for badult.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to badult
     */
    public void setBadult(Integer newVal) {
        if ((newVal != null && this.badult != null && (newVal.compareTo(this.badult) == 0)) || 
            (newVal == null && this.badult == null && badult_is_initialized)) {
            return; 
        } 
        this.badult = newVal; 
        badult_is_modified = true; 
        badult_is_initialized = true; 
    }

    /**
     * Setter method for badult.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to badult
     */
    public void setBadult(int newVal) {
        setBadult(new Integer(newVal));
    }

    /**
     * Determines if the badult has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isBadultModified() {
        return badult_is_modified; 
    }

    /**
     * Determines if the badult has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isBadultInitialized() {
        return badult_is_initialized; 
    }

    /**
     * Getter method for bchild.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.bchild
     * <li>comments: ???????? ??????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of bchild
     */
    public Integer getBchild()
    {
        return bchild; 
    }

    /**
     * Setter method for bchild.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to bchild
     */
    public void setBchild(Integer newVal) {
        if ((newVal != null && this.bchild != null && (newVal.compareTo(this.bchild) == 0)) || 
            (newVal == null && this.bchild == null && bchild_is_initialized)) {
            return; 
        } 
        this.bchild = newVal; 
        bchild_is_modified = true; 
        bchild_is_initialized = true; 
    }

    /**
     * Setter method for bchild.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to bchild
     */
    public void setBchild(int newVal) {
        setBchild(new Integer(newVal));
    }

    /**
     * Determines if the bchild has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isBchildModified() {
        return bchild_is_modified; 
    }

    /**
     * Determines if the bchild has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isBchildInitialized() {
        return bchild_is_initialized; 
    }

    /**
     * Getter method for madult.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.madult
     * <li>comments: ???????? ??????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of madult
     */
    public Integer getMadult()
    {
        return madult; 
    }

    /**
     * Setter method for madult.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to madult
     */
    public void setMadult(Integer newVal) {
        if ((newVal != null && this.madult != null && (newVal.compareTo(this.madult) == 0)) || 
            (newVal == null && this.madult == null && madult_is_initialized)) {
            return; 
        } 
        this.madult = newVal; 
        madult_is_modified = true; 
        madult_is_initialized = true; 
    }

    /**
     * Setter method for madult.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to madult
     */
    public void setMadult(int newVal) {
        setMadult(new Integer(newVal));
    }

    /**
     * Determines if the madult has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isMadultModified() {
        return madult_is_modified; 
    }

    /**
     * Determines if the madult has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isMadultInitialized() {
        return madult_is_initialized; 
    }

    /**
     * Getter method for mchild.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.mchild
     * <li>comments: ???????? ??????
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of mchild
     */
    public Integer getMchild()
    {
        return mchild; 
    }

    /**
     * Setter method for mchild.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to mchild
     */
    public void setMchild(Integer newVal) {
        if ((newVal != null && this.mchild != null && (newVal.compareTo(this.mchild) == 0)) || 
            (newVal == null && this.mchild == null && mchild_is_initialized)) {
            return; 
        } 
        this.mchild = newVal; 
        mchild_is_modified = true; 
        mchild_is_initialized = true; 
    }

    /**
     * Setter method for mchild.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to mchild
     */
    public void setMchild(int newVal) {
        setMchild(new Integer(newVal));
    }

    /**
     * Determines if the mchild has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isMchildModified() {
        return mchild_is_modified; 
    }

    /**
     * Determines if the mchild has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isMchildInitialized() {
        return mchild_is_initialized; 
    }

    /**
     * Getter method for web.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.web
     * <li>comments: ?????????
     * <li>default value: true
     * <li>column size: 1
     * <li>jdbc type returned by the driver: Types.BIT
     * </ul>
     *
     * @return the value of web
     */
    public Boolean getWeb()
    {
        return web; 
    }

    /**
     * Setter method for web.
     * <br>
     * Attention, there will be no comparison with current value which
     * means calling this method will mark the field as 'modified' in all cases.
     *
     * @param newVal the new value to be assigned to web
     */
    public void setWeb(Boolean newVal) {
        if ((newVal != null && this.web != null && newVal.equals(this.web)) || 
            (newVal == null && this.web == null && web_is_initialized)) {
            return; 
        } 
        this.web = newVal; 
        web_is_modified = true; 
        web_is_initialized = true; 
    }

    /**
     * Setter method for web.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to web
     */
    public void setWeb(boolean newVal) {
        setWeb(new Boolean(newVal));
    }

    /**
     * Determines if the web has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isWebModified() {
        return web_is_modified; 
    }

    /**
     * Determines if the web has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isWebInitialized() {
        return web_is_initialized; 
    }

    /**
     * Getter method for color.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.color
     * <li>comments: ????
     * <li>column size: 7
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of color
     */
    public String getColor()
    {
        return color; 
    }

    /**
     * Setter method for color.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to color
     */
    public void setColor(String newVal) {
        if ((newVal != null && this.color != null && (newVal.compareTo(this.color) == 0)) || 
            (newVal == null && this.color == null && color_is_initialized)) {
            return; 
        } 
        this.color = newVal; 
        color_is_modified = true; 
        color_is_initialized = true; 
    }

    /**
     * Determines if the color has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isColorModified() {
        return color_is_modified; 
    }

    /**
     * Determines if the color has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isColorInitialized() {
        return color_is_initialized; 
    }

    /**
     * Getter method for webinventory.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.webinventory
     * <li>comments: Web Inventory
     * <li>default value: 0
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of webinventory
     */
    public Integer getWebinventory()
    {
        return webinventory; 
    }

    /**
     * Setter method for webinventory.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to webinventory
     */
    public void setWebinventory(Integer newVal) {
        if ((newVal != null && this.webinventory != null && (newVal.compareTo(this.webinventory) == 0)) || 
            (newVal == null && this.webinventory == null && webinventory_is_initialized)) {
            return; 
        } 
        this.webinventory = newVal; 
        webinventory_is_modified = true; 
        webinventory_is_initialized = true; 
    }

    /**
     * Setter method for webinventory.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to webinventory
     */
    public void setWebinventory(int newVal) {
        setWebinventory(new Integer(newVal));
    }

    /**
     * Determines if the webinventory has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isWebinventoryModified() {
        return webinventory_is_modified; 
    }

    /**
     * Determines if the webinventory has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isWebinventoryInitialized() {
        return webinventory_is_initialized; 
    }

    /**
     * Getter method for regbyid.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.regbyid
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
     * <li>full name: roomtype.regdate
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
     * <li>full name: roomtype.active
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
     * Getter method for ord.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.ord
     * <li>comments: ?????????
     * <li>default value: 0
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of ord
     */
    public Integer getOrd()
    {
        return ord; 
    }

    /**
     * Setter method for ord.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to ord
     */
    public void setOrd(Integer newVal) {
        if ((newVal != null && this.ord != null && (newVal.compareTo(this.ord) == 0)) || 
            (newVal == null && this.ord == null && ord_is_initialized)) {
            return; 
        } 
        this.ord = newVal; 
        ord_is_modified = true; 
        ord_is_initialized = true; 
    }

    /**
     * Setter method for ord.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to ord
     */
    public void setOrd(int newVal) {
        setOrd(new Integer(newVal));
    }

    /**
     * Determines if the ord has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isOrdModified() {
        return ord_is_modified; 
    }

    /**
     * Determines if the ord has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isOrdInitialized() {
        return ord_is_initialized; 
    }

    /**
     * Getter method for deleted.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: roomtype.deleted
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
        return roomtypeid_is_modified || 
		code_is_modified || 
		name_is_modified || 
		badult_is_modified || 
		bchild_is_modified || 
		madult_is_modified || 
		mchild_is_modified || 
		web_is_modified || 
		color_is_modified || 
		webinventory_is_modified || 
		regbyid_is_modified || 
		regdate_is_modified || 
		active_is_modified || 
		ord_is_modified || 
		deleted_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        roomtypeid_is_modified = false;
        code_is_modified = false;
        name_is_modified = false;
        badult_is_modified = false;
        bchild_is_modified = false;
        madult_is_modified = false;
        mchild_is_modified = false;
        web_is_modified = false;
        color_is_modified = false;
        webinventory_is_modified = false;
        regbyid_is_modified = false;
        regdate_is_modified = false;
        active_is_modified = false;
        ord_is_modified = false;
        deleted_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(RoomtypeBean bean) {
        setRoomtypeid(bean.getRoomtypeid());
        setCode(bean.getCode());
        setName(bean.getName());
        setBadult(bean.getBadult());
        setBchild(bean.getBchild());
        setMadult(bean.getMadult());
        setMchild(bean.getMchild());
        setWeb(bean.getWeb());
        setColor(bean.getColor());
        setWebinventory(bean.getWebinventory());
        setRegbyid(bean.getRegbyid());
        setRegdate(bean.getRegdate());
        setActive(bean.getActive());
        setOrd(bean.getOrd());
        setDeleted(bean.getDeleted());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[roomtype] "
                 + "\n - roomtype.roomtypeid = " + (roomtypeid_is_initialized ? ("[" + (roomtypeid == null ? null : roomtypeid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.code = " + (code_is_initialized ? ("[" + (code == null ? null : code.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.name = " + (name_is_initialized ? ("[" + (name == null ? null : name.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.badult = " + (badult_is_initialized ? ("[" + (badult == null ? null : badult.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.bchild = " + (bchild_is_initialized ? ("[" + (bchild == null ? null : bchild.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.madult = " + (madult_is_initialized ? ("[" + (madult == null ? null : madult.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.mchild = " + (mchild_is_initialized ? ("[" + (mchild == null ? null : mchild.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.web = " + (web_is_initialized ? ("[" + (web == null ? null : web.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.color = " + (color_is_initialized ? ("[" + (color == null ? null : color.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.webinventory = " + (webinventory_is_initialized ? ("[" + (webinventory == null ? null : webinventory.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.regbyid = " + (regbyid_is_initialized ? ("[" + (regbyid == null ? null : regbyid.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.regdate = " + (regdate_is_initialized ? ("[" + (regdate == null ? null : regdate.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.active = " + (active_is_initialized ? ("[" + (active == null ? null : active.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.ord = " + (ord_is_initialized ? ("[" + (ord == null ? null : ord.toString()) + "]") : "not initialized") + ""
                 + "\n - roomtype.deleted = " + (deleted_is_initialized ? ("[" + (deleted == null ? null : deleted.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}
