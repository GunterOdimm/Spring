<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모든 View에 무조건 넣자!!! -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/billboard.min.css" />
</head>
<body>
	<h1>${targetDt} 박스오피스</h1>
	<form name="form1" method="get" action="daily_box_office_graph.do">
		<label for="date">검색일: </label>
		<input type="date" id="date" name="date" value="${date}" />
		<input type="submit" value="검색" />
	</form>
	
	<hr />
	<div id="barChart" style="width: 1024px; height: 600px"></div>
	
	<!-- d3가 있어야 그래프 그리기 쉬움 -->
	<script src="http://d3js.org/d3.v5.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/billboard.min.js">
	</script>
	<script>
		var chart = bb.generate ({
			/** 그래프가 표시 될 HTML 태그의 id값 지정 */
			bindto: "#barChart",
			/** 데이터 설정 */
			data: {
				//데이터들 설정
				columns: [
					//JAVA > HTML+CSS > JS --> 자바에서 자바스크립트는 string처리하고 자바스크립트에서 자바는 Ajax로 보냄
					['영화제목', ${movieNmStr}],
					['해당일관람객', ${audiCntStr}],
					['누적관람객', ${audiAccStr}]
				],
				x: '영화제목', //x축으로 사용할 데이터 이름
				types: { //그래프 종류(데이터이름: 종류)
					'해당일관람객': "bar",
					'누적관람객': "line"
				}
			},
			/** x, y축의 특성 설정 */
			axis: {
				//x축 설정
				x: {
					type: "category", //종류
					height: 150, //x축 텍스트 영역의 높
					tick: {	 //x축 텍스트 속성
						rotate: -45,
						multiline: false,
						//tooltip: true
					}
				}
				
			}
		});
	</script>
	
</body>
</html>