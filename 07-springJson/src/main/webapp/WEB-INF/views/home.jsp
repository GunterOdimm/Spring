<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>
	안녕 스프링
</h1>

<P>  버튼을 누르면 학과 리스트 페이지로 이동합니다 누르세요 </P>
<button type="button" onclick="location.href='student/list.do'">학과리스트</button>
<hr/>
</body>
</html>
