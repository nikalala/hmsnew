/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.util.Vector;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author djorj
 */
public class button {
    
    private String value = "";
    private String classname = "";
    private String action = "";
    private boolean close = false;

    
    public JSONObject getJson(){
        JSONObject obj = new JSONObject();
        
        obj.put("value",value);
        obj.put("action",action);
        obj.put("close",(Boolean)close);
        obj.put("classname",classname);
        return obj;
    }
    
    public void readJson(JSONObject obj){
        
        value = (String)obj.get("value");
        action = (String)obj.get("action");
        close = (Boolean)obj.get("close");
        classname = (String)obj.get("classname");
    }
    
    public button() {
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public boolean isClose() {
        return close;
    }

    public void setClose(boolean close) {
        this.close = close;
    }
    
    public String draw(){
        String s = "{label: '"+value+"',";
        s += "cssClass: '"+classname+"',";
        if(close)   s += "action: function(dlg){ dlg.close(); }";
        else        s += "action: function(){ "+action+" }";
        s += "}";
        
        return s;
    }
    
}
