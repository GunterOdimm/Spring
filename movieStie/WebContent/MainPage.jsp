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
<link rel="stylesheet" type="text/css" href="css/mainPageStyle.css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script> -->
</head>
</head>
<body onload="LetsGo()">
	<div id="container">
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
				<div class="swiper-container">
					<!-- 이코드 그냥 쉐이프 쉬프터 컨테이너 코드인데 솔직히 새로 만들기 귀찮아서 넣어둔 코드 -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img class="first-slide img-responsive center-block"
									src="img/1.gif" alt="First slide"
									style="max-height: 700px; min-height: 700px; min-width: 1500px;">
								<div class="container">
									<div class="carousel-caption">
										<h1>영화 제목이 들어가는 자리 입니다.</h1>
									</div>
								</div>
							</div>
							<div class="item">
								<img
									class="second-slide first-slide img-responsive center-block"
									src="img/2.gif" alt="Second slide"
									style="max-height: 700px; min-height: 700px; min-width: 1500px;"">
								<div class="container">
									<div class="carousel-caption">
										<h1>영화 제목이 들어가는 자리 입니다.</h1>
									</div>
								</div>
							</div>
							<div class="item">
								<img class="third-slide first-slide img-responsive center-block"
									src="img/3.gif" alt="Third slide"
									style="max-height: 700px; min-height: 700px; min-width: 1500px;">
								<div class="container">
									<div class="carousel-caption">
										<h1>영화 제목이 들어가는 자리 입니다.</h1>
									</div>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<ul id="gallerytitle">
					<li><span id="font" style="color: rgb(94, 94, 94)">TO BE SHOWN</span></li>
				</ul>
				<ul id="gallery">
					<%for(int i =1; i<=10; i++){ %>
					<div class="col-sm-5 col-md-3">
						<div class="thumbnail">
							<img src="img/<%=i%>.png" class="img-thumbnail" alt="img1" width="304"
								height="220">
							<div>
								<img src="img/first.png" id="prize" />
							</div>
							<div class="overlay">
								<div class="text">
									<b>라이온 킹</b><br>
									<span id="star" style="font-color: #fcdf05">★★★★☆</span><i>평점7.6</i>
								</div>
							</div>
							<div class="info">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#movie_detail">영화정보</button>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#like">좋아요♥︎</button>
							</div>
						</div>
					</div>
					<% }%>
					</div>

				</ul>
			</div>

			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
			<script type="text/javascript">
				var num = 0;
				var img = [ 'img/1.gif', 'img/2.gif', 'img/3.gif' ];

				$(".title").hover(function() {
					$(this).find(".sub1").slideToggle(100);
				});
				function printTime() {
					var month = document.getElementById("month");
					var day = document.getElementById("day");
					/*var week = document.getElementById("week");*/
					var now = new Date()
					var dayTime = (now.getMonth() + 1) + "월" + now.getDate()
							+ "일";
					/*var weekTime = now.getHours() + "시" + now.getMinutes() + "분" + now.getSeconds() + "초";*/
					var monthTime = (now.getMonth() + 1) + "월";

					month.innerHTML = monthTime;
					setTimeout("printTime()", 1000);

					day.innerHTML = dayTime;
					setTimeout("printTime()", 1000);

				}

				window.onload = function() {
					printTime();

				}
				function getWeekNo(v_date_str) {
					var week = document.getElementById("week");
					var date = new Date();

					if (v_date_str) {
						date = new Date(v_date_str);

					}
					return Math.ceil(date.getDate() / 7);
					day.innerHTML = date;
				}

				var day = document.getElementById("day");

				function ISO8601_week_no(dt) {
					var tdt = new Date(dt.valueOf());
					var dayn = (dt.getDay() + 6) % 7;
					tdt.setDate(tdt.getDate() - dayn + 3);
					var firstThursday = tdt.valueOf();
					tdt.setMonth(0, 1);
					if (tdt.getDay() !== 4) {
						tdt.setMonth(0, 1 + ((4 - tdt.getDay()) + 7) % 7);
					}
					return 1 + Math.ceil((firstThursday - tdt) / 604800000)
							+ "주차";
				}

				dt = new Date();
				week.innerHTML = ISO8601_week_no(dt);

				<script src="js/bootstrap.min.js">
			</script>
</body>
</html>