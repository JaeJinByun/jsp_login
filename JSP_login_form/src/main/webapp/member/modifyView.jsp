<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logon.LogonDataBean"%>
<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css"	>
<script src="<%=project%>/script.js"></script>


<h2><%=page_modify %></h2>

<%
	String id = (String)session.getAttribute("memid");
	String passwd = request.getParameter("passwd");
%>

<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.check(id,passwd);  //id , passwd 유효성 검사
	
	if(result == 0 ){ //수정할 이이디 비번이 없을때 
		
		%>
		<script type="text/javascript">
		<!--	
		erroralert(passwderror);
		
		//-->
		</script>

		<%
	}else{ //올바르게 입력했을때 
		LogonDataBean dto = dao.getMember( id );
	
	
		%>
		<form class="login2" name="modifyform" method="post" action="modifyPro.jsp" onsubmit="return modifycheck()">
			<table class="table2">
				<tr>
					<th class="text" colspan="2"> <%=msg_modify %> </th>
				</tr>			
				<tr>
					<th class="text"> <%=str_id %> </th>
					<th class="text"> <%=dto.getId() %></th>
				</tr>
				<tr>
					<th class="text"> <%=str_passwd %></th>
					<th> <input class="inputtext2" type="password" name="passwd" maxlength="20"
							value="<%=dto.getPasswd()%>"></th>
				</tr>
				<tr>
					<th class="text"><%=str_repasswd %> </th>
					<th>
						<input class="inputtext2" type="password" name="repasswd" maxlength="20">
					</th>
				</tr>
				<tr>
					<th class="text"><%=str_name %></th>
					<th class="text">&nbsp;<%=dto.getName() %></th>
				</tr>
				<tr>
					<th class="text"><%=str_jumin %></th>
					<th class="text">&nbsp;<%=dto.getJumin1() %> - <%=dto.getJumin2() %> </th>
				</tr>
				<tr>
					<th class="text"> <%=str_tel %> </th>
					<th> 
						<%
						String tel = dto.getTel();
						if( tel == null || tel.equals("")){
							%>
							<input class="inputtext2" style="width:60px;" type="text" name="tel1" maxlength="3">
						  - <input class="inputtext2" style="width:80px;" type="text" name="tel2" maxlength="4">
						  - <input class="inputtext2" style="width:80px;" type="text" name="tel3" maxlength="4"> 
							<%
						}else{
							String t[] = tel.split("-");
							%>
							<input class="inputtext2" style="width:60px;" type="text" name="tel1" maxlength="3" value="<%=t[0] %>">
						  - <input class="inputtext2" style="width:80px;" type="text" name="tel2" maxlength="4" value="<%=t[1] %>">
						  - <input class="inputtext2" style="width:80px;" type="text" name="tel3" maxlength="4" value="<%=t[2] %>">
							<%
						}
						%>
					</th>
				</tr>
				<tr>
					<th class="text"><%=str_email %></th>
					<th>
						<% 
						String email = dto.getEmail();
						if(email == null || email.equals("")){
							%>
							<input class="inputtext2" style="width:120px;" type="text" name="email1" maxlength="15">
						  @ <input class="inputtext2" style="width:120px;" type="text" name="email2" maxlength="15">
							<% 
						}else{
							String e[] = email.split("@");
							%>
							<input class="inputtext2" style="width:120px;" type="text" name="email1" maxlength="15" value="<%=e[0] %>">
						  @ <input class="inputtext2" style="width:120px;" type="text" name="email2" maxlength="15" value="<%=e[0] %>">
						<%
						}
						%>
					</th>
				</tr>
				<tr>
					<th class="text"> <%=str_reg_date %></th>
					<th class="text">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						%>
						<%=dto.getReg_date() %>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_modify %>">
						<input class="inputbutton" type="reset" value="<%=btn_cancel %>">
						<input class="inputbutton" type="button" value="<%=btn_modify_cancel %>" onclick="location='main.jsp'">
					</th>
				</tr>
			</table>
		</form>
	<%
	}
	%>






































