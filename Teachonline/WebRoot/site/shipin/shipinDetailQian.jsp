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
	
	<script type="text/javascript" src="<%=path %>/js/public.js"></script>
	
	<script type="text/javascript">
        function down1(fujianPath,fujianYuashiMing)
        {
            var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
            url=encodeURI(url); 
            url=encodeURI(url); 
            window.open(url,"_self");
        }
        
        function shipinBofang(fujian)
        {
              var url="<%=path %>/bofang/bofang.jsp?fujian="+fujian;
              var n="";
              var w="700px";
              var h="600px";
              var s="resizable:no;help:no;status:no;scroll:yes";
	          openWin(url,n,w,h,s);
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
      	  <h2>教学视频</h2>
	      <div id="welcome">
	        <div>
	           <div class="c1-body">
                   <table width="100%" border="0">
					    <tr>
					       <td align="center">视频名称：${requestScope.shipin.shipinName }<hr/></td>
					    </tr>
					    <tr>
					       <td align="center" style="word-break:break-all;">视频介绍：<c:out value="${requestScope.shipin.shipinJianjie }" escapeXml="false"></c:out><hr/></td>
					    </tr>
					    <tr>
					       <td align="center">
					            <a href="#" onclick="down1('${requestScope.shipin.fujian }','${requestScope.shipin.fujianYuanshiming }')" style="font-size: 13px;color: red">${requestScope.shipin.fujianYuanshiming }</a>
					            &nbsp;&nbsp;&nbsp;
					            <a href="#" onclick="shipinBofang('${requestScope.shipin.fujian }')" class="pn-loperator" style="color: red">播放</a>
					            <hr/>
					       </td>
					    </tr>
					    <tr>
					       <td align="center">发布时间:${requestScope.shipin.shijian }<hr/></td>
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
