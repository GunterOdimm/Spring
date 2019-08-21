<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie!!</title>
</head>
<body>
	<h1>으린이 여러분 꾸끼를 맛나게 만들어 볼까유?</h1>
	<c:choose>
		<c:when test="${my_cookie ==''}">
			<h2>아따 당신의 쿠기를 냠냠 괴물 어이쿠 다처묵어 부렸네 거참 무서워 뒤져불겠어</h2>
		</c:when>
		<c:otherwise>
			<h2>음마야 맛있는 쿠키가 만들어져 부럈어 다들 하닙씩 먹어부와요 =${my_cookie}</h2>
		</c:otherwise>
	</c:choose>
	
	<c:if test="${cookie.my_cookie != null}">
	<h3>${cookie.my_cookie.value}(이)가 남아있어 언능와서 한입씩 먹어봐</h3>
	</c:if>
	<h1>저장하고 싶은 내용의 쿠키를 입력해주세요.</h1>
	<form method="post" action="${pageContext.request.contextPath}/cookie/save.do">
		<label for="user_input">저장할 내용 입력해주세요</label>
		<input type="text" name="user_input" id="user_input"/>
		<button type="submit">쿠기저장하무니다.</button>
	</form>
</body>
</html>