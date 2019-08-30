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
		<h1 class = "page-header">학과 정보 조회</h1>
		
		<div class="form-group">
			<select id="dept" class="form-cotrol">
				<option value="">-----선택하세요-----</option>
				<option value="101">컴퓨터공학과</option>
				<option value="102">멀티미디어학과</option>
				<option value="201">전자공학과</option>
				<!-- 편함을 위해 src에 있는 파일을 가지고 옵니다. -->
				<!-- 기존에 없는데이터를 가지고 와도 출력에는 에러가 없습니다. (빈칸으로 출력됨)-->
				<!--  -->
				<option value="222">이 번호는 존재하지 않습니다.</option>
			</select>
		</div>
		<div id="result"></div>
	</div>

	<script id="dept_item_tmpl" type="text/x-handlebars-template">
		<ul class='list-group>
			<li class='list-group-item'>{{deptno}}</li>
			<li class='list-group-item'>{{dname}}</li>
			<li class='list-group-item'>{{loc}}</li>
		</ul>
	</script>

	<script type="text/javascript">
		$(function(){
			/* 드롭다운의 선택 변경 이벤트 입니다. */
			$("#dept").change(function(){
				$("#result").empty(); 	// 결과가 표시될 #result에 내용 지우기
				// 사용자 선택값 가져오기
				var choice = $(this).find("option:selected").val();		
				/*
				 이 경우 선택을 하지 않았을때는 
				 작동을 하면 안된다 그러니까
				 조건문을 달아서
				 선택을 하지 않았을때 멈추게 해주자.
				*/
				if(!choice){
					return false;
				}
				
				// Ajax요청
				// 우리의 경우 미리 만들어둔 컨트롤러를 가지고 옵니다.
				$.get("../api/dept_item.do",{deptno:choice}, function(req){
					// 미리 준비한 HTML 틀을 읽어온다.
					var template = Handlebars.compile($("#dept_item_tmpl").html());
					// Ajax를 통해서 읽어온 JSON을 템플릿에 병합니다.
					var html = template(req);
					// #result에 읽어온 내용을 추가한다.
					$("#result").append(html);
				});
			});		
		});
	</script>
</body>
</html>