<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL" />

<%@ include file="../../common/head.jsp" %>

	<script>
		$(document).ready(function(){
			getLikePoint();
			
			$('#likePointBtn').click(async function(){
				
				let liked = $('i.fa-heart').hasClass('fa-solid');
				try{
					await $.ajax({
						url : '../likePoint/doLikePoint',
						type : 'GET',
						data : {
							relTypeCode : 'article',
							relId : ${article.id },
							liked : liked
						},
					})
					
					let totalCnt = await getLikePoint();
					
					$('#likePointCnt').html(totalCnt.data);
				} catch (error) {
					console.log('Error : ', error);
				}
			})
		})
		
		const getLikePoint = async function(){
			let likePointBtn = $('#likePointBtn');
			
			return $.ajax({
				url : '../likePoint/getLikePoint',
				type : 'GET',
				data : {
					relTypeCode : 'article',
					relId : ${article.id }
				},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						likePointBtn.html(`
								<i class="fa-solid fa-heart"></i>
								<span id="likePointCnt">${article.likePoint }</span>
								`);
					} else {
						likePointBtn.html(`
								<i class="fa-regular fa-heart"></i>
								<span id="likePointCnt">${article.likePoint }</span>
								`);
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
		}
	</script>

	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<div class="table-box-type">
				<table class="table table-lg">
					<tr>
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${article.updateDate.substring(2, 16) }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${article.views }</td>
					</tr>
					<tr>
						<th>추천수</th>
						<td>
							<c:if test="${rq.getLoginedMemberId() == 0 }">
								<span>${article.likePoint } 개</span>
							</c:if>
							<c:if test="${rq.getLoginedMemberId() != 0 }">
								<button id="likePointBtn" class="btn btn-active btn-sm"></button>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.writerName }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${article.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${article.body }</td>
					</tr>
				</table>
			</div>
			
			<div class="mt-3 text-sm">
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
				<c:if test="${rq.getLoginedMemberId() == article.memberId }">
					<a class="btn btn-active btn-sm" href="modify?id=${article.id }">수정</a>
					<a class="btn btn-active btn-sm" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
				</c:if>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>