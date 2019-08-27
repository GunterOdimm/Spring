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
	<h1>학생관리</h1>
	<a href="${pageContext.request.contextPath}/student/add.do">[학생추가]</a>
	<form method="get"action="${pageContext.request.contextPath}/student/list.do">
		<label for="keyword">검색어: </label> 
		<input type="search" name="keyword" id="keyword" placeholder="학생명 or 학생아이디 검색 " value="${keyword}" />
		<button type="submit">검색</button>
	</form>
	<hr />
	<table border="1">
		<thead>
			<tr>
				<th width="100" align="center">학생번호</th>
				<th width="100" align="center">이름</th>
				<th width="200" align="center">아이디</th>
				<th width="150" align="center">주민번호</th>
				<th width="50" align="center">학년</th>
				<th width="200" align="center">생일</th>
				<th width="200" align="center">전화번호</th>
				<th width="80" align="center">키</th>
				<th width="80" align="center">몸무게</th>
				<th width="80" align="center">학과번호</th>
				<th width="80" align="center">담당교수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${output == null || fn:length(output) == 0}">
					<tr>
						<td colspan="3" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${output}" varStatus="status">
						<c:set var="name" value="${item.name}" />
						<c:set var="userid" value="${item.userid}" />
						<c:set var="grade" value="${item.idnum}" />
						<c:set var="idnum" value="${item.grade}" />
						<c:set var="birthdate" value="${item.birthdate}" />
						<c:set var="tel" value="${item.tel}" />
						<c:set var="height" value="${item.height}" />
						<c:set var="weight" value="${item.weight}" />
						<c:set var="deptno" value="${item.deptno}" />
						<c:set var="profno" value="${item.profno}" />
					
						<c:if test="${keyword != ''}">
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<c:set var="name" value="${fn:replace(name, keyword, mark)}" />
							<c:set var="userid" value="${fn:replace(userid, keyword, mark)}" />
						</c:if>
						<c:url value="/student/view.do" var="viewUrl">
							<c:param name="studno" value="${item.studno}" />
						</c:url>
						<tr>
							<td align="center">${item.studno}</td>
							<td align="center"><a href="${viewUrl}">${name}</a></td>
							<td align="center">${userid}</td>
							<td align="center">${grade}</td>
							<td align="center">${idnum}</td>
							<td align="center">${birthdate}</td>
							<td align="center">${tel}</td>
							<td align="center">${height}</td>
							<td align="center">${weight}</td>
							<td align="center">${deptno}</td>
							<td align="center">${profno}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<c:choose>
		<c:when test="${pageData.prevPage > 0}">
			<c:url value="/student/list.do" var="prevPageUrl">
				<c:param name="page" value="${pageData.prevPage}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${prevPageUrl}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
		<c:url value="/student/list.do" var="pageUrl">
			<c:param name="page" value="${i}" />
			<c:param name="keyword" value="${keyword}" />
		</c:url>
		<c:choose>
			<c:when test="${pageData.nowPage == i}">
				<strong>[${i}]</strong>
			</c:when>
			<c:otherwise>
				<a href="${pageUrl}">[${i}]</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pageData.nextPage > 0}">
			<c:url value="/student/list.do" var="nextPageUrl">
				<c:param name="page" value="${pageData.nextPage}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${nextPageUrl}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
</body>
</html>