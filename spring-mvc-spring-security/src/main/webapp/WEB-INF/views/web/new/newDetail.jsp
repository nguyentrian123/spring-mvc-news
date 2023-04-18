<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="commentAPI" value="/api/comment" />
<c:url var="commentURL" value="/chi-tiet/bai-viet" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${models.title}</title>
</head>
<body>


	<main>
		<!-- About US Start -->
		<div class="about-area">
			<div class="container">
		
				
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
										<h4 class="text-dark mb-0">comments ${comments.size()}</h4>
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
										<!--check ParentID sao chi duyet dc 1 lan in ra ?-->
										<c:if test="${empty item.parentComment}">
											<input type="hidden" value="${item.parentComment}" id="emptyParentCommentId"
											name="emptyParentCommentId" />
											<div class="card mb-3" id = "comments-container">
												<div class="card-body">
													<div class="d-flex flex-start">
														<img class="rounded-circle shadow-1-strong me-3"
															src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(21).webp"
															alt="avatar" width="40" height="40" />				
														<div class="w-100" >
															<div
																class="d-flex justify-content-between align-items-center mb-3">
																<h6 class="text-primary fw-bold mb-0">
																	<span style="color: black;" >${item.fullNameComment }</span>
																	<span class="text-dark ms-2" style="font-weight: 400;" id="my-content-${item.id}" >
																		${item.content }
																	</span>
																</h6>
																<!-- <p class="mb-0">3 days ago</p> -->
															</div>
															<div
																class="d-flex justify-content-between align-items-center">
																<p class="small mb-0" style="color: #aaa;" data-comment-id="${item.id}">
																		<c:if test="${item.userAuth != null}">
																			<a href="#!"class="link-grey reply-link reply-link-${item.id}">Reply</a> 
																		</c:if>
																		<c:if test="${ item.user_Id == item.userAuth}"> • 
																			<a  href="#!" class="link-grey edit-link ">Edit</a> •
																			<a href="#!" class="link-grey remove-link remove-link-${item.id}" onclick="warningBeforeDelete(${item.id})">Remove</a> 
																		</c:if>								
																</p>
																
															</div>
															
													<c:set var="previousId" value="" /> <!--dùng để save lai commentId để check những child sau-->
													<c:set var="userName" value="" />
													<c:forEach var="childComment" items="${item.listChildComments}">  
															
															<div class="card mb-3">
																<div class="card-body">
																	<div class="d-flex flex-start">
																		<img class="rounded-circle shadow-1-strong me-3"
																			src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(21).webp"
																			alt="avatar" width="40" height="40" />				
																		<div class="w-100" >
																			<div class="d-flex justify-content-between align-items-center mb-3">
																				<h6 class="text-primary fw-bold mb-0"  data-cotent="${childComment.id}">
																					<span style="color: black;" >${childComment.fullNameComment } </span>
																					
																						<c:if test="${childComment.userNameParentComment != childComment.fullNameComment}">
																							<span style="color: blue;" > ${childComment.userNameParentComment}</span>
																						</c:if>
																							
																					<span class="content-comment text-dark " id="my-content-${childComment.id}"  style="font-weight: 400;">
																						${childComment.content }
																					</span>
																				</h6>
																				<!-- <p class="mb-0">3 days ago</p> -->
																			</div>
																			<div class="d-flex justify-content-between align-items-center">		
																			<%-- <security:authentication var="auth" property="principal.id"/>
																			<c:set var="currentUserId" value="${auth}" /> --%>
																			
																				 
																					<p class="small mb-0" style="color: #aaa;" data-childcomment-id="${childComment.id}">
																						
																							<c:if test="${childComment.userAuth != null}">
																								<a href="#!" class="link-grey reply-link reply-link-${childComment.id}">Reply</a> 
																							</c:if>
																							<c:if test="${ childComment.user_Id == childComment.userAuth}"> • 
																								<a  href="#!" class="link-grey edit-link ">Edit</a> •
																								<a href="#!" class="link-grey remove-link remove-link-${childComment.id}" onclick="warningBeforeDelete(${childComment.id})">Remove</a> 
																							</c:if>	
																					</p>
																				 
																				
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<c:set var="previousId" value="${childComment.id}" />
														<c:set var="userName" value="${childComment.fullNameComment}" />
													</c:forEach>
															
														</div>
													</div>
												</div>
											</div>
											
											
										
										</c:if>
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
	  const editLinks = document.querySelectorAll('.edit-link');
	  let openedEditDiv = null;
	  editLinks.forEach((editLink) => {
		  editLink.addEventListener('click', (event) => {
	      event.preventDefault();
	      editLink.style.display = 'none';
		  const parentCommentId = event.target.parentNode.getAttribute('data-comment-id');
		  const childCommentId = event.target.parentNode.getAttribute('data-childcomment-id');

		  var content = null;
		  var commentId = null;
		 
			if(parentCommentId != null){
				 commentId = parentCommentId;
				 content = document.getElementById('my-content-'+parentCommentId);
				
			}else{
				 commentId = childCommentId;
				 content = document.getElementById('my-content-'+childCommentId);
			
			}
			var initialContent = content.innerText;
	    	content.contentEditable = true;
			const range = document.createRange();
			const sel = window.getSelection();
			range.setStart(content.childNodes[0], content.textContent.length);
			range.collapse(true);
			sel.removeAllRanges();
			sel.addRange(range);
			content.focus();
			
	    	
	    	
	    	//replace button and add event
	    	var replyButtons = document.querySelector('.reply-link-'+commentId);
	    	var ahrefSave = document.createElement('a');
	    	ahrefSave.textContent = 'Save';
	    	ahrefSave.style.color = 'green';
	    	ahrefSave.href = "#";
	    	replyButtons.replaceWith(ahrefSave);
	    	ahrefSave.addEventListener('click', function(even) {
	    		event.preventDefault();
	    		var editContent = document.getElementById('my-content-'+commentId);
	    		var data = {};
	    		data["content"] = editContent.innerText;
	    		data["id"]= commentId;
	    		editComment(data);	
	    		content.contentEditable = false; 
		   		ahrefCancel.replaceWith(removeButtons);
		   		ahrefSave.replaceWith(replyButtons);
		   	 	editLink.style.display = 'inline';
	    	});
	    	
	    	
	    	var removeButtons = document.querySelector('.remove-link-'+commentId);
	    	var ahrefCancel = document.createElement('a');
	    	ahrefCancel.textContent = 'Cancel';
	    	ahrefCancel.href  ="#";
	    	ahrefCancel.style.color = 'red';
	    	removeButtons.replaceWith(ahrefCancel);
	    	
	    	ahrefCancel.addEventListener('click', function(event) {
	    		event.preventDefault();
				content.contentEditable = false;
		   		content.textContent = initialContent;	 
		   		ahrefCancel.replaceWith(removeButtons);
		   		ahrefSave.replaceWith(replyButtons);
		   	 	editLink.style.display = 'inline';
	    	});
			      
 
	      
	    });
	  });
	  
	
	function editComment(data) {
		event.preventDefault();
		$.ajax({
			url : '${commentAPI}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				 var newURL = "${commentURL}?id=" + result.news_Id + "&message=Edit_success";
		            window.history.pushState(null, null, newURL);
		            alert("Edit success!");
			},
			error : function(error) {
				window.location.href = "${commentURL}?message=error_system";
			}
		});
	}
	</script>
	
	
	<script>
	  const replyLinks = document.querySelectorAll('.reply-link');
	  let openedReplyDiv = null;
	  replyLinks.forEach((replyLink) => {
	    replyLink.addEventListener('click', (event) => {
	      event.preventDefault();
		  const parentCommentId = event.target.parentNode.getAttribute('data-comment-id');
		  const childCommentId = event.target.parentNode.getAttribute('data-childcomment-id');
	      if (openedReplyDiv) {
	          event.target.parentNode.removeChild(openedReplyDiv);
	          openedReplyDiv = null;
	      }else{
				const replyDiv = document.createElement('div');
				replyDiv.classList.add('reply-div');

				const textarea = document.createElement('textarea');
				textarea.classList.add('reply-textarea');
				textarea.style.width = "220%";
				textarea.style.height = "70px";
				textarea.style.padding = "10px";
				textarea.style.border = "1px solid #ccc";
				textarea.style.fontSize = "16px";
				replyDiv.appendChild(textarea);

				const button = document.createElement("button");
				button.classList.add("send-button");
				button.textContent = "Gửi";
				button.style.position = "absolute";
				button.style.top = "130px";
				button.style.right = "60px";
				button.style.background = "red";
				replyDiv.appendChild(button);
		      
				button.addEventListener("click", function(event) {
					event.preventDefault();
					var comment = textarea.value;
					var emptyParentCommentId = $('#emptyParentCommentId').val();
					var data = {};
					data["content"] = comment;
					data["news_Id"]= $('#newsId').val();
					if(parentCommentId != null){
						data["parentComment"] = parentCommentId;
					}else{
						data["parentComment"]= childCommentId;
					}
					
					addComment(data);
					event.target.parentNode.removeChild(replyDiv);
				});
				

				event.target.parentNode.appendChild(replyDiv);
				openedReplyDiv = replyDiv;
	      }
	      
	    });
	  });
	  
	$('#btnAddComment').click(function(e) {
		e.preventDefault(); // nhận biết đc ta sẽ submit vào url nào, bắt buộc có
		var data = {};
		data["content"] = $('#content').val();
		data["news_Id"]= $('#newsId').val();
		addComment(data);
	});
	
	function addComment(data) {
		event.preventDefault();
		$.ajax({
			url : '${commentAPI}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${commentURL}?id="+data.news_Id+"&message=insert_success";
				/* var newURL = "${commentURL}?id="+data.news_Id+"&message=insert_success";
	            window.history.pushState(null, null, newURL);
	            alert("Add success!"); */
			},
			error : function(error) {
				window.location.href = "${commentURL}?message=error_system";
			}
		});
	}
	</script>

	

	<script >
		function warningBeforeDelete(id) {
			swal({
			  title: "Xác nhận xóa",
			  text: "Bạn có chắc chắn muốn xóa hay không",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-success",
			  cancelButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			}).then(function(isConfirm) {
			  //isConfirm.preventDefault();
			  if (isConfirm.value) {
				  	var ids = [];
					ids.push(id);
					deleteComment(ids,id);
			  }else if(isConfirm.dismiss == 'cancel'){
                  console.log('cancel');
              }
			});
	  	} 
		function deleteComment(data,id) {
			var newsId= $('#newsId').val();
		    $.ajax({
		        url: '${commentAPI}',
		        type: 'DELETE',
		        contentType: 'application/json',
		        data: JSON.stringify(data),
		        success: function (result) {
		            window.location.href = "${commentURL}?id="+newsId+"&message=delete_success";
		        },
		        error: function (error) {
		        	window.location.href ="${commentURL}?id="+newsId+"&message=delete_fail";
		        }
		    });
		}
	</script>
	
	
</body>
</html>