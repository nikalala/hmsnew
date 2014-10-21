/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mysoft;

/**
 *
 * @author djorj
 */
public class jqexport {

    private String clickcode = "";
    private String formname = "progressform";
    private String formname1 = "dpma";
    private String ses = "";
    private String title = "დაელოდეთ, მიმდინარეობს მონაცემთა ექსპორტირება...";

    public jqexport(){}
    
    public jqexport(String ses, String gp1, String gp2, String stopses, String exportfile, String title)
    {

        this.ses = ses;
        if(title != null && title.length() > 0) this.title = title;
        clickcode = "$(\"#"+formname+"\").dialog(\n"
	+"    {\n"
	+"        width: 600,\n"
	+"        height: 200,\n"
	+"        show: 'slide',\n"
	+"        resizable: false,\n"
	+"        modal: true,\n"
	+"        draggable: false,\n"
	+"        closeOnEscape: false,\n"
	+"        buttons: { \"შეწყვეტა\": function() {\n"
	+"          $.post(\"content/setsessionpar.jsp\", { ses: \""+stopses+"\", val: \"YES\"},function(data){ $(\"#"+formname1+"\").html(data); });\n"
	+"          clearTimeout(wt);\n"
	+"          $(\"#"+formname+"\").dialog(\"close\");\n"
	+"        } },\n"
	+"        open: function(event, ui) { \n"
        +"        $(\".ui-dialog-titlebar-close\").hide();\n"
        +"        $.post(\"includes/wait0.jsp\", { ses: '"+ses+"' },function(data){\n"
	+"             $(\"#"+formname1+"\").html(data); });\n"
	+"             wt = setTimeout(\"progBar()\", 1000);\n"
	+"\n"
	+"             $.post(\""+exportfile+"\",\n"
	+"                { ses: '"+ses+"', gp1: '"+gp1+"', gp2: '"+gp2+"' },\n"
	+"                function(data){\n"
	+"                    clearTimeout(wt);\n"
	+"                    var fname = data.replace(/\\n/g,\"\");\n"
	+"                    document.location.href=\"fileReader?contenttype=application%2Fvnd.openxmlformats-officedocument.spreadsheetml.sheet&filename=\"+fname;\n"
	+"                    $(\"#"+formname+"\").dialog(\"close\");\n"
	+"                });\n"
	+"        }\n"
	+"    });\n";

    }

    public String getClickCode()
    {
        return clickcode;
    }

    public String getExportAttr()
    {
        String s = "<script type=\"text/javascript\">\n"
                + "var wt;\n"
                + "function progBar()\n"
                + "{\n"
                + "$.post(\"includes/wait0.jsp\", { ses: '"+ses+"'},function(data){ $(\"#"+formname1+"\").html(data); });\n"
                + "wt = setTimeout(\"progBar()\", 1000);\n"
                + "}\n"
                + "</script>\n"
                + "<div id=\"progressform\" title=\""+title+"\"><div id=\""+formname1+"\"></div></div>\n";
        return s;
    }

}



