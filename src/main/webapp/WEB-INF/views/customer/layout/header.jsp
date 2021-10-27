<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 <header>
        <div class="top_header">
			<div class="row ">
				<div class="col-md-2 logo">
					<a href="${base }/homepage"><img src="../images/logo.png" alt=""/> </a>
				</div >
				<div class="col-md-10 d-flex">
					<div class="col-md-6 menu_bar">
						<ul class="nav">
							<li class="nav-item">
							  <a class="nav-link active" href="${base }/homepage"><i class="fas fa-home"></i> Home</a>
							</li> |
							<li class="nav-item">
							  <a class="nav-link" href="${base }/category">Balo</a>
							</li> |
							<li class="nav-item">
							  <a class="nav-link" href="#">Túi</a>
							</li> |
							<li class="nav-item">
							  <a class="nav-link " href="#">Phụ kiện</a>
							</li> |
							<li class="nav-item">
								<a class="nav-link " href="${base }/contact">Liên hệ</a>
							</li>
						  </ul>
					</div>
					<div class="col-md-3">
						<form id="form_search" method="GET" action="">
							<div class="input-group">
							  <input type="text" class="form-control" placeholder="Tìm kiếm ..." aria-label="" aria-describedby="basic-addon2">
							  <div class="input-group-append">
								<button class="btn btn-outline-primary" type="button" style="border-radius: 0 22px 22px 0;"><i class="fas fa-search"></i></button>
							  </div>
							</div>
						</form>
					</div>
					<div class="col-md-3 user_cart">
						<ul>
							<li class="nav-item">
								<a class="nav-link " href="${base }login"> <i class="fas fa-user mr-2"></i> Tài Khoản</a>
							</li>
							<li class="nav-item">
								<a class="nav-link " href="${base }/cart/view"> <i class="fal fa-shopping-cart mr-2"></i>  Giỏ hàng</a>
								<c:if test="${cart.cartItems != null}"><span class="number_cart" id="totalproductsInCart">${totalItems }</span></c:if>
								<c:if test="${cart.cartItems == null}"><span class="number_cart" id="totalproductsInCart">0</span></c:if>
								
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
    </header>