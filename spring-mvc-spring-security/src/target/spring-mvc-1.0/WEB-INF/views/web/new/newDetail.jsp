<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="commentAPI" value="/api/comment" />
<c:url var="commentURL" value="/chi-tiet/bai-viet" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết</title>
</head>
<body>


	<main>
		<!-- About US Start -->
		<div class="about-area">
			<div class="container">
				<!-- Hot Aimated News Tittle-->
				<div class="row">
					<div class="col-lg-12">
						<div class="trending-tittle">
							<strong>Trending now</strong>
							<!-- <p>Rem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
							<div class="trending-animated">
								<ul id="js-news" class="js-hidden">
									<li class="news-item">Bangladesh dolor sit amet,
										consectetur adipisicing elit.</li>
									<li class="news-item">Spondon IT sit amet,
										consectetur.......</li>
									<li class="news-item">Rem ipsum dolor sit amet,
										consectetur adipisicing elit.</li>
								</ul>
							</div>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						<!-- Trending Tittle -->
						<div class="about-right mb-90">
							<div class="about-img">
								<img src="assets/img/trending/trending_top.jpg" alt="">
							</div>

							<div class="about-prea">${models.content}</div>
							<input type="hidden" value="${models.id}" id="newsId"
								name="newsId" />

							<div class="social-share pt-30">
								<div class="section-tittle">
									<h3 class="mr-20">Comment:</h3>
									<ul>
										<li><a href="#"><img
												src="assets/img/news/icon-ins.png" alt=""></a></li>
										<li><a href="#"><img
												src="assets/img/news/icon-fb.png" alt=""></a></li>
										<li><a href="#"><img
												src="assets/img/news/icon-tw.png" alt=""></a></li>
										<li><a href="#"><img
												src="assets/img/news/icon-yo.png" alt=""></a></li>
									</ul>
								</div>
							</div>
						</div>

						<!--Comment  -->
						<div class="row">
							<div class="col-lg-8">
								<form class="form-contact contact_form mb-80"
									action="contact_process.php" method="post" id="contactForm"
									novalidate="novalidate">
									<div class="row">
										<div class="form-outline">
											<textarea class="form-control" id="content" name="content"
												rows="4"></textarea>
											<label class="form-label" for="textAreaExample">What
												is your view?</label>
										</div>
										<div class="d-flex justify-content-between mt-3">
											<button class="btn btn-info" type="button"
											id="btnAddComment">
												Send <i class="fas fa-long-arrow-alt-right ms-1"></i>
											</button>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>



					<div class="col-lg-4">
						<!-- Section Tittle -->
						<div class="section-tittle mb-40">
							<h3>Follow Us</h3>
						</div>
						<!-- Flow Socail -->
						<div class="single-follow mb-45">
							<div class="single-box">
								<div class="follow-us d-flex align-items-center">
									<div class="follow-social">
										<a href="#"><img
											src="<c:url value='/template/new/assets/img/news/icon-fb.png'/>"
											alt=""></a>
									</div>
									<div class="follow-count">
										<span>8,045</span>
										<p>Fans</p>
									</div>
								</div>
								<div class="follow-us d-flex align-items-center">
									<div class="follow-social">
										<a href="#"><img
											src="<c:url value='/template/new/assets/img/news/icon-tw.png'/>"
											alt=""></a>
									</div>
									<div class="follow-count">
										<span>8,045</span>
										<p>Fans</p>
									</div>
								</div>
								<div class="follow-us d-flex align-items-center">
									<div class="follow-social">
										<a href="#"><img
											src="<c:url value='/template/new/assets/img/news/icon-ins.png'/>"
											alt=""></a>
									</div>
									<div class="follow-count">
										<span>8,045</span>
										<p>Fans</p>
									</div>
								</div>
								<div class="follow-us d-flex align-items-center">
									<div class="follow-social">
										<a href="#"><img
											src="<c:url value='/template/new/assets/img/news/icon-yo.png'/>"
											alt=""></a>
									</div>
									<div class="follow-count">
										<span>8,045</span>
										<p>Fans</p>
									</div>
								</div>
							</div>
						</div>
						<!-- New Poster -->
						<div class="news-poster d-none d-lg-block">
							<img
								src="<c:url value='/template/new/assets/img/news/news_card.jpg'/>"
								alt="">
						</div>
					</div>

					<!-- watch comment  -->
					<section style="background-color: #f7f6f6;">
						<div class="container my-5 py-5 text-dark">
							<div class="row d-flex justify-content-center">
								<div class="col-md-12 col-lg-10 col-xl-8">
									<div
										class="d-flex justify-content-between align-items-center mb-4">
										<h4 class="text-dark mb-0">Unread comments (4)</h4>
										<div class="card">
											<div class="card-body p-2 d-flex align-items-center">
												<h6 class="text-primary fw-bold small mb-0 me-1">Comments
													"ON"</h6>
												<div class="form-check form-switch">
													<input class="form-check-input" type="checkbox"
														id="flexSwitchCheckChecked" checked /> <label
														class="form-check-label" for="flexSwitchCheckChecked"></label>
												</div>
											</div>
										</div>
									</div>


								<c:forEach var="item" items="${comments}">
									<div class="card mb-3">
										<div class="card-body">
											<div class="d-flex flex-start">
												<img class="rounded-circle shadow-1-strong me-3"
													src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(21).webp"
													alt="avatar" width="40" height="40" />
												<div class="w-100">
													<div
														class="d-flex justify-content-between align-items-center mb-3">
														<h6 class="text-primary fw-bold mb-0">
															the_sylvester_cat 
															<span class="text-dark ms-2">
																${item.content }
															</span>
														</h6>
														<p class="mb-0">3 days ago</p>
													</div>
													<div
														class="d-flex justify-content-between align-items-center">
														<p class="small mb-0" style="color: #aaa;">
															
															<a class="link-grey">Remove</a> 
																• <a href="#!"
																class="link-grey">Reply</a> • <a href="#!"
																class="link-grey">Translate</a>
														</p>
														<div class="d-flex flex-row">
															<i class="far fa-check-circle text-primary"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<!-- About US End -->
	</main>

	<script>
	$('#btnAddComment').click(function(e) {
		e.preventDefault(); // nhận biết đc ta sẽ submit vào url nào, bắt buộc có
		var data = {};
		data["content"] = $('#content').val();
		data["news_Id"]= $('#newsId').val();
		addComment(data);
	});
	
	function addComment(data) {
		$.ajax({
			url : '${commentAPI}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${commentURL}?id="+1+"&message=insert_success";
			},
			error : function(error) {
				window.location.href = "${commentURL}?message=error_system";
			}
		});
	}
	</script>

</body>
</html>