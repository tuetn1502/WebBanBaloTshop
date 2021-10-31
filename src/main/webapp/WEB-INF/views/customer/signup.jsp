<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng Ký</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<!-- 	header -->
<%-- 	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include> --%>
	<!-- 	header -->
	<!-- main -->
	<section class="vh-100 gradient-custom">
	  <div class="container py-5 h-100">
	    <div class="row justify-content-center align-items-center h-100">
	      <div class="col-12 col-lg-9 col-xl-7">
	        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
	          <div class="card-body p-4 p-md-5">
	            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Đăng ký tài khoản</h3>
	            
	            <div class=" alert-warning" role="alert">
				  <h5>${alert}</h5>
				</div>
	            <form  action="${base }/signup" method="POST">
	
	              <div class="row">
	                <div class="col-md-6 mb-4">
	
	                  <div class="form-outline">
	                    <input type="text" id="fullname" name="fullname" class="form-control form-control-lg" required>
	                    <label class="form-label" for="fullname">Họ và tên</label>
	                  </div>
	
	                </div>
	                <div class="col-md-6 mb-4 d-flex align-items-center">
						<div class="form-outline date w-100" id="datepicker"  data-date-format="yyyy-mm-dd">
							<input type="date" class="form-control add-on"  placeholder="Ngày sinh (yyyy-MM-dd)*" name="birthday"  id="birthday" autocomplete="off" required>
							<label for="birthday" class="form-label">Ngày sinh</label>
						</div>
	                </div>
	                
	              </div>
	
	              <div class="row">
	                <div class="col-md-6 mb-4">
	
	                  <div class="form-outline">
	                    <input type="text" id="address" name="address" class="form-control form-control-lg" required>
	                    <label class="form-label" for="address">Địa chỉ</label>
	                  </div>
	
	                </div>
	                <div class="col-md-6 mb-4">
	
	                  <h6 class="mb-2 pb-1">Giới tính: </h6>
	
	                  <div class="form-check form-check-inline">
	                    <input class="form-check-input" type="radio" name="gender" path="gender" id="maleGender" value="Nam" checked/>
	                    <label class="form-check-label" for="maleGender">Nam</label>
	                  </div>
	
	                  <div class="form-check form-check-inline">
	                    <input class="form-check-input" type="radio" name="gender" path="gender" id="femaleGender" value="Nữ"/>
	                    <label class="form-check-label" for="maleGender">Nữ</label>
	                  </div>
	
	                </div>
	              </div>
	
	              <div class="row">
	                <div class="col-md-6 mb-4 pb-2">
	
	                  <div class="form-outline">
	                    <input type="email" id="emailAddress" name="email" class="form-control form-control-lg" required/>
	                    <label class="form-label" for="emailAddress">Email</label>
	                  </div>
	
	                </div>
	                <div class="col-md-6 mb-4 pb-2">
	
	                  <div class="form-outline">
	                    <input type="text" id="phone" name="phone" class="form-control form-control-lg" required/>
	                    <label class="form-label" for="phone">Số điện thoại</label>
	                  </div>
	
	                </div>
	              </div>
					<div class="row">
						<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                    <input type="text" id="username" name="username" class="form-control form-control-lg" required/>
		                    <label class="form-label" for="username">Tên đăng nhập</label>
		                  </div>
	
	                	</div>
	                	<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                    <input type="text" id="password" name="password" class="form-control form-control-lg" required/>
		                    <label class="form-label" for="password">Mật khẩu</label>
		                  </div>
		
		                </div>
					</div>
					<div class="row">
	                	<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                    <input type="text" id="rePassword" name="rePassword" class="form-control form-control-lg" required/>
		                    <label class="form-label" for="rePassword">Nhập lại mật khẩu</label>
		                  </div>
		
		                </div>
					</div>
	              <div class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-success btnRegister_right" onclick="">Đăng ký</button>
							<a href="${base }/homepage"><input type="button" class="btn btn-secondary btnRegister_left"  value="Huỷ"></a>
						</div>
					</div>
	
	            <form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	<!-- main -->
	
	<!-- 	footer -->
<%-- 	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include> --%>
	<!-- 	footer -->
</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
<script type="text/javascript">
	$(function () {  
		$("#datepicker").datepicker({         
		autoclose: true,         
		todayHighlight: true 
		}).datepicker('update', new Date());
	});
</script>
</html>