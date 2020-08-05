<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h1>아두이노 온습도&ajax 연결하기</h1>
	<table>
		<thead>
			<tr>
				<th>시간</th>
				<th>습도</th>
				<th>온도</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<br>
	<button type="button" id="checkDHT">온습도 확인하기</button>
	
	<script type="text/javascript">
		$("#checkDHT").on('click',function(){
			$.ajax({
				method:"GET",
				url:"http://192.168.30.182/DHT11.cgi",
				dataType : "jsonp",
				jsonpCallback : "callback",
				success : function(data){
					console.log(data);
					
					var tr_data = $('<tr>');
					var td_times = $('<td>').text(new Date());
					var td_humi = $('<td>').text(data.Humidity+" %");
					var td_temp = $('<td>').text(data.Temperature+" C");
					
					tr_data.append(td_times).append(td_humi).append(td_temp);
					$("table").append(tr_data);
				}, error: function(error, code, msg){
					console.log(error);
					console.log(code);
					consele.log(msg);
				}
			});
		});
	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>