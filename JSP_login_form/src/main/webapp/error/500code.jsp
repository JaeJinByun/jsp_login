<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>500 에러 페이지</h2>

<%
	response.setStatus(HttpServletResponse.SC_OK);
%>

현재 페이지는 500 에러 페이지 입니다. <br>
오타를 확인하세요.