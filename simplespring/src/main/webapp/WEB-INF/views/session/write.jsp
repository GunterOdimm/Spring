<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session example</title>
</head>
<body>
	<h1>세션 예제</h1>
	
	<c:choose>
		<c:when test="${mySession ==''}">
			<h2>저장된 세션이 없습니다.</h2>
		</c:when>
		<c:otherwise>
			<h2>저장된 세션은 = ${mySession}</h2>
		</c:otherwise>
	</c:choose>
	
	<c:if test="${my_session_value != null}">
		<h3>${my_session_value}(이)가 저장되었습니다.</h3>
	</c:if>

	<h1>저장하고 싶은 내용의 세션을 입력해주세요.</h1>
	<form method="post" action="${pageContext.request.contextPath}/session/save.do">
		<label for="user_input">저장할 내용 입력해주세요</label>
		<hr/>
		<input type="text" name="user_input" id="user_input"/>
		<hr/>
		<button type="submit">저장.</button>
	</form>
</body>
</html>