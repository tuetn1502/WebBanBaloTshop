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
<!-- 			<p style="margin: 5px 0; font-weight: 500; font-size: 35px;">Danh sách điện thoại</p> -->

			<sf:form id="category-spring-form" name="category-form" action="${base }/admin/category/list" method="GET" modelAttribute="categoryList">
		<!-- dữ liệu để search -->
				<div class="d-flex flex-row justify-content-between mt-4">
					
<!-- 					<div class="d-flex flex-row"> -->
<!-- 						dữ liệu để thực hiện tìm kiếm sản phẩm -->
<!-- 						<input type="hidden" id="page" name="page"> -->
<%-- 						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }"> --%>
<!-- 						<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button> -->
<!-- 					</div> -->
					
					<div>
						<a class="btn btn-outline-primary mb-1" href="${base }/admin/category/addOrUpdate" role="button">Add New</a>
					</div>
				</div>
						
				<div class="table_list">
					<table class="table table-bordered ">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Tên danh mục</th>
								<th scope="col">Ngày tạo</th>
								<th scope="col">Trạng thái</th>
								<th scope="col"></th>
							</tr>
						</thead>
						
						<tbody id="tbody">
							<c:forEach items="${categoryWithPaging.data }" var="o">
								<tr>
									<td scope="row">${o.id }</td>
									<td>${o.name }</td>
									<td>${o.createdDate }</td>
									<c:if test="${o.status== true }"><td>Đang bán</td></c:if>
									<c:if test="${o.status== false }"><td>Ngừng bán</td></c:if>
									
									<td class="d-flex"> 		
										<a class="btn btn-outline-primary btn-sm py-2 form-control w-40" href="${base }/admin/category/edit/${o.id}"  ><i class="fas fa-edit"></i></a>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-outline-primary btn-sm py-2 form-control w-40" data-toggle="modal" data-target="#exampleModal-${o.id}">
										  <i class="fas fa-trash-alt"></i>
										</button>
										<!--Modal -->
										<div class="modal fade" id="exampleModal-${o.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-body">
										        Bạn có chắc xoá danh mục này không?  ${o.id}
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>
<%-- 										        <a class="btn btn-primary" href="${base }/admin/category/list"  onclick="deleteCategory(this,${o.id})" role="button" >${o.id} Xoá</a> --%>
										        <a class="btn btn-primary"   onclick="deleteCategories(this,${o.id})" role="button" >Xoá</a>
										      </div>
										    </div>
										  </div>
										</div>	
									</td>
								</tr>
							</c:forEach>
						</tbody>
						
					</table>
					<!-- Paging -->
					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging"></div>
						</div>
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
<script type="text/javascript">
	$( document ).ready(function() {
		$("#paging").pagination({
			currentPage: ${categoryWithPaging.currentPage},
	        items: ${categoryWithPaging.totalItems},
	        itemsOnPage: 5,
	        cssStyle: 'dark-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');						
			}
	    });
	});
</script>
</html>
