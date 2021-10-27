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
<title>Quản trị danh mục</title>
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
			<p style="margin: 5px 0; font-weight: 500; font-size: 35px;">Thêm / Cập nhật thông tin danh mục</p>

			<sf:form id="category-spring-form" name="category-form" action="${base }/admin/category/addOrUpdate" method="POST" modelAttribute="category" enctype="multipart/form-data">
				<!-- Xác định là thêm mới hay chỉnh sửa -->
				<sf:hidden path="id"/>
				
				<div class="row mt-3">
					<div class="col-md-12">
						<div class="form-group">
							<label for="category">Chọn danh mục cha</label>
							<sf:select path="parentId.id" class="form-control" id="category">
								<sf:option value="" label="Danh mục cha mới" />
								<sf:options items="${categoryParent.getData() }" itemValue="id" itemLabel="name" selected="" />
							</sf:select>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="name">Tên danh mục</label>
							<sf:input type="text" id="name" name="name" path="name" class="form-control"></sf:input>
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="form-group">
							<label for="description">Mô tả danh mục</label>
							<sf:textarea type="text" id="description" name="description" path="description" class="form-control"></sf:textarea>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="status">Trạng thái</label><br>
							<div class="form-check form-check-inline">
							  <sf:radiobutton name="status" id="status" path="status" value="1" /> 
							  <label class="form-check-label" for="status">Đang bán</label>
							</div>
							<div class="form-check form-check-inline">
							  <sf:radiobutton name="status" id="status" path="status" value="0" /> 
							  <label class="form-check-label" for="status">Ngừng bán</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<button class="btn btn-primary" id="btn-save" type="submit"
							onclick="document.getElementById('category-spring-form').submit();">Lưu</button>
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
