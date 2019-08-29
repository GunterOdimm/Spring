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
	<div class ="container">
	<h1 class="page-header">HTTP GET</h1>
	<button id="mybutton" class="btn btn-primary" type="button">
	다른 파일 읽어오기</button>
	<div id="result"></div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#mybutton").click(function(e){
				e.preventDefault();
				$.get('../api/get.do',{num1:100, num2:200}, function(req){
					$("#result").append(req);
				},"html");
			});
		});
	</script>
</body>
</html>