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
<script src="../plugins/handlebars/handlebars-v4.1.2.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="page-header">JSON 읽기</h1>
		<button id="mybtn" type="button" class="btn btn-primary">학과 정보 가지고오기</button>
		<hr />
		<div id='result'></div>
	</div>

	<script id="dept_item_tmpl" type="text/x-handlebars-template">
		<ul class='list-group'>
			<li class='list-group-item'>{{deptno}}</li>
			<li class='list-group-item'>{{dname}}</li>
			<li class='list-group-item'>{{loc}}</li>
		</ul>
	</script>

	<script type="text/javascript">
		$(function(){
			$("#mybtn").click(function(){
				$.get('../api/dept_item.json',function(req){
					var template = Handlebars.compile($("#dept_item_tmpl").html());
					var html = template(req);
					$("#result").append(html);
				});
			});
		});
	</script>
</body>
</html>