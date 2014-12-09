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


public class ConfmailBean
// extends+ 

// extends- 

{
    private Integer confmailid;
    private boolean confmailid_is_modified = false;
    private boolean confmailid_is_initialized = false;
    
    private String smtp;
    private boolean smtp_is_modified = false;
    private boolean smtp_is_initialized = false;
    
    private Integer port;
    private boolean port_is_modified = false;
    private boolean port_is_initialized = false;
    
    private String username;
    private boolean username_is_modified = false;
    private boolean username_is_initialized = false;
    
    private String pass;
    private boolean pass_is_modified = false;
    private boolean pass_is_initialized = false;
    
    private String frommail;
    private boolean frommail_is_modified = false;
    private boolean frommail_is_initialized = false;
    
    private boolean _isNew = true;
    
    /**
     * Do not use this constructor directly, please use the factory method
     * available in the associated manager.
     */
    ConfmailBean()
    {
    }
    
    /**
     * Getter method for confmailid.
     * <br>
     * PRIMARY KEY.<br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: confmail.confmailid
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of confmailid
     */
    public Integer getConfmailid()
    {
        return confmailid; 
    }

    /**
     * Setter method for confmailid.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to confmailid
     */
    public void setConfmailid(Integer newVal) {
        if ((newVal != null && this.confmailid != null && (newVal.compareTo(this.confmailid) == 0)) || 
            (newVal == null && this.confmailid == null && confmailid_is_initialized)) {
            return; 
        } 
        this.confmailid = newVal; 
        confmailid_is_modified = true; 
        confmailid_is_initialized = true; 
    }

    /**
     * Setter method for confmailid.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to confmailid
     */
    public void setConfmailid(int newVal) {
        setConfmailid(new Integer(newVal));
    }

    /**
     * Determines if the confmailid has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isConfmailidModified() {
        return confmailid_is_modified; 
    }

    /**
     * Determines if the confmailid has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isConfmailidInitialized() {
        return confmailid_is_initialized; 
    }

    /**
     * Getter method for smtp.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: confmail.smtp
     * <li>column size: 2147483647
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of smtp
     */
    public String getSmtp()
    {
        return smtp; 
    }

    /**
     * Setter method for smtp.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to smtp
     */
    public void setSmtp(String newVal) {
        if ((newVal != null && this.smtp != null && (newVal.compareTo(this.smtp) == 0)) || 
            (newVal == null && this.smtp == null && smtp_is_initialized)) {
            return; 
        } 
        this.smtp = newVal; 
        smtp_is_modified = true; 
        smtp_is_initialized = true; 
    }

    /**
     * Determines if the smtp has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isSmtpModified() {
        return smtp_is_modified; 
    }

    /**
     * Determines if the smtp has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isSmtpInitialized() {
        return smtp_is_initialized; 
    }

    /**
     * Getter method for port.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: confmail.port
     * <li>column size: 10
     * <li>jdbc type returned by the driver: Types.INTEGER
     * </ul>
     *
     * @return the value of port
     */
    public Integer getPort()
    {
        return port; 
    }

    /**
     * Setter method for port.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to port
     */
    public void setPort(Integer newVal) {
        if ((newVal != null && this.port != null && (newVal.compareTo(this.port) == 0)) || 
            (newVal == null && this.port == null && port_is_initialized)) {
            return; 
        } 
        this.port = newVal; 
        port_is_modified = true; 
        port_is_initialized = true; 
    }

    /**
     * Setter method for port.
     * <br>
     * Convenient for those who do not want to deal with Objects for primary types.
     *
     * @param newVal the new value to be assigned to port
     */
    public void setPort(int newVal) {
        setPort(new Integer(newVal));
    }

    /**
     * Determines if the port has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPortModified() {
        return port_is_modified; 
    }

    /**
     * Determines if the port has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPortInitialized() {
        return port_is_initialized; 
    }

    /**
     * Getter method for username.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: confmail.username
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of username
     */
    public String getUsername()
    {
        return username; 
    }

    /**
     * Setter method for username.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to username
     */
    public void setUsername(String newVal) {
        if ((newVal != null && this.username != null && (newVal.compareTo(this.username) == 0)) || 
            (newVal == null && this.username == null && username_is_initialized)) {
            return; 
        } 
        this.username = newVal; 
        username_is_modified = true; 
        username_is_initialized = true; 
    }

    /**
     * Determines if the username has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isUsernameModified() {
        return username_is_modified; 
    }

    /**
     * Determines if the username has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isUsernameInitialized() {
        return username_is_initialized; 
    }

    /**
     * Getter method for pass.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: confmail.pass
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of pass
     */
    public String getPass()
    {
        return pass; 
    }

    /**
     * Setter method for pass.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to pass
     */
    public void setPass(String newVal) {
        if ((newVal != null && this.pass != null && (newVal.compareTo(this.pass) == 0)) || 
            (newVal == null && this.pass == null && pass_is_initialized)) {
            return; 
        } 
        this.pass = newVal; 
        pass_is_modified = true; 
        pass_is_initialized = true; 
    }

    /**
     * Determines if the pass has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isPassModified() {
        return pass_is_modified; 
    }

    /**
     * Determines if the pass has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isPassInitialized() {
        return pass_is_initialized; 
    }

    /**
     * Getter method for frommail.
     * <br>
     * Meta Data Information (in progress):
     * <ul>
     * <li>full name: confmail.frommail
     * <li>column size: 255
     * <li>jdbc type returned by the driver: Types.VARCHAR
     * </ul>
     *
     * @return the value of frommail
     */
    public String getFrommail()
    {
        return frommail; 
    }

    /**
     * Setter method for frommail.
     * <br>
     * The new value is set only if compareTo() says it is different,
     * or if one of either the new value or the current value is null.
     * In case the new value is different, it is set and the field is marked as 'modified'.
     *
     * @param newVal the new value to be assigned to frommail
     */
    public void setFrommail(String newVal) {
        if ((newVal != null && this.frommail != null && (newVal.compareTo(this.frommail) == 0)) || 
            (newVal == null && this.frommail == null && frommail_is_initialized)) {
            return; 
        } 
        this.frommail = newVal; 
        frommail_is_modified = true; 
        frommail_is_initialized = true; 
    }

    /**
     * Determines if the frommail has been modified.
     *
     * @return true if the field has been modified, false if the field has not been modified
     */
    public boolean isFrommailModified() {
        return frommail_is_modified; 
    }

    /**
     * Determines if the frommail has been initialized.
     * <br>
     * It is useful to determine if a field is null on purpose or just because it has not been initialized.
     *
     * @return true if the field has been initialized, false otherwise
     */
    public boolean isFrommailInitialized() {
        return frommail_is_initialized; 
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
        return confmailid_is_modified || 
		smtp_is_modified || 
		port_is_modified || 
		username_is_modified || 
		pass_is_modified || 
		frommail_is_modified;
    }

    /**
     * Resets the object modification status to 'not modified'.
     */
    public void resetIsModified() {
        confmailid_is_modified = false;
        smtp_is_modified = false;
        port_is_modified = false;
        username_is_modified = false;
        pass_is_modified = false;
        frommail_is_modified = false;
    }

    /**
     * Copies the passed bean into the current bean.
     *
     * @param bean the bean to copy into the current bean
     */
    public void copy(ConfmailBean bean) {
        setConfmailid(bean.getConfmailid());
        setSmtp(bean.getSmtp());
        setPort(bean.getPort());
        setUsername(bean.getUsername());
        setPass(bean.getPass());
        setFrommail(bean.getFrommail());
    }

    /**
     * Returns the object string representation.
     *
     * @return the object as a string
     */
    public String toString() {
        return   "\n[confmail] "
                 + "\n - confmail.confmailid = " + (confmailid_is_initialized ? ("[" + (confmailid == null ? null : confmailid.toString()) + "]") : "not initialized") + ""
                 + "\n - confmail.smtp = " + (smtp_is_initialized ? ("[" + (smtp == null ? null : smtp.toString()) + "]") : "not initialized") + ""
                 + "\n - confmail.port = " + (port_is_initialized ? ("[" + (port == null ? null : port.toString()) + "]") : "not initialized") + ""
                 + "\n - confmail.username = " + (username_is_initialized ? ("[" + (username == null ? null : username.toString()) + "]") : "not initialized") + ""
                 + "\n - confmail.pass = " + (pass_is_initialized ? ("[" + (pass == null ? null : pass.toString()) + "]") : "not initialized") + ""
                 + "\n - confmail.frommail = " + (frommail_is_initialized ? ("[" + (frommail == null ? null : frommail.toString()) + "]") : "not initialized") + ""
            ;
    }

// class+ 

// class- 

}