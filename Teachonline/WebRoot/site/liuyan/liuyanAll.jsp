<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
        function liuyanAdd()
        {
            <s:if test="#session.userType==null || #session.userType != 2">
                  alert("请先登录");
            </s:if>
            <s:if test="#session.userType == 2">
                 var strUrl = "<%=path %>/site/liuyan/liuyanAdd.jsp";
	             var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	             window.location.reload();
            </s:if>
        }
        
        function liuyanDetail(id)
        {
             var strUrl = "<%=path %>/liuyanDetail.action?id="+id;
             var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
      	  <h2>师生交流</h2>
	      <div id="welcome">
	        <div>
	           <div class="c1-body">
			      <c:forEach items="${requestScope.liuyanList}" var="liuyan" varStatus="sta">
                       <div class="c1-bline" style="padding:7px 0px;">
                        <div class="f-left">
                             <img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
                             <a href="#" onclick="liuyanDetail(${liuyan.id })">${liuyan.neirong }</a>
                        </div>
                        <div class="f-right">${liuyan.liuyanshi }</div>
                        <div class="clear"></div>
                       </div>
                   </c:forEach>
                   <center><a href="#" onclick="liuyanAdd()" style="color: black">发布留言</a></center>                         
				  <div class="pg-3"></div>		  
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
