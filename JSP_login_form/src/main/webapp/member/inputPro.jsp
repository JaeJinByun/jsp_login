<%@page import="java.sql.Timestamp"%>
<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>


<h2> <%=page_input %></h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="logon.LogonDataBean"/>
<jsp:setProperty name="dto" property="*"/>"
	
	<!-- id passwd name jumin1 jumin2  -->
	
<%
	String tel = null;
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3  = request.getParameter("tel3");
	if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")){
		tel = tel1 + "-" + tel2 + "-" + tel3;		
	}
	dto.setTel(tel);
	
	String email = null;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	if( ! email1.equals("")){  //올바르게입력했다면
		if( email2.equals("0") ){ // 직접입력 선택했다면
			//직접입력
			email = email1;
		}
	email = email1 + "@" + email2;
	dto.setEmail(email);
	}else {
		email = null;
	}
	dto.setEmail(email);

%>
<%
	//DB	에 현재 시각을 넣어줌
	dto.setReg_date( new Timestamp( System.currentTimeMillis()));
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.insertMember(dto);
	if( result == 0) { //결과값이 없을때 
		%>
		<script type="text/javascript">
		<!-- 
		erroralert("inputerror");
		-->
		</script>
		
		<%
	}else{
		response.sendRedirect("loginForm.jsp");
	}
%>






















	
	