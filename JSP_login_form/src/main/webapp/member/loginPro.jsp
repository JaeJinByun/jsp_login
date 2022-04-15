<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css"	>
<script src="<%=project%>/script.js"></script>

<h2><%=page_login %></h2>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");	
	session.setAttribute("memid", id); 

%>

<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.check(id , passwd);
	if( result == -1){
		//아이디가없다
		%>
		<script type="text/javascript">
			<!--
			erroralert( iderror );
			//-->
		</script>
		<%
	}else if(result == 0){
		//비밀번호가 다르다
		%>
		<script type="text/javascript">
		<!--
		erroralert( passwderror );
		//-->
		</script>
		<% 
	}else {
		//비밀번호가 같다.
		%>
		<table class="table">
			<tr>
				<th style="width:300px">
					<span><%=session.getAttribute("memid") %></span><%=msg_main %>
				</th>
			</tr>
			<tr>
				<th>
					<input class="inputbutton" type="button" value="<%=btn_modify%>" onclick="location='modifyForm.jsp'"> 
					<input class="inputbutton" type="button" value="<%=btn_delete%>" onclick="location='deleteForm.jsp'">
					<input class="inputbutton" type="button" value="<%=btn_logout%>" onclick="location='logout.jsp'">
				</th>
			</tr>
		</table>
		
		<%
	}

%>































