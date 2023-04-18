<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="newAPI" value="/api/new" />
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Forms</a></li>
					<li class="active">Form Elements</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>


						<form class="form-horizontal" id="formSubmit" name="formSubmit"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="categoryCode"
									class="col-sm-3 control-label no-padding-right">Thể
									loại:</label>
								<div class="col-sm-9">
									<select class="form-control" id="categoryCode"
										name="categoryCode">
										<c:if test="${empty model.categoryCode}">
											<option value="">Chọn loại bài viết</option>
											<c:forEach items="${categories}" var="item">
												<option value="${item.key}">${item.value}</option>
											</c:forEach>
										</c:if>

										<c:if test="${not empty model.categoryCode}">
											<option value="">Chọn loại bài viết</option>
											<c:forEach items="${categories}" var="item">
												<option value="${item.key}"
													<c:if test="${item.key == model.categoryCode}"> selected="selected"</c:if>>
													${item.value}</option>
											</c:forEach>

										</c:if>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Tên bài viết</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="title" name="title"
										value="${model.title}" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Ảnh đại diện</label>
								
									<div class="col-sm-9">

										<input type="file" class="col-xs-10 col-sm-5" name="file"
											id="file" multiple />
										<c:if test="${not empty model.id}">
											<c:url var="imgUrl" value="/uploads/${model.thumbnail.get(0)}" />
											<img src="${imgUrl}" width="150" height="150" />
										</c:if>
									</div>
								
							

							</div>

							<div class="form-group">
								<label for="shortDescription"
									class="col-sm-3 control-label no-padding-right">Mô tả
									ngắn:</label>
								<div class="col-sm-9">
									<textarea rows="5" cols="10" id="shortDescription"
										name="shortDescription" style="width: 820px; height: 175px">${model.shortDescription}</textarea>
								</div>
							</div>

							<div class="form-group">
								<label for="content"
									class="col-sm-3 control-label no-padding-right">Nội
									dung:</label>
								<div class="col-sm-9">
									<textarea rows="" cols="" id="content" name="content"
										style="width: 820px; height: 175px">${model.content}</textarea>
								</div>
							</div>

							<input type="hidden" value="${model.id}" id="newId" name="newId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<input type="hidden" name="action" value="edit">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật bài
											viết
										</button>
										
									</c:if>
									<c:if test="${empty model.id}">
										<input type="hidden" name="action" value="add">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm bài viết
										</button>
										
									</c:if>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		var editor = '';
		$(document).ready(function() {
			editor = CKEDITOR.replace('content');
		});

		$('#formSubmit')
				.submit(
						function(event) {
							event.preventDefault(); // Ngăn chặn form submit mặc định		
							var formData = new FormData(this);
							formData.set('content', editor.getData());
							var action = $(this).find('input[name="action"]')
									.val();
							if (action == 'add') {
								$
										.ajax({
											url : '${newAPI}',
											method : 'POST',
											data : formData,
											contentType : false,
											processData : false,
											success : function(result) {
												window.location.href = "${editNewURL}?id="
														+ result.id
														+ "&message=insert_success";
														alert("Insert success!");
											},
											error : function(error) {
												var errorData = JSON.parse(error.responseText);
												if(errorData != "" ){
													window.location.href = "${editNewURL}?message="+errorData.detail;
												}
												else{
													window.location.href = "${editNewURL}?message=error_system";
												}
		
											}
										});
							} else if (action == 'edit') {
								var id = $('#newId').val();
								formData.set('id', id);

								$.ajax({
											url : '${newAPI}/edit',
											method : 'POST',
											data : formData,
											contentType : false,
											processData : false,
											success : function(result) {
												window.location.href = "${editNewURL}?id="
														+ result.id
														+ "&message=update_success";
												alert("Update success!");
											},
											error : function(error) {
												var errorData = JSON.parse(error.responseText);
												var id = $('#newId').val();
												if(errorData != "" ){
													window.location.href = "${editNewURL}?id="+id+"&message="+errorData.detail;
												}
												else{
													window.location.href = "${editNewURL}?message=error_system";
												}
											
											}
										});
							}
						});

	</script>

</body>
</html>
