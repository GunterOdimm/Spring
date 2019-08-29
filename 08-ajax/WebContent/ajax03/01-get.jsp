<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minmum-scale=1.0, user-scalable=no"/>
<title>Hello AJAX</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- AjaxHelper -->
<script src="../plugins/ajax/ajax_helper.js"></script>
<link rel="stylesheet" type="text/css" href="../plugins/ajax/ajax_helper.css"/>
</head>
<body>
	<div class = "container">
		<h1 class="page=header"> HTTP GET</h1>
		
		<!-- 직접이동 -->
		<a href="../api/get.do?num1=123&num2=456" class="btn btn-warning">직접이동</a>
		
		<button id="mybutton" class="btn btn-primary" type="button">다른 파일 읽어오기</button>
		<!-- 결과가 출력될 div -->
		<div id="result"></div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		$("#mybutton").click(function(e){
			e.preventDefault();
			$.ajax({
				url:'../api/get.do',
				method:'get',
				data:{num1:123,num2:456},
				dataType:'html',
				success:function(req){
					$("#result").append(req);
				}
			});
		});
	});
	</script>
</body>
</html>