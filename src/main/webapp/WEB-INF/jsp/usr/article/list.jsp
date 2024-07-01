<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${boardName } 게시판" />

<%@ include file="../../common/head.jsp" %>

	<section class="my-8 text-lg">
		<div class="container mx-auto px-3">
			<div class="mb-2 ml-3 text-sm flex justify-between items-end">
				<div><span>총 : ${articlesCnt }개</span></div>
				
				<form>
					<div class="flex">
						<input type="hidden" name="boardId" value="${param.boardId }" />
						
						<select data-value="${param.searchKeywordType }" class="select select-bordered select-sm" name="searchKeywordType">
							<option value="title">제목</option>
							<option value="body">내용</option>
							<option value="title,body">제목 + 내용</option>
						</select>
						
						<label class="input input-bordered flex items-center gap-2 input-sm w-60 mx-2">
						  <input type="text" class="grow" name="searchKeyword" value="${param.searchKeyword }"  placeholder="검색어를 입력해주세요" />
						  <svg
						    xmlns="http://www.w3.org/2000/svg"
						    viewBox="0 0 16 16"
						    fill="currentColor"
						    class="h-4 w-4 opacity-70">
						    <path
						      fill-rule="evenodd"
						      d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
						      clip-rule="evenodd" />
						  </svg>
						</label>
						
						<button class="hidden">검색</button>
					</div>
				</form>
			</div>
			
			<div class="table-box-type">
				<table class="table table-lg">
					<colgroup>
						<col width="60" />
						<col width="" />
						<col width="80" />
						<col width="200" />
						<col width="40" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class="hover">
									<td>${article.id }</td>
								<td class="hover:underline"><a href="detail?id=${article.id }">${article.title }</a></td>
								<td>${article.writerName }</td>
								<td>${article.updateDate.substring(2, 16) }</td>
								<td>${article.views }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<div class="flex justify-end mt-2 mr-3">
					<a class="btn btn-active btn-sm" href="write">글쓰기</a>
				</div>
			</c:if>
			
			<div class="mt-3 flex justify-center">
				<div class="join">
				
					<c:set var="baseUri" value="boardId=${param.boardId }&searchKeywordType=${param.searchKeywordType }&searchKeyword=${param.searchKeyword }" />
					
					<c:if test="${from != 1 }">
						<a class="join-item btn btn-sm" href="?cPage=1&${baseUri }"><i class="fa-solid fa-angles-left"></i></a>
						<a class="join-item btn btn-sm" href="?cPage=${from - 1 }&${baseUri }"><i class="fa-solid fa-caret-left"></i></a>
					</c:if>
					
					<c:forEach begin="${from }" end="${end }" var="i">
						<a class="join-item btn btn-sm ${cPage == i ? 'btn-active' : '' }" href="?cPage=${i }&${baseUri }">${i }</a>
					</c:forEach>
					
					<c:if test="${end != totalPageCnt }">
						<a class="join-item btn btn-sm" href="?cPage=${end + 1 }&${baseUri }"><i class="fa-solid fa-caret-right"></i></a>
						<a class="join-item btn btn-sm" href="?cPage=${totalPageCnt }&${baseUri }"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>
			
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>