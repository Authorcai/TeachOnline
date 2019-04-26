<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" href="<%=path %>/css/qiantai.css" type="text/css" charset="utf-8" />
	
	<style type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;}
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
    </style>
	
	<script type="text/javascript">
        function down1(fujianPath,fujianYuashiMing)
        {
            var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
            url=encodeURI(url); 
            url=encodeURI(url); 
            window.open(url,"_self");
        }
    </script>
  </head>
  
  <body>
  <div id="wrapper">
      <div id="header"></div>
      <div id="left">
	      <jsp:include flush="true" page="/site/left.jsp"></jsp:include>
      </div>
      <div id="right">
      	  <!-- 111 -->
      	  <h2>教学资料</h2>
	      <div id="welcome">
	        <div>
	           <div class="c1-body">
                   <table width="100%" align="center" border="0" cellpadding="8" cellspacing="8">
					    <tr>
					        <td width="20%" align="left" style="font-size: 13px;">
					              资料名称：									    
					        </td>
					        <td width="80%" align="left" style="font-size: 13px;">
					            ${requestScope.doc.mingcheng }
					        </td>
					    </tr>
					    <tr>
					        <td width="20%" align="left" style="font-size: 13px;">
					              资料附件：									    
					        </td>
					        <td width="80%" align="left" style="font-size: 13px;">
					            <a href="#" onclick="down1('${requestScope.doc.fujian }','${requestScope.doc.fujianYuanshiming }')" style="font-size: 13px;color: red">${requestScope.doc.fujianYuanshiming }</a>
					        </td>
					    </tr>
					    <tr>
					        <td width="20%" align="left" style="font-size: 13px;">
					              发布时间：									    
					        </td>
					        <td width="80%" align="left" style="font-size: 13px;">
					            ${requestScope.doc.shijian }
					        </td>
					    </tr>
				   </table> 
		       </div>
	        </div>
	        <!-- <p class="more"><a href="#">more</a></p> -->
	      </div>
	      <!-- 111 -->
      </div>
      <div class="clear"> </div>
      <div id="footer">
	      <div id="copyright">
	        Copyright &copy; 2013 Company Name All right reserved&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/login.jsp">系统后台登陆</a>
	      </div>
	      <div id="footerline"></div>
      </div>
  </div>
</body>
</html>
