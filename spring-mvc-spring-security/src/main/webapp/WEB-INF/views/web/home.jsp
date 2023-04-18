<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Trang chủ</title>

</head>

<body>

	

	
	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<c:url var="imgUrl" value="/uploads/${models.listResult.get(0).thumbnail.get(0)}" />
				<img class="img-fluid rounded mb-4 mb-lg-0"
					src="${imgUrl}" alt=""  style="width:500;height:350">
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5" style="margin-top:-190px;">
				<c:url var="newDetail" value="/chi-tiet/bai-viet">
										<c:param name="id" value="${models.listResult.get(0).id}"/>															
				</c:url>
				<h1 class="font-weight-light"><b><a href="${newDetail}" style="color:black">${models.listResult.get(0).title}</a></b></h1>
				<p>${models.listResult.get(0).shortDescription}</p>
				
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->
	 
	 
	 
	 	<!-- content song song -->
	 	<div class ="row">
	 		<div class="col-md-6 mb-4">
				<section>
						<c:forEach var="item" items="${newsSport}">
							<div class="row">
								<div class="col-md-6 mb-4">
									<div
										class="bg-image hover-overlay shadow-1-strong rounded ripple"
										data-mdb-ripple-color="light">
										<c:url var="imgUrl" value="/uploads/${item.thumbnail.get(0)}" />
										<img
											src="${imgUrl}"
											class="img-fluid" /> <a href="#!">
											<div class="mask"
												style="background-color: rgba(251, 251, 251, 0.15);"></div>
										</a>
										
									</div>
								</div>

								<div class="col-md-6 mb-4">
									<c:url var="newDetail" value="/chi-tiet/bai-viet">
										<c:param name="id" value="${item.id}"/>															
									</c:url>
									<a href="${newDetail}" style="color:black"><h5>${item.title}</h5></a>
									<p>${item.shortDescription}</p>
									<input type="hidden" value="${item.categoryCode }" id="code" name="code" />
									
									
								</div>
							</div>
						</c:forEach>
					</section>
			</div> 
			
			<div class="col-md-6 mb-4">
					<!--Section: Content-->
					<section>
						<c:forEach var="item" items="${newsEconomy}">
							<div class="row">
								<div class="col-md-6 mb-4">
									<div
										class="bg-image hover-overlay shadow-1-strong rounded ripple"
										data-mdb-ripple-color="light">
										<c:url var="imgUrl" value="/uploads/${item.thumbnail.get(0)}" />
										<img
											src="${imgUrl}"
											class="img-fluid" /> <a href="#!">
											<div class="mask"
												style="background-color: rgba(251, 251, 251, 0.15);"></div>
										</a>
										
									</div>
								</div>

								<div class="col-md-6 mb-4">
									<c:url var="newDetail" value="/chi-tiet/bai-viet">
										<c:param name="id" value="${item.id}"/>															
									</c:url>
									<a href="${newDetail}" style="color:black"><h5>${item.title}</h5></a>
									<p>${item.shortDescription}</p>
									<input type="hidden" value="${item.categoryCode }" id="code" name="code" />
									
							
								</div>
							</div>
						</c:forEach>
					</section>
					<!--Section: Content-->
			</div>
		</div>
		
		
		

		<!-- Content Row -->
		<div class="row">
			<c:forEach var="item" items="${models.listResult}">
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						
						<div>
							<c:url var="imgUrl" value="/uploads/${item.thumbnail.get(0)}" />
							<img src="${imgUrl}" width="348" height="250"/>
						</div>
						
						<div class="card-body">
							<c:url var="newDetail" value="/chi-tiet/bai-viet">
									<c:param name="id" value="${item.id}"/>															
							</c:url>		
							<a href="${newDetail }" style="color: black;">
								<h2 class="card-title">${item.title}</h2>							
							</a>	
							<p class="card-text">${item.shortDescription}</p>	
						</div>
						
						
						<div class="card-footer">
							<a href="${newDetail }" class="btn btn-primary btn-sm">Xem bài viết</a>
						</div>
					</div>
				</div>
				<!-- /.col-md-4 -->
			
			</c:forEach>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

</body>

</html>