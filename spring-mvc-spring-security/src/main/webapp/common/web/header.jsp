<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>		
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/trang-chu'/>">An Express</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="<c:url value='/trang-chu'/>">Trang chủ
						<span class="sr-only">(current)</span>
				</a></li>
				<security:authorize access = "isAnonymous()"> <!-- Security nó build sẵn Access nên cần phải ghi đúng -->
					<li class="nav-item"><a class="nav-link" href="<c:url value='/dang-nhap'/>">Đăng nhập</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/dang-ky'/>">Đăng ký</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
					<c:url var="adminPage" value="/quan-tri/trang-chu">													
					</c:url>
    				<li class="nav-item"><a class="nav-link" href="${adminPage}">Go to Admin Page</a></li>
				</security:authorize>
				<security:authorize access = "isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="#">Wellcome <%=SecurityUtils.getPrincipal().getFullName() %></a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/thoat'/>">Thoát</a></li>
				</security:authorize>
				
			</ul>
		</div>
	</div>
</nav>

<!-- Menu -->
	
	<div style="background-color:#E6E6FA">
		<nav class="navbar navbar-expand-sm " >
			<ul class="navbar-nav" style="margin-left: 200px" >
				
				<c:forEach var="item" items="${model.listResult}">
					<c:url var="categoryURL" value="/the-loai?page=1&limit=10">
						<c:param name="code" value="${item.code}"/>														
					</c:url>
					<li  class="nav-item">
						<b><a class="nav-link" style="color:black; margin-left:30px " href="${categoryURL} ">${item.name}</a></b>
					<li>
				</c:forEach>		
			</ul>
		</nav>
	</div>
	
	<!-- Menu -->

	