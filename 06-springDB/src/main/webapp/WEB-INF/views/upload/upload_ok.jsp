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
	<h1>${subject}</h1>
	<c:forEach var="item" items="${fileList}" varStatus="status">
		<c:url value="/upload/download.do" var="download_url">
			<c:param name="file" value="${item.filePath}"/>
			<c:param name="origin" value="${item.orginName}"/>
		</c:url>
		
		<c:url value="/upload/download.do" var="tumbnail_url">	
			<c:param name="file" value="${item.filePath}"/>
			<c:param name="size" value="480x320"/>
			<c:param name="crop" value="true"/>
		</c:url>
		
		<%-- <img src="${thumbnail_url}"/> --%>
		<div>
			<li>${item.orginName}</li>
			<li>${item.fieldName}</li>
			<li>${item.filePath}</li>
			<li>${item.contentType}</li>
			<li>${item.fileSize}</li>
			<li><a href="${download_url}">[다운로드]</a></li>
		</div>
	</c:forEach>
</body>
</html>