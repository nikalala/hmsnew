/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft;

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
    
    public void panelitem(){}
    
    public void init(String label, int type, int size1, int size2, String sql, String[] values, int x, int y){
        this.label = label;
        this.type = type;
        this.size1 = size1;
        this.size2 = size2;
        this.sql = sql;
        this.x = x;
        this.y = y;
        this.values = new String[values.length];
        for(int i=0;i<values.length;i++){
            this.values[i] = values[i];
        }
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
    
    public String drawitem(String classname){
        String s = "";
        
        switch(type){
            case 0:
                
        }
        
        return s;
    }
}
