<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<c:url var="categoryURL" value="/quan-tri/the-loai" />
<c:url var="categoryAPI" value="/api/category" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
</head>
<body>
	
	<div class="main-content" >
		<form action="<c:url value='#'/>" id="formSubmit" method="get" >
			
				
				
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
						<textbox></textbox>
					</div>
					
					<div class="page-content" >
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
											
										</div>
									</div>
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createCategory" value="/quan-tri/the-loai/chinh-sua"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm danh muc' href='${createCategory}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
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
											<table class="table table-bordered">
												<thead>
													<tr>
														<th></th>
														<th>Mã thể loại</th>
														<th>Tên thể loại</th>
														<th></th>
														
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
															<td>${item.code}</td>
															<td>${item.name}</td>
															<td>
																<c:url var="updateCategory" value="/quan-tri/the-loai/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateCategory}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
		</div>
		
		<script>
		function warningBeforeDelete(){
			swal({
				  title: "Xác nhận xóa",
				  text: "Bạn có chắc chắn xóa không",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-success",
				  cancelButtonClass: "btn-danger",
				  confirmButtonText: "Xác nhận",
				  cancelButtonText: "hủy bỏ",
				
				}).then (function(isConfirm) {
					if (isConfirm) {
						var ids = $('tbody input[type=checkbox]:checked').map(function () {
				            return $(this).val(); // map() dùng để lặp , sau đó trả về .val()
				        }).get();
						deleteNew(ids);
				  }
				
				});
		}
		
		
		function deleteNew(data) {
	        $.ajax({
	            url: '${categoryAPI}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	                window.location.href = "${categoryURL}?message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${categoryURL}?&message=error_system";
	            }
	        });
	    }
		</script>
</body>
</html>