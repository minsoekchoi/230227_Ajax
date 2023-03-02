<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax_exam</title>
<style type="text/css">
table {
	width: 70%
}

table, th, td {
	border: 1px solid red;
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			$("#result").empty(); // 초기화		
			$.ajax({
				url : "test01.do", // 서버 주소
				method : "post",
				dataType : "text", // 가지고 오는 결과 타입
				async : true, // 비동기(기본, 생략가능), false=동기
				success : function(data) { // data가 결과
					console.log(data);
					$("#result").append(data);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});

		$("#btn2").click(function() {
			$("#result").empty(); // 초기화		
			$.ajax({
				url : "xml01.do", // 서버 주소
				method : "post",
				dataType : "xml", // 가지고 오는 결과 타입
				async : true, // 비동기(기본, 생략가능), false=동기
				success : function(data) { // data가 결과
					var table = "<table>";
					table += "<thead><tr><th>종류</th><th>가격</th></tr></thead>";
					table += "<tbody>";
					$(data).find("product").each(function() {
						var name = $(this).find("name").text();
						var price = $(this).find("price").text();
						table += "<tr>";
						table += "<td>" + name + "</td>";
						table += "<td>" + price + "</td>";
						table += "</tr>"
					});

					table += "</table>";
					$("#result").append(table);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});

		$("#btn3").click(function() {
			$("#result").empty(); // 초기화		
			$.ajax({
				url : "xml02.do", // 서버 주소
				method : "post",
				dataType : "xml", // 가지고 오는 결과 타입
				async : true, // 비동기(기본, 생략가능), false=동기
				success : function(data) { // data가 결과
					var table = "<table>";
					table += "<thead><tr><th>이름</th><th>개수</th></tr></thead>";
					table += "<tbody>";
					$(data).find("product").each(function() {
						var name = $(this).attr("name");
						var count = $(this).attr("count");
						table += "<tr>";
						table += "<td>" + name + "</td>";
						table += "<td>" + count + "</td>";
						table += "</tr>"
					});
					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});

		$("#btn4")
				.click(
						function() {
							$("#result").empty(); // 초기화		
							$
									.ajax({
										url : "xml03.do", // 서버 주소
										method : "post",
										dataType : "xml", // 가지고 오는 결과 타입
										async : true, // 비동기(기본, 생략가능), false=동기
										success : function(data) { // data가 결과
											var table = "<table>";
											table += "<thead><tr><th>제조사</th><th>이름</th><th>개수</th></tr></thead>";
											table += "<tbody>";
											$(data).find("product").each(
													function() {
														var company = $(this)
																.text();
														var name = $(this)
																.attr("name");
														var count = $(this)
																.attr("count");
														/* var company = $(this).find("company").text(); */
														table += "<tr>";
														table += "<td>"
																+ company
																+ "</td>";
														table += "<td>" + name
																+ "</td>";
														table += "<td>" + count
																+ "</td>";
														/* table += "<td>" + company + "</td>"; */
														table += "</tr>"
													});
											table += "</tbody>";
											table += "</table>";
											$("#result").append(table);
										},
										error : function() {
											alert("읽기 실패");
										}
									});
						});

		$("#btn5")
				.click(
						function() {
							$("#result").empty(); // 초기화		
							$
									.ajax({
										url : "xml04.do", // 서버 주소
										method : "post",
										dataType : "xml", // 가지고 오는 결과 타입
										async : true, // 비동기(기본, 생략가능), false=동기
										success : function(data) { // data가 결과
											var year = $(data).find("weather")
													.attr("year");
											var month = $(data).find("weather")
													.attr("month");
											var day = $(data).find("weather")
													.attr("day");
											var hour = $(data).find("weather")
													.attr("hour");

											var table = "<h2>" + year + ". "
													+ month + ". " + day + ". "
													+ hour + "시   </h2>"
													+ "<table>";
											table += "<thead><tr><th>지역</th><th>온도</th><th>상태</th><th>아이콘</th></tr></thead>";
											table += "<tbody>";
											$(data)
													.find("local")
													.each(
															function() {
																var local = $(
																		this)
																		.text();
																var ta = $(this)
																		.attr(
																				"ta");
																var desc = $(
																		this)
																		.attr(
																				"desc");
																var icon = $(
																		this)
																		.attr(
																				"icon");
																table += "<tr>";
																table += "<td>"
																		+ local
																		+ "</td>";
																table += "<td>"
																		+ ta
																		+ "</td>";
																table += "<td>"
																		+ desc
																		+ "</td>";
																/* table += "<td>" + icon +"</td>"; */
																table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB" + icon +".png'></td>";
																table += "</tr>";
															});

											table += "</tbody>";
											table += "</table>";
											$("#result").append(table);
										},
										error : function() {
											alert("읽기 실패");
										}
									});
						});

		$("#btn6").click(function() {
			$("#result").empty(); // 초기화		
			$.ajax({
				url : "xml05.do", // 서버 주소
				method : "post",
				dataType : "text", // 가지고 오는 결과 타입
				async : true, // 비동기(기본, 생략가능), false=동기
				success : function(data) { // data가 결과

					$("#result").append(data);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});

		$("#btn7").click(function() {
			$("#result").empty(); // 초기화		
			$.ajax({
				url : "jsontest01.do", // 서버 주소
				method : "post",
				dataType : "json", // 가지고 오는 결과 타입
				async : true, // 비동기(기본, 생략가능), false=동기
				success : function(data) { // data가 결과
					var table = "<table>";
					table += "<thead><tr><th>종류</th><th>가격</th></tr></thead>";
					table += "<tbody>";
					$.each(data, function(k, v) {
						table += "<tr>";
						var name = v["name"];
						var price = v["price"];
						table += "<td>" + name + "</td>";
						table += "<td>" + price + "</td>";
						table += "</tr>";

					})

					table += "</tbody>";
					table += "</table>";
					$("#result").append(table);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});

		$("#btn8").click(function() {
			$("#result").empty(); // 초기화		
			$.ajax({
				url : "jsontest02.do", // 서버 주소
				method : "post",
				dataType : "text", // 가지고 오는 결과 타입
				async : true, // 비동기(기본, 생략가능), false=동기
				success : function(data) { // data가 결과
					$("#result").append(data);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});

	});
	/* 밑에꺼 읽고 실행하는거 */
	/* 위의 방식 까먹었다 이게 뭐였지 */
</script>

</head>
<body>
	<h1>Ajax 예제</h1>
	<hr>
	<button id="btn1">텍스트</button>
	<button id="btn2">XML</button>
	<button id="btn3">XML_Attr</button>
	<button id="btn4">XML_Final</button>
	<button id="btn5">외부 XML_1</button>
	<button id="btn6">외부 XML_2</button>
	<button id="btn7">JSON</button>
	<button id="btn8">외부 JSON</button>
	<hr>
	<div id="result"></div>
	<hr>
	<!-- Kakao Login 실습  -->
	<!--
	1. developer kakao 검색 / https://developers.kakao.com/ 접속 로그인 하기
	2. 내 애플리케이션 생성
		REST API 키 : 복사하기
		Redirect URI 등록 : http://localhost:8090/login.do
	-->
	<a
		href="https://kauth.kakao.com/oauth/authorize?client_id=1f0754fda7f116a7b27b1064a61e507a&redirect_uri=	
http://localhost:8090/login.do&response_type=code">
		<img src="resources/img/kakao_login_large_narrow.png">
	</a>
	<hr>

	<!-- 지도보기  -->
	<p>
		<a href="kakaomap01.do">카카오 지도 연습 01</a>
	</p>
	<p>
		<a href="kakaomap02.do">카카오 지도 연습 02</a>
	</p>
	<p>
		<a href="kakaomap03.do">카카오 지도 연습 03</a>
	</p>
	<p>
		<a href="kakaomap04.do">카카오 지도 연습 04</a>
	</p>
	<p>
		<a href="kakaomap05.do">카카오 지도 연습 05</a>
	</p>
	<p>
		<a href="kakaomap06.do">카카오 지도 연습 06</a>
	</p>

	<hr>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%-- 나중에 form에 담아서 보내야 한다.--%>

	<input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()"
		value="우편번호 찾기">
	<br>
	<input type="text" id="sample6_address" placeholder="주소">
	<br>
	<input type="text" id="sample6_detailAddress" placeholder="상세주소">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목">

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
</body>
</html>
















