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
<meta name="viewport" content="width=device-width intial-scale=1.0">
<title>Homepage Tshop</title>
<!-- 	Common -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- 	CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/views/customer/layout/slidebar.jsp"></jsp:include>
	<!-- start main -->
	<main>
		<h3 class="main_title mt-5">Sản phẩm nổi bật</h3>
		<c:forEach items="${categoryParent.data }" var="c">
			<div class="featured_products">
				<div class="title_category"><p>${c.name }</p></div>
				<div class="owl-carousel owl-theme owl-loaded" id="${c.id }">
				    <div class="owl-stage-outer">
				        <div class="owl-stage">
				        	
			            	<c:forEach items="${productWithPaging.data }" var="o">
			            		
			            		<c:if test="${c.id == o.categories.parentId.id }">
				            		<div class="owl-item box-shadow">
										<div class="img_product"> <img src="${base }/upload/${o.avatar}" alt="" width="100%"/></div>
										<div class="title_product"> <a href="${base }/detail/${o.seo}">${o.title }</a></div>
										<div class="price">
											<div class="main_price mr-2">
												<span><fmt:setLocale value="vi_VN" scope="session" />
													<fmt:formatNumber value="${o.price }" type="currency" />
												</span>
											</div>
											<div class="price_compare">
												<span><fmt:setLocale value="vi_VN" scope="session" />
													<fmt:formatNumber value="${o.priceSale }" type="currency" />
												</span>
												
											</div>
<!-- 											<div class="sale ml-5"> -->
<!-- 												<span>- ?</span> -->
<!-- 											</div> -->
										</div>
										<div class="row p-2 btn_product">
											<div class="col-md-6 p-0">
												<a href="${base }/detail/${o.seo}" class="btn btn-primary ">Xem chi tiết</a>
											</div>
											<div class="col-md-6 p-0">
												<button type="button" class="btn btn-danger  " onclick="addToCart(${o.id}, 1);">Thêm vào giỏ</button>
											</div>
										</div>
									</div>	
									
								</c:if>
							</c:forEach>
				            
				            
				        </div>
				    </div>
				    <div class="owl-nav" >
				        <div class="owl-prev clickbtn" style="background: none;"><button type="button"  onclick="clickPreviousItem(${c.id })" style="border:none;background: yellow;"><i class="fas fa-chevron-left"></i></button></div>
				        <div class="owl-next clickbtn" style="background: none;"><button type="button"  onclick="clickNextItem(${c.id })"  style="border:none;background: yellow;"><i class="fas fa-chevron-right"></i></button></div>
				    </div>
	
				</div>
				
			</div>
		</c:forEach>
		<!-- túi  -->
		<div class="featured_bags"></div>
		<!-- phụ kiện  -->
		<div class="featured_accesories"></div>
	</main>
<!-- =========== -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</html>