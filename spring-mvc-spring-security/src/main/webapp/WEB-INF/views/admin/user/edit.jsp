<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:url var="userURL" value="/quan-tri/tai-khoan/danh-sach" />
<c:url var="userAPI" value="/api/useradmin" />
<c:url var="editUserURL" value="/quan-tri/tai-khoan/chinh-sua" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm / chỉnh sửa tài khoản</title>
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
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Tên đăng nhập</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="userName" name="userName"
										style="width: 500px" value="${model.userName}" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="roleid"
									class="col-sm-3 control-label no-padding-right">Quyền truy cập</label>
								<div class="col-sm-9">
									<select class="form-control" id="roleid"
										name="roleid" style="width: 500px">
										<c:if test="${empty model.roleid}">
											<option value="">Chọn quyền truy cập</option>
											<c:forEach items="${roles}" var="item">
												<option value="${item.id}">${item.name}</option>
											</c:forEach>
										</c:if>

										<c:if test="${not empty model.roleid}">
											<option value="">Chọn quyền truy cập</option>
											<c:forEach items="${roles}" var="item">
												<option value="${item.id}"
													<c:if test="${item.id == model.roleid}"> selected="selected"</c:if>>
													${item.name}</option>
											</c:forEach>

										</c:if>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Tên tài khoản</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="fullName" name="fullName"
										style="width: 500px"	value="${model.fullName}" />
								</div>
							</div>
							
							<c:if test="${empty model.id}">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">Mật khẩu</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" id="password" name="password"
											style="width: 500px" value="${model.password}" />
									</div>
								</div>
							</c:if>

							<input type="hidden" value="${model.id}" id="userId" name="userId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<input type="hidden" name="action" value="edit">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật tài khoản
										</button>
										
									</c:if>
									<c:if test="${empty model.id}">
										<input type="hidden" name="action" value="add">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm tài khoản
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
							var action = $(this).find('input[name="action"]')
									.val();
							if (action == 'add') {
								$
										.ajax({
											url : '${userAPI}',
											method : 'POST',
											data : formData,
											contentType : false,
											processData : false,
											success : function(result) {
												window.location.href = "${editUserURL}?id="
														+ result.id
														+ "&message=insert_success";
														alert("Insert success!");
											},
											error : function(error) {
												var errorData = JSON.parse(error.responseText);
												if(errorData != "" ){
													window.location.href = "${editUserURL}?message="+errorData.detail;
												}
												else{
													window.location.href = "${editUserURL}?message=error_system";
												}
												
											}
										});
							} else if (action == 'edit') {
								var id = $('#userId').val();
								formData.set('id', id);

								$.ajax({
											url : '${userAPI}',
											method : 'POST',
											data : formData,
											contentType : false,
											processData : false,
											success : function(result) {
												window.location.href = "${editUserURL}?id="
														+ result.id
														+ "&message=update_success";
												alert("Update success!");
											},
											error : function(error) {
												var errorData = JSON.parse(error.responseText);
												var id = $('#userId').val();
												if(errorData != "" ){
													window.location.href = "${editUserURL}?id="+id+"&message="+errorData.detail;
												}
												else{
													window.location.href = "${editUserURL}?message=error_system";
												}
												
											}
										});
							}
						});

	</script>

</body>
</html>
