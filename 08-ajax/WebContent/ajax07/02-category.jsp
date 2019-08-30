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
		<h1 class = "page-header">멀티 드롭다운</h1>
		
		<form class="form-inline">
			<!-- 1차 카테고리 -->
			<div class="form-group">
				<select id="parent" class="form-control">
					<option value="">-----선택하세요-----</option>
					<option value="man">남성의류</option>
					<option value="woman">여성의류</option>
					<option value="it">IT/가전</option>
				</select>
			</div>
			<!-- 2차 카테고리 -->
			<div class="form-group">
				<select id="child" class="form-control"></select>
			</div>
		</form>
	</div>

	<script id="category_item_tmpl" type="text/x-handlebars-template">
		{{#each item}}
		<option value="{{value}}">{{text}}</option>
		{{/each}}
	</script>

	<script type="text/javascript">
		$(function(){

			// 1차 카테고리 에 맞추어서 2차 카테고리를 변경해줍니다.
			$("#parent").change(function(){
				// 1차 카테고리가 바뀌면 2차 카테고리에 있는 내용을 공백으로 바꿔줍니다.
				$("#child").empty();
				// 1차에서 선택한 값을 가지고 choice 변수에 넣어줍니다.
				var choice = $(this).find("option:selected").val();
				
				// 1차에서 선택한 값이 없으면 중지.
				if(!choice){
					return false;
				}
				
				$.get('../api/category.do', {type:choice}, function(req){
					var template = Handlebars.compile($("#category_item_tmpl").html());
					var html = template(req);
					// #child 에 html 읽어온 내용을 추가한다.
					$("#child").append(html);
				});
			});
		});
	</script>
</body>
</html>