<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css"	>
<script src="<%=project%>/script.js"></script>

<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=page_main%> </h2>

<!-- 로그인없을때 메인 화면 --> 
<%
	if(session.getAttribute("memid") == null){     //로그인이 안된상황
		%>
		<form class="login" name="mainform" method="post" action="loginPro.jsp" onsubmit="return maincheck()">
			<table class="table">
				<tr>
					<th id="title" colspan="2">
						<%=msg_input%>
					 </th>
				</tr>
				<tr>
					<th class="text"><%=str_id %></th>
					<td> <input id="userid" type="text" placeholder="Username" name="id" maxlength="20" autofocus></td>
				</tr>
				<tr>
					<th class="text"><%=str_passwd %></th>
					<td><input id="passwd" type="password" placeholder="Password" name="passwd" maxlength="30"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_login%>">
						<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
						<input class="inputbutton" type="button" value="<%=btn_input%>" onclick="location='inputform.jsp'">
					</th>
				</tr>
			</table>
		</form>
		<%
	}else{	//로그인이 된 상황
		
	}
%>































