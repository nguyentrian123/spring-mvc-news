<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${model.name}</title>
</head>
<body>

	<!--Main layout-->
	<main class="my-5">
	<form action="<c:url value='/the-loai'/>" id="formSubmit" method="get">
		

		<div class="container">
			<!--Grid row-->
			<div class="row">
				<!--Grid column-->
				<div class="col-md-9 mb-4">
					<!--Section: Content-->
					<section>
						<c:forEach var="item" items="${models.listResult}">
							<div class="row">
								<div class="col-md-4 mb-4">
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

								<div class="col-md-8 mb-4">
									<c:url var="newDetail" value="/chi-tiet/bai-viet">
										<c:param name="id" value="${item.id}"/>															
									</c:url>
									<a href="${newDetail}" style="color:black"><h5>${item.title}</h5></a>
									<p>${item.shortDescription}</p>
									<input type="hidden" value="${item.categoryCode }" id="code" name="code" />
									
									<a href="${newDetail}"><button type="button" class="btn btn-primary">Đọc bài</button></a>
								</div>
							</div>
						</c:forEach>
					</section>
					<!--Section: Content-->
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-md-3 mb-4">
					<!--Section: Sidebar-->
					<section class="sticky-top" style="top: 80px;">
						<!--Section: Ad-->
						<section class="text-center border-bottom pb-4 mb-4">
							<div class="bg-image hover-overlay ripple mb-4">
								<img
									src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/about/assets/mdb5-about.webp"
									class="img-fluid" /> <a
									href="https://mdbootstrap.com/docs/standard/" target="_blank">
									<div class="mask"
										style="background-color: rgba(57, 192, 237, 0.2);"></div>
								</a>
							</div>
							<h5>Material Design for Bootstrap 5</h5>

							<p>500+ components, free templates, 1-min installation,
								extensive tutorial, huge community. MIT license - free for
								personal & commercial use</p>
							<a role="button" class="btn btn-primary"
								href="https://mdbootstrap.com/docs/standard/" target="_blank">Download
								for free<i class="fas fa-download ms-2"></i>
							</a>
						</section>
						<!--Section: Ad-->

						<!--Section: Video-->
						<section class="text-center">
							<h5 class="mb-4">Learn the newest Bootstrap 5</h5>

							<div
								class="embed-responsive embed-responsive-16by9 shadow-4-strong">
								<iframe class="embed-responsive-item rounded"
									src="https://www.youtube.com/embed/c9B4TPnak1A" allowfullscreen></iframe>
							</div>
						</section>
						<!--Section: Video-->
					</section>
					<!--Section: Sidebar-->
				</div>
				<!--Grid column-->
			</div>
			<!--Grid row-->

		</div>
		
		<div style="margin-left: 30px">
			<ul class="pagination" id="pagination"></ul>
			<input type="hidden" value="10" id="page" name="page" />
			<input type="hidden" value="10" id="limit" name="limit" />
			
		</div>
		<!-- Pagination -->
			
			
	</form>
	</main>
	<script>
		var totalPages = ${models.totalPage};
		var currentPage = ${models.page}; // client truyền về 1 cái page sau đó ta sẽ truyền lại client để xử lý tiếp
		
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page, title) {
					if (currentPage != page) {
						$('#code').val();
						$('#limit').val(10);
						$('#page').val(page);
						$('#formSubmit').submit();
					}

				}
			});
		});
	</script>
</body>
</html>