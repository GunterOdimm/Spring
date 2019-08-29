<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Movie Title</title>
<link rel="stylesheet" type="text/css" href="css/monthOfficeStyle.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />

</head>
<body>
	<div id="container" style="background-color: #222">
		<div id="header">
			<h1 class='title'>
				&nbsp
				<!-- 빈칸을 생성하는 코드 -->
				<ul>
					<li><a href="MainPage.jsp" style="color: rgb(26, 188, 156)">로고</a>
					</li>
					<li><a href="MonthOffice.jsp" style="color: rgb(26, 188, 156)">박스오피스</a>
					</li>
					<li><a href="TopBoxOffice.jsp"
						style="color: rgb(26, 188, 156)">역대박스오피스</a></li>
					<li><a href="genreOffice.jsp" style="color: rgb(26, 188, 156)">장르별추이</a></a>
					</li>
					<li><a href="#"></a></li>
				</ul>
			</h1>
		</div>
		<div id="content" class="clear">
			<div id="body">
				<ul id="gallerytitle">
					<li><span id="font">TOP OFFICE</span></li>
				</ul>
				<!--
        -->
				<table class="motherBox">
					<thead>
						<td class="childBox "></td>
						<td class="childBox"></td>
					</thead>
					<br />

				</table>
				<li class="boxFoot"><span class="grendChildBox">텍스트박스입니다.</span>
				</li>
				</ul>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			$(".title").hover(function() {
				$(this).find(".sub1").slideToggle(100);
			});
		</script>
</body>
</html>
