<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#res").empty();
		$.ajax({
			url : "member.do",
			method : "post",
			dataType : "json",
			success : function(data) {
			var name = "";
			var email = "";
			$.each(data, function(k, v) {
				var profile = v["profile"];
				$.each(profile, function(k, v) {
					name = profile["nickname"];
				});
				email = v["email"];
			});
				$("#res").append(name+"("+email+")님 환영합니다.");
			},
			error : function() {
				alert("읽기실패");
			}
		});
	});
</script>
</head>
<body>
	<h2>결과 보기</h2>
	<div id="res"></div>
</body>
</html>