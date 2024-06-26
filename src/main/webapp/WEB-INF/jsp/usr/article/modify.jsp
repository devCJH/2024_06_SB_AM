<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE MODIFY" />

<%@ include file="../../common/head.jsp" %>

	<script>
		const modifyForm_onSubmit = function(form) {
			form.title.value = form.title.value.trim();
			form.body.value = form.body.value.trim();
			
			if (form.title.value.length == 0) {
				alert('제목을 입력해주세요');
				form.title.focus();
				return;
			}
			
			if (form.body.value.length == 0) {
				alert('내용을 입력해주세요');
				form.body.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<form action="doModify" method="post" onsubmit="modifyForm_onSubmit(this); return false;">
				<input type="hidden" name="id" value="${article.id }" />
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
							<th>작성자</th>
							<td>${article.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="input input-bordered w-full max-w-xs" type="text" name="title" value="${article.title }"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="textarea textarea-bordered textarea-lg w-full max-w-xs" name="body">${article.body }</textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="btns flex justify-center">
									<button class="btn btn-active btn-wide">수정</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
			
			<div class="mt-3 text-sm">
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>