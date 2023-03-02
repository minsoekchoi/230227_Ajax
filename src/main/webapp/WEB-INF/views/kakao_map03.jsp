<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dce2b3b82c0dc9a7705feeccd7f8c666"></script>
	<script type="text/javascript">
	navigator.geolocation.getCurrentPosition(function(position) {
		var lat = position.coords.latitude ;
		var lon = position.coords.longitude ;
		geo_map(lat, lon);
	});
	</script>
</head>
<body>
	<h1>카카오 맵 연습 03(내 위치 표시)</h1>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 50%; height: 350px;"></div>

	<script>
		function geo_map(lat, lon) {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				level : 3	// 지도의 확대 레벨
			};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(lat, lon); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
			
			var iwContent = '<div style="padding:5px;"><a href="http://ictedu.co.kr">한국ICT 인재개발원</a></div>';
		    iwPosition = new kakao.maps.LatLng(lat,lon); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    	content : iwContent 
			});
		  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			
		}
	</script>
</body>
</html>