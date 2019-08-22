<!-- JSP 페이지 헤더 선언 추가해야한다.(한글깨짐) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- JSTL이 제공하는 문법적 기능을 "c"라는 태그를 통해 공급받겠다는 선언입니다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 로그인 기능인데 기본이 true다 만약 사용할거면 그냥 true로 쓰지말고 지우는것이 가장 좋다. -->
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
