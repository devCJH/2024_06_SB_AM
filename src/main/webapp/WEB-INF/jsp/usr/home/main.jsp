<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN" />

<%@ include file="../../common/head.jsp" %>

	<script>
		$(document).ready(function(){
			$('#testBtn').click(function(){
				$.ajax({
					url : '/usr/home/test', // 요청을 보낼 URL
					type : 'GET', // HTTP 메서드(GET, POST, PUT, DELETE 등)
					data : { // 서버로 전송할 데이터
						key1 : 'value1',
						key2 : 'value2'
					},
					dataType : 'json', // 서버에서 응답 받을 데이터의 타입
					success : function(data) {
						console.log(data);
						$('#testDiv').html('<div>' + data.resultMsg + '</div>');
					},
					error : function(xhr, status, error) {
						console.log(error);
					}
				})
			})
		})
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<div><button id="testBtn" class="btn btn-active btn-sm">테스트</button></div>
			<div id="testDiv"></div>
			<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore facilis cum aut facere numquam magni itaque. Repellendus quibusdam maiores tenetur autem repellat consectetur minus nobis aut soluta tempora architecto natus?</div>
			<div>안녕하세요</div>
		</div>
	</section>

<%@ include file="../../common/foot.jsp" %>