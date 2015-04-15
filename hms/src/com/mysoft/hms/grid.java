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
public class grid {

    public class gridcolumn {

        private String label = "";
        private String name = "";
        private String index = "";
        private int width = 100;
        private boolean hidden = false;
        private String align = "left";
        
        public gridcolumn() {
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getIndex() {
            return index;
        }

        public void setIndex(String index) {
            this.index = index;
        }

        public int getWidth() {
            return width;
        }

        public void setWidth(int width) {
            this.width = width;
        }

        public boolean isHidden() {
            return hidden;
        }

        public void setHidden(boolean hidden) {
            this.hidden = hidden;
        }

        public String getAlign() {
            return align;
        }

        public void setAlign(String align) {
            this.align = align;
        }
        
        public void readJson(JSONObject obj){
        
            width = (Integer)obj.get("width");
            label = (String)obj.get("label");
            name = (String)obj.get("name");
            index = (String)obj.get("index");
            align = (String)obj.get("align");
            hidden = (Boolean)obj.get("hidden");
        }
        
        public String getModel(){
            String s = "";
            
            s += "{width: "+width+", hidden: "+hidden+", name:\""+name+"\", index:\""+index+"\", align:\""+align+"\"}";
            
            return s;
        }
        
    }
    
    private String url = "";
    private String sortname = "";
    private boolean multiselect = false;
    private boolean footerrow = false;
    private String id = "";
    private gridcolumn[] columns = new gridcolumn[0];

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSortname() {
        return sortname;
    }

    public void setSortname(String sortname) {
        this.sortname = sortname;
    }

    public boolean isMultiselect() {
        return multiselect;
    }

    public void setMultiselect(boolean multiselect) {
        this.multiselect = multiselect;
    }

    public boolean isFooterrow() {
        return footerrow;
    }

    public void setFooterrow(boolean footerrow) {
        this.footerrow = footerrow;
    }

    public gridcolumn[] getColumns() {
        return columns;
    }

    public void setColumns(gridcolumn[] columns) {
        this.columns = columns;
    }
    
    
    
    public grid() {
    }
    
    public void readJson(JSONObject obj){
        url = (String)obj.get("url");
        sortname = (String)obj.get("sortname");
        id = (String)obj.get("id");
        multiselect = (Boolean)obj.get("multiselect");
        footerrow = (Boolean)obj.get("footerrow");
        JSONArray ar = (JSONArray)obj.get("columns");
        columns = new gridcolumn[ar.size()];
        for(int i=0;i<ar.size();i++){
            JSONObject obj1 = (JSONObject)ar.get(i);
            columns[i] = new gridcolumn();
            columns[i].readJson(obj1);
        }
    }
    
    public String drawGrid(){
        String s = "jQuery(\"#"+id+"\").jqGrid({ url:\""+url+"\", datatype: \"xml\", rowNum:2000, autowidth: true, sortname: \""+sortname+"\", viewrecords: true, sortorder: \"asc\", altRows: true, altclass: \"altrow\",";
        if(footerrow)
            s += " footerrow : true, userDataOnFooter:true,";
        else
            s += " footerrow : false, userDataOnFooter:false,";
        if(multiselect)
            s += " multiselect: true, multikey: \"ctrlKey\",";
        else
            s += " multiselect: false,";
        s += " colNames:[";
        String s1 = "colModel:[";
        for(int i=0;i<columns.length;i++){
            if(i > 0) {
                s += ",";
                s1 += ",";
            }
            s += "'"+columns[i].getLabel()+"'";
            s1 += columns[i].getModel();
        }
        s += "],";
        s1 += "]";
        s += s1;
        s += "}).jqGrid(\"bindKeys\");";
        
        return s;
    }
}
