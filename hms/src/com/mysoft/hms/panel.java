/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author djorj
 */
public class panel {
    
    private String title;
    private String id;
    private String classnames;
    private String height;
    private Vector panelitems;
    
    public void panel(){}

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
        
        String s = "<div class=\"panel panel-default\" id=\""+id+"\" style=\"margin-top: 0px; height: "+height+"px; font-family: bgmtavr;\">\n" +
                "<div class=\"panel-heading  panel-title\">\n" +
                "<b style='vertical-align: middle; color: #FFFFFF; font-family: bgmtavr;'>"+title+"</b>\n" +
                "</div>\n" +
                "<div class=\"panel-body\" style=\"background-color: #FFFFFF;\">\n" +
                "<div class=\"input-group\" style=\"width: 98%;\">\n";
        
                List<Integer> tmp = Collections.list(hy.keys());
                Collections.sort(tmp);
                Iterator<Integer> it = tmp.iterator();
                int cols = 16;
                while(it.hasNext()){
                    Integer n = (Integer)it.next();
                    Vector v = (Vector)hy.get(n);
                    int colmd = cols/v.size();
                    for(int i=0;i<v.size();i++){
                        panelitem pi = (panelitem)panelitems.elementAt(i);
                        if(i == v.size()-1) colmd = cols-colmd*(v.size()-1);
                        s += pi.drawitem(classnames,colmd);
                    }
                    //here you can get ordered things: 'your_hashtable'.get(element);
                }
        
                s += "</div>\n" +
                "</div>\n" +
                "</div>";
        return s;
    }
    
}
