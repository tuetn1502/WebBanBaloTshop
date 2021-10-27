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
<title>Quản trị sản phẩm</title>
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
			<p style="margin: 5px 0; font-weight: 500; font-size: 35px;">Thêm / Cập nhật thông tin sản phẩm</p>

			<sf:form id="product-spring-form" name="product-form" action="${base }/admin/product/addOrUpdate" method="POST" modelAttribute="product" enctype="multipart/form-data">
				<!-- Xác định là thêm mới hay chỉnh sửa -->
				<sf:hidden path="id"/>
				
				<div class="row mt-3">
					<div class="col">
						<div class="form-group">
							<label for="name">Tên sản phẩm</label>
							<sf:input type="text" id="title" name="title" path="title" class="form-control"></sf:input>
						</div>
					</div>
					
					<div class="col">
						<div class="form-group">
							<label for="price">Giá</label>
							<sf:input type="text" id="price" name="price" path="price" class="form-control"></sf:input>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 mt-3">
						<div class="form-group">
							<label for="information">Danh mục</label>
							<sf:select path="categories.id" class="form-control" id="category">
								<sf:options items="${categoryChild.getData() }" itemValue="id" itemLabel="name" />
							</sf:select>
						</div>
					</div>
					<div class="col-12 mt-3">
						<div class="form-group">
							<label for="information">Mô tả sản phẩm</label>
							<sf:textarea type="text" id="short_description" name="shortDescription" path="shortDescription" class="form-control"></sf:textarea>
						</div>
					</div>
					<div class="col-12 mt-3">
						<div class="form-group">
							<label for="information">Chi tiết sản phẩm</label>
							<sf:textarea type="text" id="detail_description" name="detailDescription" path="detailDescription" class="form-control"></sf:textarea>
						</div>
					</div>
					<div class="col-12 mt-3">
						<div class="form-group">
							<label for="sale">Khuyến mại</label>
							<sf:textarea type="text" id="price_sale" name="priceSale" path="priceSale" class="form-control"></sf:textarea>
						</div>
					</div>
					<div class="row m-0 w-100">
						<div class="col-md-6 mt-3">
							<div class="form-group">
								<label for="fileProductAvatar">Avatar</label> 
								<input id="fileProductAvatar" name="productAvatar" type="file" class="form-control-file">
							</div>
						</div>
						<div class="col-md-6 mt-3">
							<div class="form-group">
									<label for="fileProductPictures">Picture(Multiple)</label> 
									<input id="fileProductPictures" name="productPictures" type="file" class="form-control-file" multiple="multiple">
								</div>
						</div>
					</div>
					<div class="row m-0 w-100">
						<div class="col-md-6">
						<div class="form-group">
							<label for="status">Trạng thái</label><br>
							<div class="form-check form-check-inline">
							  <sf:radiobutton name="status" id="status" path="status" value="1" /> 
							  <label class="form-check-label" for="status">Còn hàng</label>
							</div>
							<div class="form-check form-check-inline">
							  <sf:radiobutton name="status" id="status" path="status" value="0" /> 
							  <label class="form-check-label" for="status">Hết hàng</label>
							</div>
						</div>
					</div>
						<div class="col-md-6 mt-3">
							<div class="form-group">
								<label for="isHot">Sản phẩm Hot</label> 
								<div class="form-check">
								  <sf:checkbox id="isHot" name="isHot" path="isHot" value="1" />
								  <label class="form-check-label" for="isHot">Chọn</label>
								</div>
							</div>
							
						</div>
					</div>
					
					
					
				</div>		
				<div class="row">
					<div class="col-12">
						<button class="btn btn-primary" id="btn-save" type="submit"
							onclick="document.getElementById('product-spring-form').submit();">Lưu</button>
						<a href="${base }/product" class="btn btn-default" type="button">Huỷ</a>
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
