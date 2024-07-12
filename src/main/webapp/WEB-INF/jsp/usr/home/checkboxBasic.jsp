<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="CHECKBOX BASIC" />

<%@ include file="../../common/head.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<form action="checkboxSubmit" method="post">
				<label>
					<input type="checkbox" name="ids" value="1" />
					테스트1
				</label>
				<br />
				<label>
					<input type="checkbox" name="ids" value="2" />
					테스트2
				</label>
				<br />
				<label>
					<input type="checkbox" name="ids" value="3" />
					테스트3
				</label>
				<br />
				<label>
					<input type="checkbox" name="ids" value="4" />
					테스트4
				</label>
				<br />
				<button class="btn btn-active btn-sm">제출</button>
			</form>
		</div>
	</section>

<%@ include file="../../common/foot.jsp" %>