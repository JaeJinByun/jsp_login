<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<h2> 404에러 페이지 </h2>

<%
	response.setStatus(HttpServletResponse.SC_OK);
%>

현재 페이지는 404 에러 페이지입니다.<br>
파일의 경로나 이름을 확인하세요.<br>