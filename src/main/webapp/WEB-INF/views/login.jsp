<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng nhập</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>

	<!-- main -->
	<section class="h-100 my-login-page">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Đăng nhập</h4>
							<form method="POST" class="my-login-validation" action="/perform_login" id="form_login">
								<div class="form-group">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
				
									<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
									<c:if test="${not empty param.login_error}">
										<div class="alert alert-danger" role="alert">Tên đăng nhập hoặc mật khẩu chưa chính xác!!!</div>
									</c:if>
								
									<label for="email">Tên đăng nhập</label>
<!-- 									trong MVC bắt buộc để name là username và password -->
									<input id="username" type="text" class="form-control" name="username" value="" required autofocus>
									<div class="invalid-feedback">
<!-- 										Email không hợp lệ -->
									</div>
								</div>

								<div class="form-group">
									<label for="password">Mật khẩu
										<a href="forgot.html" class="float-right">
											Quên mật khẩu?
										</a>
									</label>
									<input id="password" type="password" class="form-control" name="password" required data-eye>
								    <div class="invalid-feedback">
								    	Nhập mật khẩu
							    	</div>
								</div>

<!-- 								<div class="form-group"> -->
<!-- 									<div class="custom-checkbox custom-control"> -->
<!-- 										<input type="checkbox" name="remember" id="remember" class="custom-control-input"> -->
<!-- 										<label for="remember" class="custom-control-label">Ghi nhớ tài khoản</label> -->
<!-- 									</div> -->
<!-- 								</div> -->

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block" >
										Đăng nhập
									</button>
								</div>
								<div class="mt-4 text-center">
									<a href="${base }/signup" type="button" class="btn btn-success btn-block">Đăng ký tài khoản</a>
								</div>
								<p style="font-size: 12px;" class="mt-2">Copyright © 2011-2018. All Rights Reserved by website.Design by TNT</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main -->

</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</html>