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

</head>
<body>
	<div class="container">
		<!-- h1 에 클래스 명을 page-header로 정의 함으로써 hr/기능 또한 추가시켜 준다. -->
		<h1 class = "page-header">중복검사 예제</h1>
		<div class="form-group">
			<label for="user_id">아이디</label>
			<div class="input-gruop">
				<input type="text" class="form-control" id="user_id"/>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button" id="id_uniq_check">중복검사</button>
				</span>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#id_uniq_check").click(function(){
				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				// 에러가 나면 이곳에서 데이터 값을 제대로 받고 있는지 확인하자.
				var user_id_val = $("#user_id").val();
				if(!user_id_val){
					alert("아이디를 입력하세요");
					// 포커스를 user_id input창으로 강제로 보낸다.
					$("#user_id").focus();		
					return false;
				}
				
				$.post("../api/id_unique_check.do",{user_id:user_id_val}, function(req){
					if(req.result == 'OK'){
						alert("사용 가능한 아이디 입니다.");
					}else{
						alert("사용을 할수 없는 아이디 입니다.");
						// 중복된 아이디를 만드려고 하면 다시 값을 공백처리 해줘야한다.
						$("#user_id").val("");
						$("#user_id").focus();
					}
				});
			});		
		});
	</script>
</body>
</html>