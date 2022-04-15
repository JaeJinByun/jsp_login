<%@page import="logon.LogonDBBean"%>
<%@page import="logon.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css"	>
<script src="<%=project%>/script.js"></script>


<jsp:useBean id="dto" class="logon.LogonDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- passwd -->

<%
	String tel = null;
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	if( !tel1.equals("") && !tel2.equals("") && !tel3.equals("")){
		tel = tel1 + "-" + tel2 + "-" + tel3;
	}
	dto.setTel(tel);
	
	String email = null;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	
	if( !email1.equals("") && !email2.equals("")){
		email = email1 + "@" + email2;
	}
	dto.setEmail(email);

%>
<%
	dto.setId((String)session.getAttribute("memid"));
%>
<%
	LogonDBBean dao  = LogonDBBean.getInstance();
	int result = dao.modifyMember( dto ); //dto 에 들어온값 아이디 비밀번호 전화번호 이메일 
	if( result == 0){ //수정 실패
		%>
		<script type="text/javascript">
		<!--
			alert(modifyerror);	
		//-->
		</script>
		<meta http-equiv="refresh" content="0; url=main.jsp">
		<%
	}else{ // 수정 성공
		response.sendRedirect("main.jsp");
	}
%>


















