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
	<h1>JSP 파일 업로드</h1>
	<form method="post" action="upload_ok.do" enctype="multipart/form-data">
		<div>
			<label for="subject">사진제목</label>
			<input type="text" name="subject" id="subject">
		</div>
		<div class="form-group">
			<label for="photo">사진선택</label>
			<input type="file" name="photo" id="photo">	<!-- 여기 속성에 multiple 을 넣으면 여러개의 사진을 추가할 수 있음.  -->
		</div>
		<button type="submit">업로드하기</button>
	</form>
</body>
</html>