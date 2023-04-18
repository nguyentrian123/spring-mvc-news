<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="categoryURL" value="/quan-tri/the-loai" />
<c:url var="categoryAPI" value="/api/category" />
<c:url var="editCategory" value="/quan-tri/the-loai/chinh-sua" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa danh mục</title>
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
						
						
						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="model">
						
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Mã thể loại</label>
								<div class="col-sm-9">
									<form:input path="code" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Tên thể loại</label>
								<div class="col-sm-9">
									<form:input path="name" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<form:hidden path="id" id="categoryId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật thể loại
										</button>
									</c:if>
									<c:if test="${empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm thể loại
										</button>
									</c:if>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$('#btnAddOrUpdateNew').click(function(e) {
		e.preventDefault(); // nhận biết đc ta sẽ submit vào url nào, bắt buộc có
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) { // duyệt tất cả các ptu trong form và lấy giá trị 
			data["" + v.name + ""] = v.value;
		});
		var id = $('#categoryId').val();
		if (id == "") {
			addCategory(data);
		} else {
			updateCategory(data);
		}
	});

	function addCategory(data) {
		$.ajax({
			url : '${categoryAPI}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${editCategory}?id="+result.id+"&message=insert_success";
			},
			error : function(error) {
				var errorData = JSON.parse(error.responseText);
				if(errorData != "" ){
					window.location.href = "${editCategory}?page=1&limit=2&message="+errorData.detail;
				}
				else{
					window.location.href = "${editCategory}?page=1&limit=2&message=error_system";
				}
			
			}
		});
	}

	function updateCategory(data) {
		$.ajax({
			url : '${categoryAPI}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${editCategory}?id="+result.id+"&message=update_success";
			},
			error : function(error) {
				var errorData = JSON.parse(error.responseText);
				var id = $('#categoryId').val();
				if(errorData != "" ){
					window.location.href = "${editCategory}?id="+id+"&message="+errorData.detail;
				}
				else{
					window.location.href = "${editCategory}?page=1&limit=2&message=error_system";
				}
			}
		});
	}
	</script>
</body>
</html>