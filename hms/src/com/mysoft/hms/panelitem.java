/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author djorj
 */
public class panelitem {
    
    private String label;
    private int type; // 0: text, 1: textarea; 2: select; 3: radio; 4: checkbox; 5: date; 6: time
    private int size1;
    private int size2;
    private String sql;
    private String[] values;
    private int x;
    private int y;
    private String id;
    private String val;
    
    public void panelitem(){}
    
    public void init(String label, String id, int type, int size1, int size2, String sql, String[] values, int x, int y, String val){
        this.label = label;
        this.type = type;
        this.id = id;
        this.size1 = size1;
        this.size2 = size2;
        this.sql = sql;
        this.val = val;
        this.x = x;
        this.y = y;
        this.values = new String[values.length];
        for(int i=0;i<values.length;i++){
            this.values[i] = values[i];
        }
    }

    public String getVal() {
        return val;
    }

    public void setVal(String val) {
        this.val = val;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getSize1() {
        return size1;
    }

    public void setSize1(int size1) {
        this.size1 = size1;
    }

    public int getSize2() {
        return size2;
    }

    public void setSize2(int size2) {
        this.size2 = size2;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public String[] getValues() {
        return values;
    }

    public void setValues(String[] values) {
        this.values = values;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }
    
    public String drawitem(String classname,int colmd) throws Exception {
        String s = "";
        String mclass = "form-inline";
        switch(type){
            case 0:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>"
                        + "<input type=\"text\" class=\"form-control "+classname+"\" size=\""+size1+"\" name=\""+id+"\" id=\""+id+"\" value=\""+val+"\"/>"
                        + "</div>";
                break;
            case 1:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>"
                        + "<textarea class=\"form-control "+classname+"\" cols=\""+size1+"\" rows=\""+size2+"\" name=\""+id+"\" id=\""+id+"\">"+val+"</textarea>"
                        + "</div>";
                break;
            case 2:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>"
                        + "<select class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+"\">\n";
                if(sql.length() > 0){
                    Connection con = Manager.getInstance().getConnection();
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    for(int i=0;rs.next();i++){
                        String vl = rs.getString(1);
                        String nm = rs.getString(2);
                        s += "<option value=\""+vl+"\"";
                        if(val.equalsIgnoreCase(vl) || val.equalsIgnoreCase(nm))
                            s += " selected";
                        s += ">"+nm+"</option>\n";
                    }
                    rs.close();
                    Manager.getInstance().releaseConnection(con);
                } else {
                    for(int i=0;i<values.length;i++){
                        s += "<option value=\""+i+"\"";
                        if(val.equalsIgnoreCase(String.valueOf(i)) || val.equalsIgnoreCase(values[i]))
                            s += " selected";
                        s += ">"+values[i]+"</option>\n";
                    }
                }
                s += "</select>"
                        + "</div>";
                break;
            case 3:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>";
                if(sql.length() > 0){
                    Connection con = Manager.getInstance().getConnection();
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    for(int i=0;rs.next();i++){
                        String vl = rs.getString(1);
                        String nm = rs.getString(2);
                        s += "<input type=\"radio\" class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+i+"\" value=\""+vl+"\"";
                        if(val.equalsIgnoreCase(vl) || val.equalsIgnoreCase(nm))
                            s += " checked";
                        s += ">"+nm+"\n";
                    }
                    rs.close();
                    Manager.getInstance().releaseConnection(con);
                } else {
                    for(int i=0;i<values.length;i++){
                        s += "<input type=\"radio\" class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+i+"\" value=\""+i+"\"";
                        if(val.equalsIgnoreCase(String.valueOf(i)) || val.equalsIgnoreCase(values[i]))
                            s += " checked";
                        s += ">"+values[i]+"\n";
                    }
                }
                s += "</select>"
                        + "</div>";
                break;
            case 4:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>";
                if(sql.length() > 0){
                    Connection con = Manager.getInstance().getConnection();
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    for(int i=0;rs.next();i++){
                        String vl = rs.getString(1);
                        String nm = rs.getString(2);
                        s += "<input type=\"checkbox\" class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+i+"\" value=\""+vl+"\"";
                        if(val.equalsIgnoreCase(vl) || val.equalsIgnoreCase(nm))
                            s += " checked";
                        s += ">"+nm+"\n";
                    }
                    rs.close();
                    Manager.getInstance().releaseConnection(con);
                } else {
                    for(int i=0;i<values.length;i++){
                        s += "<input type=\"radio\" class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+i+"\" value=\""+i+"\"";
                        if(val.equalsIgnoreCase(String.valueOf(i)) || val.equalsIgnoreCase(values[i]))
                            s += " checked";
                        s += ">"+values[i]+"\n";
                    }
                }
                s += "</select>"
                        + "</div>";
                break;
            case 5:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>"
                        + "<input type=\"text\" class=\"form-control "+classname+"\" size=\""+size1+"\" name=\""+id+"\" id=\""+id+"\" value=\""+val+"\"/>"
                        + "</div>";
                break;
            case 6:
                s = "<div class=\""+mclass+" col-md-"+colmd+"\">"
                        + "<span>"+label+"</span>"
                        + "<input type=\"text\" class=\"form-control "+classname+"\" size=\""+size1+"\" name=\""+id+"\" id=\""+id+"\" value=\""+val+"\"/>"
                        + "</div>";
                break;
            default:
                
            
        }
        
        return s;
    }
}
