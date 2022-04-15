<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css"	>
<script src="<%=project%>/script.js"></script>

<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%=page_input %></h2>

<form class="login2" name="inputform" method="post" action="inputPro.jsp" onsubmit="return inputcheck()">
	<input type="hidden" name="confirm" value="0">
	
	<table class="table2" >
		<tr>
			<th class="text"><%=str_id %></th>
			<td><input class="inputtext2" type="text" name="id" maxlength="20" placeholder="Userid" autofocus>
				<input class="inputbutton" type="button" value="<%=btn_confirm %>" onclick="confirmid()">
			</td>
		</tr>
		<tr>
			<th class="text"> <%=str_passwd %> </th>
			<td> <input class="inputtext2" type="password" name="passwd" maxlength="30" placeholder="Password" autoComplete="on"></td>
		</tr>
		<tr>
			<th class="text"> <%=str_repasswd %> </th>
			<td><input class="inputtext2" type="password" name="repasswd" maxlength="30" placeholder="Password Confirm" autoComplete="on"></td>
		</tr>
		<tr>
			<th class="text"> <%=str_name %></th>
			<td> <input class="inputtext2" type="text" name="name" maxlength="30" placeholder="UserName"> </td>
		</tr>
		<tr>
			<th class="text"> <%=str_jumin %></th>
			<td> 
				<input class="inputtext2" style="width:80px;" type="text"  name="jumin1" maxlength="6"
					onkeyup="nextjumin1()">
				
				<input class="inputtext2" style="width:100px;" type="text" name="jumin2" maxlength="7"
					onkeyup="nextjumin2()">
			</td>
		</tr>
		<tr>
			<th class="text"> <%=str_tel %> </th>
			<td> 
				<input class="inputtext2" style="width:70px;" type="text" name="tel1" maxlength="3"
					onkeyup="nexttel1()">
				- <input class="inputtext2" style="width:70px;" type="text" name="tel2" maxlength="4"
					onkeyup="nexttel2()">
				- <input class="inputtext2" style="width:70px;" type="text" name="tel3" maxlength="4"
					onkeyup="nexttel3()">	
			</td>
		</tr>
		<tr>
			<th class="text"> <%=str_email %> </th>
			<td>
				<input class="inputemail" style="width:100px;" type="text" name="email1" maxlength="15">
				@
				<input class="inputemail" style="width:80px;" type="text" name="email2" maxlength="15">
				
				<select id="select" name="select" onchange="changeSelect()">
					<option value="0"> 직접입력 </option>
					<option value="naver.com"> 네이버 </option>
					<option value="daum.net"> 다음 </option>
					<option value="gmail.com"> 구글 </option>
					<option value="nate.com"> 네이트 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_length%>">
				<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
				<input class="inputbutton" type="button" value="<%=btn_input_cancel%>" onclick="location='main.jsp'">
			</th>
		</tr>
	</table>
</form>


















