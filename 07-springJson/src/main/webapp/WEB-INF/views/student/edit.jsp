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
	<h1>학생 정보 수정</h1>
	<form method="post"
		action="${pageContext.request.contextPath}/student/edit_ok.do">
		<input type="hidden" name="studno" value="${output.studno}" />
		<div>
			<label for="name">학생 이름: </label> <input type="text" name="name"
				id="name" value="${output.name}" />
		</div>
		<div>
			<label for="userid">학생번호: </label> <input type="text" name="userid" id="userid"
				value="${output.userid}" />
		</div>
		<div>
			<label for="grade">학년: </label> <input type="text" name="grade" id="grade"
				value="${output.grade}" />
		</div>
		<div>
			<label for="idnum">주민번호: </label> <input type="text" name="idnum" id="idnum"
				value="${output.idnum}" />
		</div>
		<div>
			<label for="birthdate">생년월일: </label> <input type="text" name="birthdate" id="birthdate"
				value="${output.birthdate}" />
		</div>
		<div>
			<label for="tel">전화번호: </label> <input type="text" name="tel" id="tel"
				value="${output.tel}" />
		</div>
		<div>
			<label for="height">학생번호: </label> <input type="text" name="height" id="height"
				value="${output.userid}" />
		</div>
		<div>
			<label for="height">키: </label> <input type="text" name="height" id="height"
				value="${output.height}" />
		</div>
		<div>
			<label for="weight">몸무게: </label> <input type="text" name="weight" id="weight"
				value="${output.weight}" />
		</div>
		<div>
			<label for="deptno">학과번호: </label> <input type="text" name="deptno" id="deptno"
				value="${output.deptno}" />
		</div>
		<div>
			<label for="profno">담당교수: </label> <input type="text" name="profno" id="profno"
				value="${output.profno}" />
		</div>
		<hr />
		<button type="submit">저장하기</button>
		<button type="reset">다시작성</button>
	</form>
</body>
</html>