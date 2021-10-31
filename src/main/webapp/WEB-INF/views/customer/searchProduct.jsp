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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tìm Kiếm ${keyword }</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	
	
	
	<div class="container-fluid mt-1 mb-5 category_container">
		<div class="top_main">
			<nav aria-label="breadcrumb">
			  	<ol class="breadcrumb ">
				    <li class="breadcrumb-item"><a href="${base }/homepage">Trang chủ</a></li>
				    <li class="breadcrumb-item active" aria-current="page"><a href="#">Tìm kiếm ${keyword}</a></li>
			  	</ol>
			</nav>
		</div>
	    <div class="row m-0">
	                <c:forEach items="${productWithPaging.data }" var="p">
	                <div class="col-12 col-md-6 col-lg-4 mb-4">
	                    <div class="card border">
	                        <div class="img_product"> <img src="${base }/upload/${p.avatar}" alt="" width="100%"/></div>
		                     <div class="card-body p-0">
	                            <div class="title_product"> <a href="${base }/detail/${p.seo}">${p.title }</a></div>
	                            <div class="price">
									<div class="main_price mr-2">
										<span><fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${p.price }" type="currency" />
										</span>
									</div>
									<div class="price_compare">
										<span><fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${p.priceSale }" type="currency" />
										</span>
										
									</div>
<!-- 									<div class="sale ml-5"> -->
<!-- 										<span>- ?</span> -->
<!-- 									</div> -->
								</div>
								<div class="row p-2 btn_product">
									<div class="col-md-6 p-0 w-75">
										<a href="${base }/detail/${p.seo}" class="btn btn-primary w-75">Xem chi tiết</a>
									</div>
									<div class="col-md-6 p-0">
										<button type="button" class="btn btn-danger  w-75" onclick="addToCart(${p.id}, 1);">Thêm vào giỏ</button>
									</div>
								</div>
	                        </div>
	                    </div>
	                </div>
	                </c:forEach>
	            </div>
	            <!-- Paging -->
	            <div class="row">
					<div class="col-12 d-flex justify-content-center">
						<div id="paging"></div>
					</div>
				</div>
	</div>
	<!--Section: Contact v.2-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
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