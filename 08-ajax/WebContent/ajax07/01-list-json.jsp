<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minmum-scale=1.0, user-scalable=no" />
<title>Hello AJAX</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- AjaxHelper -->
<script src="../plugins/ajax/ajax_helper.js"></script>
<link rel="stylesheet" type="text/css" href="../plugins/ajax/ajax_helper.css" />
<!-- Handlebars -->
<!-- 이처럼 어떤 파일이던 경로를 잡아서 참조해줄때는 무조건 파일의 확장자 명까지 모두 써줘야 한다. -->
<script src="../plugins/handlebars/handlebars-v4.1.2.js"></script>
</head>
<body>
	<div class="container">
		<!-- h1 에 클래스 명을 page-header로 정의 함으로써 hr/기능 또한 추가시켜 준다. -->
		<h1 class = "page-header">학과목록</h1>
		
		<table class='table'>
			<tgead>
				<tr>
					<th class="text-center">학과번호</th>
					<th class="text-center">학과명</th>
					<th class="text-center">위치</th>
				</tr>
			</tgead>
			<tbody id="dept_list_body">
				<!-- Ajax로 로드한 결과가 표시될 부분입니다. -->
				
			</tbody>
		</table>
		<button type="button" id="more" class="btn btn-default btn-block" style="marign-bottom: 15px">더보기</button>
	</div>

	<!-- 우리가 전에 했던 예제에서 페이지까지 구현된 서블릿을 가지고오면 -->
	<!-- 참고 >> 아래에서 사용하는 each는 핸들러가 지원하는 반복문 함수입니다 따로 지정안해도 반복해줌! -->
	<script id="dept_item_tmpl" type="text/x-handlebars-template">
		{{#each item}}
		<tr>
			<td class='text-center'>{{detpno}}</td>
			<td class='text-center'>{{dname}}</td>
			<td class='text-center'>{{loc}}</td>
		</tr>
		{{/each}}
	</script>
	
	<script type="text/javascript">
		function get_list() {
			$.get("../api/dept_list.json",/* {page:page} 로 값을주고*/ function(req){
				// 미리 준비한 HTML틀 을 읽어옵니다.
				var template = Handlebars.compile($("#dept_item_tmpl").html());
				
				var html = template(req);
				
				$("#dept_list_body").append(html);
			});
		}
		$(function() {
			get_list();
			/* page++ 이렇게 페이지 값을 더해주면 더보기 버튼마다 다음페이지가 출력된다. */
			$("#more").click(function(e){
				get_list();
			});
		});
	</script>
</body>
</html>