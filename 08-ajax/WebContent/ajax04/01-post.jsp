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
		<h1 class="page-header">Login</h1>
		
		<form calss= "form-inline" method="post" action="../api/post.do">
			<input type="text" name="user_id" class="form-contorl"/>
			<input type="password" name="user_pw" class="form-contorl"/>
			<button type="sumbmit" class="btn btn-primary">로그인</button>
		</form>

	</div>
	
	<script type="text/javascript">

	</script>
</body>
</html>