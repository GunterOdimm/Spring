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

</head>
<body>
	<div class="container">
		<h1 class="page-header">안녕 에이젝스</h1>
		<button id="mybutton" class="btn btn-primary" type="button">다른 파일을 읽어오기.</button>
		<div id="result"></div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#mybutton").click(function(e){
				$.ajax({
					cache: false,
					url:'../api/hello.html', //이경우 hello가 html 이라 html jsp도 읽어오는데 문제 없음
					method: 'get',
					data:{},
					dataType:'html',
					timeout:30000,
					
					beforeSend:function(){
						console.log(">> Ajax 통신 시작>> " + this.url);
					},
					success: function(req){
						console.log(">> 성공했습니다. >> " + req);
						$("#result").append(req);
					},
					error:function(error){
						console.log(">> 에러입니다. >>" + error.status);
					},
					complete:function(){
						console.log(">> Ajax 통신 종료 >>");
					}
				})
			});
		});
	</script>
</body>
</html>