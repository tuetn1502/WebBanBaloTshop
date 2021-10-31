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

			<form  name="saleOrder-form" action="${base }/admin/saleOrder/list" method="GET">
		<!-- dữ liệu để search -->
				<div class="d-flex flex-row justify-content-between mt-4">
					
					<div class="d-flex flex-row">
<!-- 						dữ liệu để thực hiện tìm kiếm sản phẩm -->
						<input type="hidden" id="page" name="page">
						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }">
						<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button>
					</div>
					
<!-- 					<div> -->
<%-- 						<a class="btn btn-outline-primary mb-1" href="${base }/admin/category/addOrUpdate" role="button">Add New</a> --%>
<!-- 					</div> -->
				</div>
						
				<div class="table_list">
					<table class="table table-bordered ">
						<thead class="bg-secondary">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Mã hoá đơn</th>
								<th scope="col">Tên KH</th>
								<th scope="col">SĐT</th>
								<th scope="col">Email</th>
								<th scope="col">Ngày đặt hàng</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col"></th>
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
									<td>
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${o.total }" type="currency" />
									</td>
									<c:if test="${ isAdmin}">
										<td>
											
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal-${o.id }">Chi tiết </button>
											
											<!-- Modal -->
											<div class="modal fade" id="exampleModal-${o.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog modal-lg" role="document">
											    <div class="modal-content" style="width:800px;">
											      <div class="modal-header d-block">
											      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											        <h5 class="modal-title" id="exampleModalLabel">Hoá đơn ${o.code }</h5>
											        <div class="inFoCustom">${o.customerName } - ${o.customerPhone } - ${o.customerEmail } - ${o.customerAddress }</div>
											        
											      </div>
											      <div class="modal-body">
											        <div class="inFoOrder">
											        	<table class="table">
														  <thead>
														    <tr>
														      <th scope="col">Sản phẩm</th>
														      <th scope="col">Số lượng</th>
														      <th scope="col">Thành tiền</th>
														    </tr>
														  </thead>
														  <tbody>
														  	<c:forEach items="${saleOrderProducts }" var="sop">
														  		<c:if test="${sop.saleOrder.id== o.id }">
														  			<c:forEach items="${pList }" var="p">
														  				<c:if test="${sop.product.id == p.id}">
														  					<tr>
																  			 <th scope="row">${p.title }</th>
																		      <td>${sop.quality }</td>
																		      <td>
																		      	<fmt:setLocale value="vi_VN" scope="session" />
																				<fmt:formatNumber value="${sop.quality*p.price }" type="currency" />
																		      </td>
																		     <tr>
														  				</c:if>
														  			</c:forEach>
														  			
														  		</c:if>
														  	</c:forEach>
														    <tr>
														    	<th scope="row">Phí vận chuyển:</th>
														    	<td></td>
														    	<td>
														    		<fmt:setLocale value="vi_VN" scope="session" />
																	<fmt:formatNumber value="${shipFee }" type="currency" />
														    	</td>
														    </tr>
														    <tr>
														    	<th scope="row">Tổng: </th>
														    	<td></td>
														    	<td>
														    		<fmt:setLocale value="vi_VN" scope="session" />
																	<fmt:formatNumber value="${o.total }" type="currency" />
														    	</td>
														    </tr>
														    
														      
														  </tbody>
														</table>
											        </div>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<!-- 											        <button type="button" class="btn btn-primary">Save changes</button> -->
											      </div>
											    </div>
											  </div>
											</div>
   										    <a class="btn btn-secondary"   onclick="deleteProduct(this,${o.id});" role="button" >Xoá</a>
										</td>
									</c:if>
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
			<form>
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
			currentPage: ${saleOrderList.currentPage},
	        items: ${saleOrderList.totalItems},
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
