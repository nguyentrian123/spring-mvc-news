<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="userAPI" value="/api/user" />
<c:url var="Login" value="/dang-nhap" />
<c:url var="Signup" value="/dang-ky" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng Ký</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div">
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">${message}</div>
				</c:if>

				<form class="form-horizontal"  id="formSubmit"
					 enctype="multipart/form-data">

					<div class="form-group">
						<input type="text" class="form-control" id="userName"
							name="userName" placeholder="Tên đăng nhập" />
					</div>

					<div class="form-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Mật khẩu" />
					</div>

					<div class="form-group">
						<input type="text" class="form-control" id="fullName"
							name="fullName" placeholder="Họ và tên" />
					</div>



					<button type="button" class="btn btn-primary" id="btnCreateUser">Đăng
						Ký</button>
					
						<c:url var="signIn" value="/dang-nhap">
																							
												</c:url>
									
												<a href="${signIn}"  class="user-signup-link">
													I want to SignIn
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
				</form>
			</div>
		</div>
	</div>

	<script>
		$('#btnCreateUser').click(function(e) {
			e.preventDefault(); // nhận biết đc ta sẽ submit vào url nào, bắt buộc có
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) { // duyệt tất cả các ptu trong form và lấy giá trị 
				data["" + v.name + ""] = v.value;
			});
			addUser(data);

		});

		function addUser(data) {
			$.ajax({
				url : '${userAPI}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${Login}?message=insert_success";
				},
				error : function(error) {
					var errorData = JSON.parse(error.responseText);
					if(errorData != "" ){
						window.location.href = "${Signup}?message="+errorData.detail;
					}
					else{
						window.location.href = "${Signup}?message=error_system";
					}
				}
			});
		}
	</script>
</body>
</html>