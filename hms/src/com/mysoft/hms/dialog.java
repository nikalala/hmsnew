/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.Vector;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author djorj
 */
public class dialog {
    
    private String title = "";
    private String type = "";
    private panel[] panels = new panel[0];
    private button[] buttons = new button[0];
    private long idl = new Date().getTime();

    public JSONObject getJson(){
        JSONObject obj = new JSONObject();
        
        obj.put("title",title);
        obj.put("type",type);
        JSONArray ar = new JSONArray();
        for(int i=0;i<panels.length;i++){
            JSONObject obj1 = panels[i].getJson();
            ar.add((JSONObject)obj1);
        }
        obj.put("panels",(JSONArray)ar);
        ar = new JSONArray();
        for(int i=0;i<buttons.length;i++){
            JSONObject obj1 = buttons[i].getJson();
            ar.add((JSONObject)obj1);
        }
        obj.put("buttons",(JSONArray)ar);
        return obj;
    }
    
    public void readJson(JSONObject obj){
        
        title = (String)obj.get("title");
        type = (String)obj.get("type");
        JSONArray ar = (JSONArray)obj.get("panels");
        panels = new panel[ar.size()];
        for(int i=0;i<ar.size();i++){
            JSONObject obj1 = (JSONObject)ar.get(i);
            panels[i] = new panel();
            panels[i].readJson(obj1);
        }
        ar = (JSONArray)obj.get("buttons");
        buttons = new button[ar.size()];
        for(int i=0;i<ar.size();i++){
            JSONObject obj1 = (JSONObject)ar.get(i);
            buttons[i] = new button();
            buttons[i].readJson(obj1);
        }
    }
    
    public void saveJson(String fl) throws Exception {
        String js = getJson().toString();
        FileOutputStream fo = new FileOutputStream(fl);
        fo.write(js.getBytes("UTF-8"));
        fo.close();
    }
    
    public void readFromFile(String fl) throws Exception {
        
        FileInputStream fi = new FileInputStream(fl);
        byte[] bt = new byte[fi.available()];
        fi.read(bt);
        fi.close();
        String json = new String(bt, "UTF-8");
        JSONObject obj = JSONObject.fromObject((String)json);
        readJson(obj);
    }

    public long getIdl() {
        return idl;
    }

    public void setIdl(long idl) {
        this.idl = idl;
    }
    
    public dialog() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public panel[] getPanels() {
        return panels;
    }

    public void setPanels(panel[] panels) {
        this.panels = panels;
    }

    public button[] getButtons() {
        return buttons;
    }

    public void setButtons(button[] buttons){
        this.buttons = buttons;
    }
    
    public String getParams(){
        String s = "";
        
        for(int i=0;i<panels.length;i++){
            for(int j=0;j<panels[i].getPanelitems().size();j++){
                panelitem pi = (panelitem)panels[i].getPanelitems().elementAt(j);
        //        if(j > 0)   s += ",\n";
                s += pi.getParam();
            }
        }
        
        s += "act: \"save\"";
        return s;
    }
    
    public String draw() throws Exception {
        String data = "";
        String script = "";
        for(int i=0;i<panels.length;i++){
            data += panels[i].drawpanel();
            if(panels[i].getScript().length() > 0)
                script += " "+panels[i].getScript();
        }
        
        String s = "";
        
        s += "var $textAndPic = $('<div></div>');\n" +
        "        $textAndPic.append('"+data+"');\n" +
        "        $currentmodal = new BootstrapDialog({\n" +
        "            type: BootstrapDialog.TYPE_PRIMARY,\n" +
        "            size: BootstrapDialog.SIZE_"+type+",\n" +
        "            message: $textAndPic,\n" +
        "            closable: true,\n" +
        "            title: '"+title+"'";
        for(int i=0;i<buttons.length;i++){
            if(i == 0)  s += ",\nbuttons: [\n";
            s += buttons[i].draw();
            if(i == buttons.length-1)   s += "            ]\n";
            else s += ",\n";
        }
        s += "        });\n$currentmodal.open();\n";
        //if(script.length() > 0) s += script+"\n";
        return s;
    }
}
