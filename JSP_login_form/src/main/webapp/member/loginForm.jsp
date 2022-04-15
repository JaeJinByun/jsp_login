<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css"	>
<script src="<%=project%>/script.js"></script>

<h2><%=page_login %></h2>

<form name="Loginform" method="post" action="loginPro.jsp" 
		onsubmit="return logincheck()">
	<table border="1">
		<tr>
			<th colspan="2"> <%=msg_login %> </th>
		</tr>
		<tr>
			<th><%=str_id %></th>
			<td>
			<input class="input" type="text" name="id" maxlength="20" autofocus>
			</td>
		</tr>
		<tr>
			<th><%=str_passwd %></th>
			<td><input class="input" type="password" name="passwd" maxlength="30">
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_login %>">
				<input class="inputbutton"  type="reset"  value="<%=btn_cancel %>">
			</th>
		</tr>
	</table>
</form>






















