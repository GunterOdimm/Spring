<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minmum-scale=1.0, user-scalable=no" />
<title>Hello AJAX</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- AjaxHelper -->
<script src="../plugins/ajax/ajax_helper.js"></script>
<link rel="stylesheet" type="text/css"
	href="../plugins/ajax/ajax_helper.css" />
<!-- ajax-form -->
<!-- 이처럼 어떤 파일이던 경로를 잡아서 참조해줄때는 무조건 파일의 확장자 명까지 모두 써줘야 한다. -->
<script src="../plugins/ajax-form/jquery.form.min.js"></script>
<script src="../plugins/validate/jquery.validate.min.js"></script>
</head>
<body>
	<div class="container">
		<!-- h1 에 클래스 명을 page-header로 정의 함으로써 hr/기능 또한 추가시켜 준다. -->
		<h1 class="page-header">Login</h1>

		<form id="login-form" class="form-inline" method="post" action="../api/login_ok.do">
			<input type="text" name="user_id" id="user_id" class="form-control" />
			<input type="password" name="user_pw" id="user_pw" class="form-control" />
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>

	<script type="text/javascript">
		$(function(){
			$("#login-form").validate({
				onkeyup: false,
				onclick: false,
				onfocusout: false,
				showErrors: function(errorMap,errorList){
					if(errorList.length < 1){
						return;
					}
					alert(errorList[0].message);
				},
				// 검사 규칙을 정의 합니다.
				rules: {
					// input요소의 name 속성을 key로 정의 하는 코드입니다.
					user_id: "required",
					user_pw: "required"
				},
				messages: {
					user_id: "아이디를 입력하세요.",
					user_pw: "비밀전호를 입력하세요."
				}
			});
			$("#login-form").ajaxForm({
				beforeSubmit: function (arr, form ,options){
					// valudation 플러그인을 수동으로 호출하여 결과를 리턴한다.
					// 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
					return $(form).valid();
				},
				suscces: function(json){
					if(json.result == "FAIL"){
						alert("아이디 혹은 비밀 번호를 확인하세요");
						return false;
					}						
					alert("로그인 되셨습니다.");
					
					window.location.reload();
				}
			});
		});
	</script>
</body>
</html>