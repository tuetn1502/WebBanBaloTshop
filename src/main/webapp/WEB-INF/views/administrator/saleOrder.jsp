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
<title>Quản Lý Hoá Đơn</title>
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

			<sf:form id="category-spring-form" name="category-form" action="${base }/admin/saleOrder/list" method="GET" modelAttribute="categoryList">
		<!-- dữ liệu để search -->
<!-- 				<div class="d-flex flex-row justify-content-between mt-4"> -->
									
<!-- 					<div> -->
<%-- 						<a class="btn btn-outline-primary mb-1" href="${base }/admin/category/addOrUpdate" role="button">Add New</a> --%>
<!-- 					</div> -->
<!-- 				</div> -->
						
				<div class="table_list">
					<table class="table table-bordered ">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Mã ĐH</th>
								<th scope="col">Tên KH</th>
								<th scope="col">SĐT</th>
								<th scope="col">Email</th>
								<th scope="col">Ngày đặt hàng</th>
								<th scope="col">Tổng tiền</th>
							</tr>
						</thead>
						
						<tbody id="tbody">
							<c:forEach items="${saleOrderList }" var="o">
								<tr>
									<td scope="row">${o.id }</td>
									<td>${o.code }</td>
									<td>${o.customerName }</td>
									<td>${o.customerPhone }</td>
									<td>${o.customerEmail }</td>
									<td>${o.createdDate }</td>
									<td>${o.total }</td>
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
			currentPage: ${productWithPaging.currentPage},
	        items: ${productWithPaging.totalItems},
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
