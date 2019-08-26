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
	<h1>학과관리</h1>
	<a href="dept_add.jsp">[학과추가]</a>
	<form method="get"action="${pageContext.request.contextPath}/department/list.do">
		<label for="keyword">검색어: </label> 
		<input type="search" name="keyword" id="keyword" placeholder="학과명 or 위치 검색" value="${keyword}" />
		<button type="submit">검색</button>
	</form>
	<hr />
	<table border="1">
		<thead>
			<tr>
				<th width="100" align="center">학과번호</th>
				<th width="300" align="center">학과이름</th>
				<th width="200" align="center">학과위치</th>
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
						<c:set var="dname" value="${item.dname}" />
						<c:set var="loc" value="${item.loc}" />
						<c:if test="${keyword != ''}">
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<c:set var="dname" value="${fn:replace(dname, keyword, mark)}" />
							<c:set var="loc" value="${fn:replace(loc, keyword, mark)}" />
						</c:if>
						<c:url value="/department/view.do" var="viewUrl">
							<c:param name="deptno" value="${item.deptno}" />
						</c:url>
						<tr>
							<td align="center">${item.deptno}</td>
							<td align="center"><a href="${viewUrl}">${dname}</a></td>
							<td align="center">${loc}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<c:choose>
		<c:when test="${pageData.prevPage > 0}">
			<c:url value="/department/list.do" var="prevPageUrl">
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
		<c:url value="/department/list.do" var="pageUrl">
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
			<c:url value="/department/list.do" var="nextPageUrl">
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