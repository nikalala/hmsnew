/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft.hms;

import java.util.Date;

/**
 *
 * @author djorj
 */
public class dialog {
    
    private String title = "";
    private String type = "";
    private panel[] panels = new panel[0];
    private button[] buttons = new button[0];

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
    
    public String draw() throws Exception {
        String data = "";
        
        for(int i=0;i<panels.length;i++){
            data += panels[i].drawpanel();
        }
        
        String s = "";
        
        s += "var $textAndPic = $('<div></div>');\n" +
        "        $textAndPic.append('"+data+"');\n" +
        "        BootstrapDialog.show({\n" +
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
        s += "        });";
        return s;
    }
}
