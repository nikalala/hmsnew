/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.sql.Connection;
import java.sql.ResultSet;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author djorj
 */
public class panelitem {
    
    private String label = "";
    private int type = 0; // 0: text, 1: textarea; 2: select; 3: radio; 4: checkbox; 5: date; 6: time; 7: button; 8: label
    private int size1 = 0;
    private int size2 = 0;
    private String sql = "";
    private String[] values = new String[0];
    private int x = 0;
    private int y = 0;
    private String id = "";
    private String val = "";
    private String placeholder = "";
    private int colmd = 16;
    private String onclick = "";
    private String classname = "";
    private String script = "";
    private String pkfmt = "{autoclose: true, format: dateglobalformat1, maxDate : dateglobalmaxdate, language: \"ka\", todayHighlight: true, allowEmpty: false}";
    private int checkboxes = 0;
    
    public void panelitem(){}
    
    public void init(String label, String id, int type, int size1, int size2, String sql, String[] values, int x, int y, String val, String placeholder, int colmd, String onclick, String classname){
        this.label = label;
        this.type = type;
        this.id = id;
        this.size1 = size1;
        this.size2 = size2;
        this.sql = sql;
        this.val = val;
        this.x = x;
        this.y = y;
        this.placeholder = placeholder;
        this.colmd = colmd;
        this.onclick = onclick;
        this.classname = classname;
        this.values = new String[values.length];
        for(int i=0;i<values.length;i++){
            this.values[i] = values[i];
        }
    }
    
    public String getParam(){
        String s = "";
        switch(type){
            case 0:
            case 1:
            case 2:
                s += id+": $(\"#"+id+"\").val(),\n";
                break;
            case 3:
                s += id+": $(\"input[name="+id+"]:checked\").val(),\n";
                
                break;
            case 4:
                for(int i=0;i<checkboxes;i++){
                    s += id+i+": $(\"#"+id+"\").is(\":checked\"),\n";
                }
                break;
            case 5:
            case 6:
                s += id+": $(\"#"+id+"\").val(),\n";
                break;
            default:
        }
        return s;
    }

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    
    public int getColmd() {
        return colmd;
    }

    public void setColmd(int colmd) {
        this.colmd = colmd;
    }

    public String getPlaceholder() {
        return placeholder;
    }

    public void setPlaceholder(String placeholder) {
        this.placeholder = placeholder;
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
    
    public JSONObject getJson(){
        JSONObject obj = new JSONObject();
        
        obj.put("type",(Integer)type);
        obj.put("size1",(Integer)size1);
        obj.put("size2",(Integer)size2);
        obj.put("x",(Integer)x);
        obj.put("y",(Integer)y);
        obj.put("colmd",(Integer)colmd);
        obj.put("sql",sql);
        obj.put("label",label);
        obj.put("id",id);
        obj.put("val",val);
        obj.put("placeholder",placeholder);
        obj.put("onclick",onclick);
        obj.put("classname",classname);
        obj.put("script",script);
        JSONArray ar = new JSONArray();
        for(int i=0;i<values.length;i++){
            ar.add(values[i]);
        }
        obj.put("values",(JSONArray)ar);
        return obj;
    }
    
    public void readJson(JSONObject obj){
        
        type = (Integer)obj.get("type");
        size1 = (Integer)obj.get("size1");
        size2 = (Integer)obj.get("size2");
        x = (Integer)obj.get("x");
        y = (Integer)obj.get("y");
        colmd = (Integer)obj.get("colmd");
        
        sql = (String)obj.get("sql");
        label = (String)obj.get("label");
        id = (String)obj.get("id");
        val = (String)obj.get("val");
        placeholder = (String)obj.get("placeholder");
        onclick = (String)obj.get("onclick");
        classname = (String)obj.get("classname");
        script = (String)obj.get("script");
        if(script == null)  script = "";
        JSONArray ar = (JSONArray)obj.get("values");
        values = new String[ar.size()];
        for(int i=0;i<ar.size();i++){
            values[i] = (String)ar.getString(i);
        }
    }
    
    public String drawitem() throws Exception {
        String s = "";
        String mclass = "form-control";
        switch(type){
            case 0:
                s += "<div class=\"col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                s += "<input type=\"text\" class=\"form-control pull-right "+classname+"\" size=\""+size1+"\" name=\""+id+"\" id=\""+id+"\" value=\""+val+"\"";
                if(placeholder.length() > 0)    s += " placeholder=\""+placeholder+"\"";
                s += "/></div>";
                break;
            case 1:
                s += "<div class=\"col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                s += "<textarea class=\"form-control pull-right "+classname+"\" cols=\""+size1+"\" rows=\""+size2+"\" name=\""+id+"\" id=\""+id+"\"";
                if(placeholder.length() > 0)    s += " placeholder=\""+placeholder+"\"";
                s += ">"+val+"</textarea>";
                s += "</div>";
                break;
            case 2:
                s += "<div class=\"col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                s += "<select class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+"\">";
                if(placeholder.length() > 0)    s += "<option value=\"\">"+ placeholder+"</option>";
                if(sql.length() > 0){
                    Connection con = Manager.getInstance().getConnection();
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    for(int i=0;rs.next();i++){
                        String vl = rs.getString(1);
                        String nm = rs.getString(2);
                        s += "<option value=\""+vl+"\"";
                        if(val.equalsIgnoreCase(vl) || val.equalsIgnoreCase(nm))
                            s += " selected";
                        s += ">"+nm+"</option>";
                    }
                    rs.close();
                    Manager.getInstance().releaseConnection(con);
                } else {
                    for(int i=0;i<values.length;i++){
                        s += "<option value=\""+i+"\"";
                        if(val.equalsIgnoreCase(String.valueOf(i)) || val.equalsIgnoreCase(values[i]))
                            s += " selected";
                        s += ">"+values[i]+"</option>";
                    }
                }
                s += "</select>"
                        + "</div>";
                break;
            case 3:
                s += "<div class=\"col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                if(sql.length() > 0){
                    Connection con = Manager.getInstance().getConnection();
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    for(int i=0;rs.next();i++){
                        String vl = rs.getString(1);
                        String nm = rs.getString(2);
                        s += "<input type=\"radio\" class=\"css-checkbox\" name=\""+id+"\" id=\""+id+i+"\" value=\""+vl+"\"";
                        if(val.equalsIgnoreCase(vl) || val.equalsIgnoreCase(nm))
                            s += " checked";
                        s += ">";
                        s += "<label for=\""+id+i+"\" class=\"css-label radGroup1\" style=\"padding-right: 10px;\">"+nm+"</label>";
                    }
                    rs.close();
                    Manager.getInstance().releaseConnection(con);
                } else {
                    for(int i=0;i<values.length;i++){
                        s += "<input type=\"radio\" class=\"css-checkbox\" name=\""+id+"\" id=\""+id+i+"\" value=\""+i+"\"";
                        if(val.equalsIgnoreCase(String.valueOf(i)) || val.equalsIgnoreCase(values[i]))
                            s += " checked";
                        s += ">";
                        s += "<label for=\""+id+i+"\" class=\"css-label radGroup1\" style=\"padding-right: 10px;\">"+values[i]+"</label>";
                    }
                }
                s += "</div>";
                break;
            case 4:
                s += "<div class=\""+mclass+" col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                if(sql.length() > 0){
                    Connection con = Manager.getInstance().getConnection();
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    for(int i=0;rs.next();i++){
                        String vl = rs.getString(1);
                        String nm = rs.getString(2);
                        s += "<input type=\"checkbox\" class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+i+"\" value=\""+vl+"\"";
                        if(val.equalsIgnoreCase(vl) || val.equalsIgnoreCase(nm))
                            s += " checked";
                        s += ">"+nm+"";
                        checkboxes++;
                    }
                    rs.close();
                    Manager.getInstance().releaseConnection(con);
                } else {
                    for(int i=0;i<values.length;i++){
                        s += "<input type=\"radio\" class=\"form-control "+classname+"\" name=\""+id+"\" id=\""+id+i+"\" value=\""+i+"\"";
                        if(val.equalsIgnoreCase(String.valueOf(i)) || val.equalsIgnoreCase(values[i]))
                            s += " checked";
                        s += ">"+values[i]+"";
                        checkboxes++;
                    }
                }
                s += "</div>";
                break;
            case 5:
                s += "<div class=\"col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                s += "<input type=\"text\" class=\"form-control pull-right "+classname+"\" size=\""+size1+"\" name=\""+id+"\" id=\""+id+"\" value=\""+val+"\"";
                if(placeholder.length() > 0)    s += " placeholder=\""+placeholder+"\"";
                s += "/></div>";
                script += "$('#"+id+"').datepicker(<%=pkfmt%>)";
                if(onclick.length() > 0)    script += ".on('changeDate', function (e) {"+onclick+"});";
                else                        script += ";";
                break;
            case 6:
                s += "<div class=\"col-md-"+colmd+"\">";
                //if(label.length() > 0)  s += "<span>"+label+"</span>";
                s += "<input type=\"text\" class=\"form-control pull-right "+classname+"\" size=\""+size1+"\" name=\""+id+"\" id=\""+id+"\" value=\""+val+"\"";
                if(placeholder.length() > 0)    s += " placeholder=\""+placeholder+"\"";
                s += "/></div>";
                break;
            case 7:
                s += "<div class=\"col-md-"+colmd+"\" style=\"text-align: left;\"><a class=\"btn btn-primary\" style=\"background-color: #EEE; color: gray; border-color: #ccc;\"";
                if(onclick.length() > 0)    s += " onclick=\""+onclick.replaceAll("'", "\\\\'")+"\"";
                s += "><i class=\"fa fa-"+classname+"\"></i></a></div>";
                break;
            case 8:
                s += "<span class=\"pull-left col-md-"+colmd+"\" style=\"line-height: 2.5;\"><b>"+label+"</b></span>";
            default:
        }
        return s;
    }
}
