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
	<h1>학생 정보 추가</h1>
	<form method="post"
		action="${pageContext.request.contextPath}/student/add_ok.do">
		<div>
			<label for="name">학생 이름: </label> <input type="text" name="name" id="name" />
		</div>
		<div>
			<label for="userid">아이디: </label> <input type="text" name="userid" id="userid" />
		</div>
		<div>
			<label for="grade">학년: </label> <input type="text" name="grade" id="grade" />
		</div>
		<div>
			<label for="idnum">주민번호: </label> <input type="text" name="idnum" id="idnum" />
		</div>
		<div>
			<label for="birthdate">생년월일: </label> <input type="text" name="birthdate" id="birthdate" />
		</div>
		<div>
			<label for="tel">번호: </label> <input type="text" name="tel" id="tel" />
		</div>
		<div>
			<label for="height">키: </label> <input type="text" name="height" id="height" />
		</div>
		<div>
			<label for="weight">몸무게: </label> <input type="text" name="weight" id="weight" />
		</div>
		<div>
			<label for="deptno">학과번호: </label> <input type="text" name="deptno" id="deptno" />
		</div>
		<div>
			<label for="profno">담당교수: </label> <input type="text" name="profno" id="profno" />
		</div>
		<hr />
		<button type="submit">저장하기</button>
		<button type="reset">다시작성</button>
	</form>
</body>
</html>