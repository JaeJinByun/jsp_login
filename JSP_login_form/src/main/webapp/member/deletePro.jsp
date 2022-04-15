<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<script src="<%=project%>/script.js"></script>

<h2><%=page_delete %></h2>

<%
	String id = (String)session.getAttribute("memid");
	String passwd = request.getParameter("passwd");
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.check(id,passwd);	//아이디 비번 유효성 검사 반환값은 아이디와 패스워드가 같은지에 대한 true false 반환해주면되니 정수형으로
	
	if( result == 0 ){
		//비밀번호가 다르다 
		%>
		<script type="text/javascript">
			<!--
				erroralert(passwderror);
			//-->
		</script>
		<%
	}else{
		//비밀번호 확인 성공 삭제처리
		result = dao.deleteMember( id );
		if( result == 0 ){
			%>
			<script type="text/javascript">
			<!--
				alert(deleteerror);
			//-->
		</script>
		<!-- 0초 뒤에 새로고침해라 -->
		<meta http-equiv="refresh" content="0; url=main.jsp ">
			<%
		}else{
			session.removeAttribute("memid");
			response.sendRedirect("main.jsp");
		}
		
	}
%>






