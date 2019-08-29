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
		<h1 class="page-header">JSON 읽기</h1>
		<button id="mybtn" type="button" class="btn btn-primary">학과정보 가져오기</button>
		<hr/>
		<div id="result"></div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		$("#mybtn").click(function(){
			$.get("../api/dept_item.json",function(req){
			//동적 요소의 생성 --> html()함수로 JSON안에 포함된 내용을 출력한다.
			var deptno = $("<li>").html(req.deptno).addClass("list-group-item");
			var dname = $("<li>").html(req.dname).addClass("list-group-item");
			var loc = $("<li>").html(req.loc).addClass("list-group-item");
			
			var ul=$("<ul>").addClass("list-group");
			ul.append(deptno).append(dname).append(loc);
			
			$("#result").append(ul);
			});	//end get;
		});	//end click;
	});		//end function
	//핸들바는 사실상 독립된 클래스라고 봐야한다.
	</script>
</body>
</html>