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
<title>Điện thoại</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	
	
	
	<div class="container-fluid mt-1 mb-5 category_container">
		<div class="top_main">
			<nav aria-label="breadcrumb">
			  	<ol class="breadcrumb ">
				    <li class="breadcrumb-item"><a href="./Homepage.html">Trang chủ</a></li>
				    <li class="breadcrumb-item active" aria-current="page"><a href="./danhmucsanpham.html">Balo</a></li>
			  	</ol>
			</nav>
		</div>
	    <div class="row category_product m-0 pt-3">
	        <div class="col-12 col-sm-3">
	            <div class="card bg-light mb-3">
	                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
	                <ul class="list-group category_block">
	                    <li class="list-group-item"><a href="category.html">Cras justo odio</a></li>
	                    <li class="list-group-item"><a href="category.html">Dapibus ac facilisis in</a></li>
	                    <li class="list-group-item"><a href="category.html">Morbi leo risus</a></li>
	                    <li class="list-group-item"><a href="category.html">Porta ac consectetur ac</a></li>
	                    <li class="list-group-item"><a href="category.html">Vestibulum at eros</a></li>
	                </ul>
	            </div>
	        </div>
	        <div class="col">
	            <div class="row">
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="card">
	                        <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
	                        <div class="card-body">
	                            <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
	                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                            <div class="row">
	                                <div class="col">
	                                    <p class="btn btn-danger btn-block">99.00 $</p>
	                                </div>
	                                <div class="col">
	                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="card">
	                        <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
	                        <div class="card-body">
	                            <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
	                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                            <div class="row">
	                                <div class="col">
	                                    <p class="btn btn-danger btn-block">99.00 $</p>
	                                </div>
	                                <div class="col">
	                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="card">
	                        <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
	                        <div class="card-body">
	                            <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
	                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                            <div class="row">
	                                <div class="col">
	                                    <p class="btn btn-danger btn-block">99.00 $</p>
	                                </div>
	                                <div class="col">
	                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="card">
	                        <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
	                        <div class="card-body">
	                            <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
	                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                            <div class="row">
	                                <div class="col">
	                                    <p class="btn btn-danger btn-block">99.00 $</p>
	                                </div>
	                                <div class="col">
	                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="card">
	                        <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
	                        <div class="card-body">
	                            <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
	                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                            <div class="row">
	                                <div class="col">
	                                    <p class="btn btn-danger btn-block">99.00 $</p>
	                                </div>
	                                <div class="col">
	                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="card">
	                        <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
	                        <div class="card-body">
	                            <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
	                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                            <div class="row">
	                                <div class="col">
	                                    <p class="btn btn-danger btn-block">99.00 $</p>
	                                </div>
	                                <div class="col">
	                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-12">
	                    <nav aria-label="...">
	                        <ul class="pagination">
	                            <li class="page-item disabled">
	                                <a class="page-link" href="#" tabindex="-1">Previous</a>
	                            </li>
	                            <li class="page-item"><a class="page-link" href="#">1</a></li>
	                            <li class="page-item active">
	                                <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
	                            </li>
	                            <li class="page-item"><a class="page-link" href="#">3</a></li>
	                            <li class="page-item">
	                                <a class="page-link" href="#">Next</a>
	                            </li>
	                        </ul>
	                    </nav>
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