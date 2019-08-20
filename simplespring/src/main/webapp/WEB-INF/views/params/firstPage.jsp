<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FirstPage</title>
</head>
<body>
	<h1>스프링의 기초</h1>
	<span>가장 기본이 되는 방법입니다.</span>
	<p>GET 방식과 POST 방식</p>
	
	<h2>GET 방식의 100 + 200</h2>
	<a href="${pageContext.request.contextPath}/params/get.do?answer=100">100</a>
	<a href="${pageContext.request.contextPath}/params/get.do?answer=200">200</a>
	<a href="${pageContext.request.contextPath}/params/get.do?answer=300">300</a>
	<a href="${pageContext.request.contextPath}/params/get.do?answer=400">400</a>
	<a href="${pageContext.request.contextPath}/params/get.do?answer=500">500</a>
	
	<hr/>
	
	<h2>당신의 이름과 나이를 post방식으로 전송해보기</h2>
	<form name="form" method="post" action="${pageContext.request.contextPath}/params/post.do">
		<label for ="user_name">이름</label>
		<input type="text" name="user_name" id="user_name"/>
		&nbsp;
		<label for ="user_age">나이</label>
		<input type="text" name="user_age" id="user_age"/>
		&nbsp;
		<button type="submit">전송</button>
	</form>
</body>
</html>