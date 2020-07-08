<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점 심 뭐 먹 지 ? (Beta)</title>
</head>
<body>
	<p>점 심 뭐 먹 지 ? (Beta)</p>
	<div id="map" style="width: 1400px; height: 900px; float: left;"></div>
	<div
		style="width: 485px; height: 900px; border: solid 1px; float: right;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d03a1290cc0365fbe85fe9241f0b90c&libraries=services,clusterer,drawing"></script>
	<script>
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.815150, 127.108730), // 지도의 중심좌표
	        level: 2// 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	// 카테고리로 은행을 검색합니다
	ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	        }       
	    }
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	</script>
</body>
</html>