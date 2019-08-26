 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
<meta charset="UTF-8">
</head>
<body>
<h1>
	원하는 기능의 버튼을 입력하세요
</h1>

<P>  The time on the server is ${serverTime}. </P>

<button type="button" onclick="location.href='department/view.do'">학과보기</button>
<button type="button" onclick="location.href='department/add.do'">학과추가</button>
<button type="button" onclick="location.href='department/edit.do'">학과수정</button>
<button type="button" onclick="location.href='department/list.do'">학과리스트</button>
<hr/>

</body>
</html>
