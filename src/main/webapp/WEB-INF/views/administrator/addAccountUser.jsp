<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản trị tài khoản</title>
<!-- 	Common -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- 	CSS -->
<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Navbar -->
		<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
		<!-- Main Sidebar Container -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper px-5">
			<p style="margin: 5px 0; font-weight: 500; font-size: 35px;">Thêm tài khoản</p>

			<sf:form id="account-spring-form" name="account-form" action="${base }/admin/account/addOrUpdate" method="POST" modelAttribute="users" enctype="multipart/form-data">
				<!-- Xác định là thêm mới hay chỉnh sửa -->
				<sf:hidden path="id"/>
				
					<div class="row">
	                <div class="col-md-6 mb-4">
	
	                  <div class="form-outline">
	                  	<label class="form-label" for="fullname">Họ và tên</label>
	                    <sf:input type="text" id="fullname" name="fullname" path="fullname" class="form-control" required=""></sf:input>
	                    
	                  </div>
	
	                </div>
	                <div class="col-md-6 mb-4 d-flex align-items-center">
						<div class="form-outline date w-100" id="datepicker"  data-date-format="yyyy-mm-dd">
							<label for="birthday" class="form-label">Ngày sinh</label>
							<sf:input type="date" class="form-control add-on"  placeholder="Ngày sinh (yyyy-MM-dd)*" name="birthday" path="birthday"  id="birthday" autocomplete="off" required=""></sf:input>
							<sf:errors path="birthday" cssClass="error"/>
							
						</div>
	                </div>
	                
	              </div>
	
	              <div class="row">
	                <div class="col-md-6 mb-4">
	
	                  <div class="form-outline">
	                  	<label class="form-label" for="address">Địa chỉ</label>
	                    <sf:input type="text" id="address" name="address" path="address" class="form-control " required=""></sf:input>
	                    
	                  </div>
	
	                </div>
	                <div class="col-md-6 mb-4">
	
<!-- 	                  <h6 class="mb-2 pb-1">Giới tính: </h6> -->
					  <label class="form-label mb-2 pb-1" for="gender">Giới tính:</label><br>
	                  <div class="form-check form-check-inline">
	                    <sf:radiobutton class="form-check-input" name="gender" path="gender" id="maleGender" value="Nam" checked=""/>
	                    <label class="form-check-label" for="maleGender">Nam</label>
	                  </div>
	
	                  <div class="form-check form-check-inline">
	                    <sf:radiobutton class="form-check-input" name="gender" path="gender" id="femaleGender" value="Nữ"/>
	                    <label class="form-check-label" for="maleGender">Nữ</label>
	                  </div>
	
	                </div>
	              </div>
	
	              <div class="row">
	                <div class="col-md-6 mb-4 pb-2">
	
	                  <div class="form-outline">
	                  	<label class="form-label" for="emailAddress">Email</label>
	                    <sf:input type="email" id="emailAddress" name="email" path="email" class="form-control " required=""></sf:input>
	                    
	                  </div>
	
	                </div>
	                <div class="col-md-6 mb-4 pb-2">
	
	                  <div class="form-outline">
	                  	<label class="form-label" for="phone">Số điện thoại</label>
	                    <sf:input type="text" id="phone" name="phone" path="phone" class="form-control " required=""></sf:input>
	                    
	                  </div>
	
	                </div>
	              </div>
					<div class="row">
						<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                  	<label class="form-label" for="username">Tên đăng nhập</label>
		                    <sf:input type="text" id="username" name="username" path="username" class="form-control" required=""></sf:input>
		                    
		                  </div>
	
	                	</div>
	                	<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                  <label class="form-label" for="password">Mật khẩu</label>
		                    <sf:input type="text" id="password" name="password" path="password" class="form-control" required=""></sf:input>
		                    
		                  </div>
		
		                </div>
					</div>
					<div class="row">
	                	<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                  	<label class="form-label" for="rePassword">Nhập lại mật khẩu</label>
		                    <input type="text" id="rePassword" name="rePassword" class="form-control" required/>
		                    
		                  </div>
		
		                </div>
	                	<div class="col-md-6 mb-4 pb-2">
	
		                  <div class="form-outline">
		                    
		                    <label class="form-label" for="role">Vai trò</label>
		                    <select name="role" class="form-control">
		                    	<c:forEach items="${roleUserList }" var="o">
		                    		<option value="${o.name }">${o.name }</option>
		                    	</c:forEach>
		                    </select>

		                  </div>
		
		                </div>
					</div>
				<div class="row">
					<div class="col-12">
						<button class="btn btn-primary" id="btn-save" type="submit"
							onclick="document.getElementById('account-spring-form').submit();">Lưu</button>
<%-- 						<a href="${base }/product" class="btn btn-default" type="button">Huỷ</a> --%>
					</div>
				</div>
			</sf:form>
		</div>
		<!-- /.content-wrapper -->

		<!-- 		footer -->
		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- 		footer -->

	</div>
	<!-- ./wrapper -->


</body>
<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</html>
