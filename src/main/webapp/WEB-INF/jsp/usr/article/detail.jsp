<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL" />

<%@ include file="../../common/head.jsp" %>

	<script>
		$(document).ready(function(){
			getLikePoint();
			
			$('#likePointBtn').click(async function(){
				
				let likePointBtn = $('#likePointBtn').hasClass('btn-active');
				try{
					await $.ajax({
						url : '../likePoint/doLikePoint',
						type : 'GET',
						data : {
							relTypeCode : 'article',
							relId : ${article.id },
							likePointBtn : likePointBtn
						},
					})
					
					let totalCnt = await getLikePoint();
					
					$('#likePointCnt').html(totalCnt.data + ' 개');
				} catch (error) {
					console.log('Error : ', error);
				}
			})
		})
		
		const getLikePoint = async function(){
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
						$('#likePointBtn').addClass('btn-active');
					} else {
						$('#likePointBtn').removeClass('btn-active');
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
								<button id="likePointBtn" class="btn btn-sm btn-outline">
								  좋아요
								  <svg
								    xmlns="http://www.w3.org/2000/svg"
								    class="h-6 w-6"
								    fill="none"
								    viewBox="0 0 24 24"
								    stroke="currentColor">
								    <path
								      stroke-linecap="round"
								      stroke-linejoin="round"
								      stroke-width="2"
								      d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
								  </svg>
								</button>
								&nbsp;&nbsp;
								<span id="likePointCnt">${article.likePoint } 개</span>
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