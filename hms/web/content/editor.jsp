<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../includes/init.jsp"%>
<%@include file="../includes/subheader.jsp"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
String content = "";
TemplatesBean tmpl = TemplatesManager.getInstance().loadByPrimaryKey(id);
if(tmpl.getContent() != null){
    byte[] bt = tmpl.getContent();
    content = new String(bt, "UTF-8");
    //content = org.apache.commons.lang3.StringEscapeUtils.escapeHtml3(content);
}
%>
<script type="text/javascript">
        function mysave()
        {
            $.post("savecontent.jsp", { id: <%=id%>, content: $("#elm0").val() }, function(data){  });
        }

	$().ready(function() {
		$('#elm0').tinymce({
			script_url : '../js/tiny_mce/tiny_mce.js',

			theme : "advanced",
			plugins : "equation,autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist,imageupload",
                        lang: "ka",
                        mode: "textarea",
                        save_onsavecallback : "mysave",

			theme_advanced_buttons1 : "equation,|,save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,imageupload,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom"
			//theme_advanced_resizing : true
		});
	});
</script>
<table align="center" width="100%" style="height: 100%">
    <tr style="height: 100%">
        <td align="center" width="100%" style="height: 100%">
            <textarea id="elm0" name="elm0" style="width: 100%; height: 100%" class="tinymce" align="center">
                <%=content%>
            </textarea>
        </td>
    </tr>
</table>
<%@include file="../includes/subfooter.jsp"%>