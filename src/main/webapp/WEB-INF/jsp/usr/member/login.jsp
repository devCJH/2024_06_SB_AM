<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER LOGIN" />

<%@ include file="../../common/head.jsp" %>
	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<form action="doLogin" method="post">
				<div class="table-box-type">
					<table>
						<tr>
							<th>아이디</th>
							<td><input class="w-96" type="text" name="loginId" placeholder="아이디를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="w-96" type="text" name="loginPw" placeholder="비밀번호를 입력해주세요" /></td>
						</tr>
						<tr>
							<td colspan="2"><div class="btns"><button>로그인</button></div></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="btns mt-3 text-sm">
				<button onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>