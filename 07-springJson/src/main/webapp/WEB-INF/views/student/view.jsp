<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
	<h1>학생정보</h1>
	<p>학생번호 : ${output.studno}</p>
	<p>이름 : ${output.name}</p>
	<p>아이디 : ${output.userid}</p>
	<p>학년 : ${output.grade}</p>
	<p>주민번호 : ${output.idnum}</p>
	<p>생일 : ${output.birthdate}</p>
	<p>전화번호 : ${output.tel}</p>
	<p>키 : ${output.height}</p>
	<p>몸무게 : ${output.weight}</p>
	<p>학과번호 : ${output.deptno}</p>
	<p>교수번호 : ${output.profno}</p>
	<hr />
	<a href="${pageContext.request.contextPath}/student/list.do">[목록보기]</a>
	<a href="${pageContext.request.contextPath}/student/add.do">[학생추가]</a>
	<a
		href="${pageContext.request.contextPath}/student/edit.do?studno=${output.studno}">[학생수정]</a>
	<a
		href="${pageContext.request.contextPath}/student/delete_ok.do?studno=${output.studno}">[학생삭제]</a>
</body>
</html>