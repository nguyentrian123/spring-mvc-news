<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="userAPI" value="/api/useradmin" />
<c:url var="userURL" value="/quan-tri/tai-khoan/danh-sach" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách tài khoản</title>
</head>

<body>
	<div class="main-content">
		<form action="<c:url value='/quan-tri/tai-khoan/danh-sach'/>" id="formSubmit" method="get">
			
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Trang chủ</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<c:if test="${not empty message}">
									<div class="alert alert-${alert}">
			  							${message}
									</div>
								</c:if>
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											
											<div class="dt-buttons btn-overlap btn-group">
											
												<span >
													<input type="text" id="fullname" value ="${saveSearch }" name="fullname" placeholder="tìm kiếm tài khoản" style="height: 30px; margin-right:10px;margin-top:5px" />
													
													<button style="margin-right:10px;margin-top:5px">Tìm kiếm</button>
												</<span>
												
												<c:url var="createUserURL" value="/quan-tri/tai-khoan/chinh-sua"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm tài khoản' href='${createUserURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()" 
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" 
														disabled data-toggle="tooltip" title='Xóa tài khoản'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
												
												
												
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered" id="userList">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"></th>
														<th>Tên đăng nhập</th>
														<th>Tên tài khoản</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"
																onchange="toggleDeleteButton()"></td>
															
												
															<td>${item.userName}</td>
															<td>${item.fullName}</td>
														
			
															<td>
																<c:url var="updateUserURL" value="/quan-tri/tai-khoan/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateUserURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
																		
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		<input type="hidden" value="<%=request.getParameter("fullname") %>" id="searchString" name="searchString"/>
		</div>
	<script>
	
		function warningBeforeDelete() {
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
			  if (isConfirm.value) {
					var ids = $('#userList').find('tbody input[type=checkbox]:checked').map(function () {
			            return $(this).val();
			        }).get();
					deleteUser(ids);
			  }
			  else if(isConfirm.dismiss == 'cancel'){
	            console.log('cancel');
	          }
			});
	  	} 
		
		function deleteUser(data) {
		    $.ajax({
		        url: '${userAPI}',
		        type: 'DELETE',
		        contentType: 'application/json',
		        data: JSON.stringify(data),
		        success: function (result) {
		            window.location.href = "${userURL}?message=delete success";
		              	alert("Delete success!");
		        },
		        error: function (error) {
		        	window.location.href = "${userURL}?message=error_system";
		        }
		    });
		}
		
		function toggleDeleteButton() {
		    if ($('#userList').find('tbody input[type=checkbox]:checked').length > 0) {
		        btnDelete.disabled = false; // Bỏ disable button
		    } else {
		        btnDelete.disabled = true; // Disable button
		    }
		
		}
	
	
	</script>	
</body>
</html>