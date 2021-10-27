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
<title>${detailProduct.title}</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<div class="container mt-2 mb-5">
		<div class="top_main">
			<nav aria-label="breadcrumb">
			  	<ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="./Homepage.html">Trang chủ</a></li>
				    <li class="breadcrumb-item active" aria-current="page"><a href="./danhmucsanpham.html">Balo</a></li>
<!-- 				    <li class="breadcrumb-item active" aria-current="page"><a href="./danhmucsanpham.html">Chi tiết</a></li> -->
			  	</ol>
			</nav>
		</div>
	    <div class="row d-flex justify-content-center">
	        <div class="col-md-12">
	            <div class="card">
	                <div class="row product_detail">
	                    <div class="col-md-6">
	                        <div class="images p-3">
	                            <div class="text-center p-4"> <img id="main-image" src="${base }/upload/${detailProduct.avatar}" width="250" /> </div>
<!-- 	                            <div class="thumbnail text-center"> <img onclick="change_image(this)" src="https://i.imgur.com/Rx7uKd0.jpg" width="70"> <img onclick="change_image(this)" src="https://i.imgur.com/Dhebu4F.jpg" width="70"> </div> -->
	                        </div>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="product p-4">
	                            <div class="d-flex justify-content-between align-items-center">
	                                <div class="d-flex align-items-center">
	                                	 
	                                	 <a class="nav-link active" href="${base }/homepage"><i class="fa fa-long-arrow-left"></i> <span class="ml-1">Back</span></a>
	                               	</div>
	                               	<a class="nav-link " href="${base }/cart/view"><i class="fa fa-shopping-cart text-muted"></i></a>
	                               	 
	                            </div>
	                            <div class="mt-4 mb-3"> 
<!-- 	                            <span class="text-uppercase text-muted brand">Orianz</span> -->
	                                <h5 class="text-uppercase">${detailProduct.title}</h5>
	                                <div class="price d-flex flex-row align-items-center"> 
	                                	<span class="act-price">
	                                		<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${detailProduct.price}" type="currency" />
	                                	</span>
<!-- 	                                    <div class="ml-2"> <small class="dis-price">$59</small> <span>40% OFF</span> </div> -->
	                                </div>
	                            </div>
	                            <p class="about">${detailProduct.detailDescription}</p>
	                            <div class="cart mt-4 align-items-center"> <button class="btn btn-danger text-uppercase mr-2 px-4">Add to cart</button> <i class="fa fa-heart text-muted"></i> <i class="fa fa-share-alt text-muted"></i> </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--Section: Contact v.2-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</html>