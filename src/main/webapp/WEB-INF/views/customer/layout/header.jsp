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
					<a href="${base }/homepage"><img src="${base }/images/logo.png" alt=""/> </a>
				</div >
				<div class="col-md-10 d-flex">
					<div class="col-md-6 menu_bar">
						<ul class="nav">
							<li class="nav-item">
							  <a class="nav-link active" href="${base }/homepage"><i class="fas fa-home"></i> Home</a>
							</li>
							<c:forEach items="${categoryParent.data }" var="o">
								|<li class="nav-item">
									<a class="nav-link " href="${base }/category/${o.seo}">${o.name }</a>
								</li>
							</c:forEach>
							|<li class="nav-item">
								<a class="nav-link " href="${base }/contact">Liên hệ</a>
							</li>
						  </ul>
					</div>
					<div class="col-md-3">
						<form id="form_search" method="POST" action="${base }/search">
							<div class="input-group">
							  <input type="text" class="form-control" placeholder="Tìm kiếm ..." aria-label="" aria-describedby="basic-addon2" id="searchHome" name="searchHome">
							  <div class="input-group-append">
								<button class="btn btn-outline-primary" type="submit" style="border-radius: 0 22px 22px 0;"><i class="fas fa-search"></i></button>
							  </div>
							</div>
						</form>
					</div>
					<div class="col-md-3 user_cart">
						<ul>
							<c:if test="${isLogined }">
								<li class="nav-item">
<%-- 									<a class="nav-link text-truncate" href="${base }/login"> <i class="fas fa-user mr-2"></i> ${userLogined.email }</a> --%>
									<div class="dropdown show">
									  <a class="nav-link text-truncate dropdown-toggle" href="${base }/login" role="button" id="dropdownMenuLink" data-toggle="dropdown"
									   aria-haspopup="true" aria-expanded="false">
									   <i class="fas fa-user mr-2"></i> ${userLogined.email }
									  </a>
									
									  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									  	<c:if test="${isAdmin }">
									    	<a class="dropdown-item" href="${base }/admin/index">Quản lý shop</a>
									    	<a class="dropdown-item" href="${base }/logout">Đăng xuất</a>
									    </c:if>
									    <c:if test="${isAdmin ==false }">
									    	<a class="dropdown-item" href="${base }/logout">Đăng xuất</a>
									    </c:if>
									  </div>
									</div>
								</li>
							</c:if>
							<c:if test="${isLogined == false }">
								<li class="nav-item ">
									<a class="nav-link " href="${base }/login"> <i class="fas fa-user mr-2"></i> Tài Khoản</a>
								</li>
							</c:if>
							
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