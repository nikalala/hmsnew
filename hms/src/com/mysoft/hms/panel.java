/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.io.FileOutputStream;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author djorj
 */
public class panel {
    
    private String title = "";
    private String id = "";
    private String classnames = "";
    private String height = "100%";
    private Vector panelitems = new Vector();
    private int colmd = 16;
    private String script = "";
    
    public JSONObject getJson(){
        JSONObject obj = new JSONObject();
        
        obj.put("colmd",(Integer)colmd);
        obj.put("title",title);
        obj.put("height",height);
        obj.put("id",id);
        obj.put("classnames",classnames);
        JSONArray ar = new JSONArray();
        for(int i=0;i<panelitems.size();i++){
            panelitem pl = (panelitem)panelitems.elementAt(i);
            JSONObject obj1 = pl.getJson();
            ar.add((JSONObject)obj1);
        }
        obj.put("panelitems",(JSONArray)ar);
        return obj;
    }
    
    public void readJson(JSONObject obj){
        
        colmd = (Integer)obj.get("colmd");
        
        title = (String)obj.get("title");
        height = (String)obj.get("height");
        id = (String)obj.get("id");
        classnames = (String)obj.get("classnames");
        JSONArray ar = (JSONArray)obj.get("panelitems");
        panelitems = new Vector();
        for(int i=0;i<ar.size();i++){
            JSONObject obj1 = (JSONObject)ar.get(i);
            panelitem pl = new panelitem();
            pl.readJson(obj1);
            panelitems.addElement((panelitem)pl);
        }
    }
    
    public void saveJson(String fl) throws Exception {
        String js = getJson().toString();
        FileOutputStream fo = new FileOutputStream(fl);
        fo.write(js.getBytes("UTF-8"));
        fo.close();
    }
    
    public void panel(){}

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }

    public int getColmd() {
        return colmd;
    }

    public void setColmd(int colmd) {
        this.colmd = colmd;
    }

    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClassnames() {
        return classnames;
    }

    public void setClassnames(String classnames) {
        this.classnames = classnames;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Vector getPanelitems() {
        return panelitems;
    }

    public void setPanelitems(Vector panelitems) {
        this.panelitems = panelitems;
    }
    
    public String drawpanel() throws Exception {
        
        Hashtable hy = new Hashtable();
        for(int i=0;i<panelitems.size();i++){
            panelitem pi = (panelitem)panelitems.elementAt(i);
            int x = pi.getX();
            int y = pi.getY();
            Vector v = (Vector)hy.get((Integer)y);
            if(v == null) v = new Vector();
            boolean inserted = false;
            for(int j=0;j<v.size();j++){
                panelitem pi0 = (panelitem)v.elementAt(j);
                if(x < pi0.getX()){
                    v.insertElementAt((panelitem)pi,j);
                    inserted = true;
                    break;
                }
            }
            if(!inserted) v.addElement((panelitem)pi);
            hy.put((Integer)y,(Vector)v);
        }
        
        String s = "<div style=\"border: 5px solid transparent;\" class=\"col-md-"+colmd+"\"><div class=\"panel panel-default col-md-16\" id=\""+id+"\" style=\"margin-top: 0px; padding: 0px; border-radius: 5px; height: "+height+"px;\">" +
                "<div class=\"panel-heading  panel-title\">" +
                "<b style=\"vertical-align: middle; color: #5AB2E3; font-family: bgmtavr;\">"+title+"</b>" +
                "</div>" +
                "<div class=\"panel-body\" style=\"background-color: #FFFFFF;\">" +
                "<div class=\"input-group col-md-16\">";
        
                List<Integer> tmp = Collections.list(hy.keys());
                Collections.sort(tmp);
                Iterator<Integer> it = tmp.iterator();
                //int cols = 16;
                while(it.hasNext()){
                    Integer n = (Integer)it.next();
                    Vector v = (Vector)hy.get(n);
                    //int colmd = cols/v.size();
                    s += "<div style=\"padding-bottom: 7px;\" class=\"input-group col-md-16\">";
                    for(int i=0;i<v.size();i++){
                        panelitem pi = (panelitem)v.elementAt(i);
                        //if(i == v.size()-1) colmd = cols-colmd*(v.size()-1);
                        s += pi.drawitem();
                        if(pi.getScript() != null && pi.getScript().trim().length() > 0)
                            script += " "+pi.getScript();
                    }
                    s += "</div>";
                }
        
                s += "</div>" +
                "</div>" +
                "</div></div>";
        return s;
    }
    
}
