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
		<!-- balo -->
		<div class="featured_products">
			<div class="title_category"><p>Category</p></div>
			<ul>
				<c:forEach items="${productList }" var="o" begin="0" end="4">
					<li>
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
							<div class="sale ml-5">
								<span>- ?</span>
							</div>
						</div>
						<div class="row p-2 btn_product">
							<div class="col-md-6 p-0">
								<a href="${base }/detail/${o.seo}" class="btn btn-primary">Xem chi tiết</a>
<!-- 								<button type="button" ></button> -->
							</div>
							<div class="col-md-6 p-0">
								<button type="button" class="btn btn-danger" onclick="addToCart(${o.id}, 1);">Thêm vào giỏ</button>
							</div>
						</div>
					</li>	
				</c:forEach>
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
<!-- 				<li> -->
<!-- 					<div class="img_product"> <img src="../images/balo1.jpg" alt=""/></div> -->
<!-- 					<div class="title_product"> <a href="">Balo Beam Backpack Solar Power Backpack K9386W M Black</a></div> -->
<!-- 					<div class="price"> -->
<!-- 						<div class="main_price mr-2"> -->
<!-- 							<span>3400000</span> -->
<!-- 						</div> -->
<!-- 						<div class="price_compare"> -->
<!-- 							<span>3700000</span> -->
<!-- 						</div> -->
<!-- 						<div class="sale ml-5"> -->
<!-- 							<span>- ?</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="row p-2 btn_product"> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-primary">Xem chi tiết</button> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-6 p-0"> -->
<!-- 							<button type="button" class="btn btn-danger">Thêm vào giỏ</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li>	 -->
			</ul>
		</div>
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