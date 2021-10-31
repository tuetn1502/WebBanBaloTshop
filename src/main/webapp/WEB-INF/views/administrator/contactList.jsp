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
<title>Quản Lý Liên Hệ</title>
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

			<sf:form id="category-spring-form" name="category-form" action="${base }/admin/contact/list" method="GET" modelAttribute="contactList">
		<!-- dữ liệu để search -->
				<div class="d-flex flex-row justify-content-between mt-4">
					
					<div class="d-flex flex-row">
<!-- 						dữ liệu để thực hiện tìm kiếm sản phẩm -->
<!-- 						<input type="hidden" id="page" name="page"> -->
<%-- 						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }"> --%>
<!-- 						<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button> -->
					</div>
<%-- 					<c:if test="${userLogined.owner }"> --%>
						
<%-- 					</c:if> --%>
					<div>
						<a class="btn btn-outline-primary mb-1" href="${base }/admin/account/addOrUpdate" role="button">Add New</a>
					</div>
				</div>
						
				<div class="table_list">
					<table class="table table-bordered ">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Tên ĐN</th>
<!-- 								<th scope="col">Mật khẩu</th> -->
								<th scope="col">Họ tên</th>
								<th scope="col">Email</th>
								<th scope="col">SĐT</th>
								<th scope="col">Trạng thái</th>
								<th scope="col"></th>
							</tr>
						</thead>
						
						<tbody id="tbody">
							<c:forEach items="${userList }" var="o">
								<tr>
									<td scope="row">${o.id }</td>
									<td>${o.username }</td>
<%-- 									<td>${o.password }</td> --%>
									<td>${o.fullname }</td>
									<td>${o.email }</td>
									<td>${o.phone }</td>
									<c:if test="${o.status == true }">
										<td><input  class=" btn btn-success" value="Active"/></td>
									</c:if>
									<c:if test="${o.status == false}"><td><input  class=" btn btn-danger" value="Disactive"/></td></c:if>
									
									<td>
										<a class="btn btn-primary"   onclick="deleteAccount(this,${o.id},'${seo }');" role="button" >Xoá</a>
									</td>
<%-- 									<c:if test="${isAdmin }"> --%>
<%-- 										<c:if test="${userLogined.owner}"> --%>
<!-- 											<td> -->
												
<!-- 											</td> -->
<%-- 										</c:if> --%>
										
<%-- 									</c:if> --%>
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
