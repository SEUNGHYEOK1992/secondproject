<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무엇을 결과 화면</title>
<style>
		
		#result_section{
			margin: 3%;
		}
		
		#news_section{
			border : 1px solid darkblue;
			width: 400px;
			top: 45%;
			right: 4%;
			position: absolute;
			padding: 15px 5px;
		}
		
		.news_item{
			display: block;
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"> </script>
</head>
<body>
	<c:import url="../navi.jsp"></c:import>
	
		<div id ="news_section">
			<ul id ="news_list"> </ul>
		</div>
		
		<div id="result_section">
			<h3>${data.region}는... </h3>
					  ${data.best_day} , ${data.best_time}에 ${data.best_age} 유동인구가 가장 많습니다.
					이 곳의 음식점/카페 수는 ${data.mk_total }개 입니다.
	
		
		</div>
</body>

<script>

	var region = "${region}";
	
	$(document).ready(function(){
		$.ajax({
				url: "newslist",
				type:'get',
				data:{
					"region":region
				}, 
				dataType :'json',
				success:function(data){
					//div ="news_sectoin" 에다 가져온 애들을 넣어야함.
					//console.log(data);
					//console.log(data.title_1);
					//console.log(data.link_1);
					
					$("#news_list").append("<li><a href='"+data.link_1+"' class = 'news_item'>"+data.title_1+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_2+"' class = 'news_item'>"+data.title_2+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_3+"' class = 'news_item'>"+data.title_3+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_4+"' class = 'news_item'>"+data.title_4+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_5+"' class = 'news_item'>"+data.title_5+"</a></li>");
					 
					},
				error: function(e){
					console.log(e)
				}
		});
		});

</script>
</html>