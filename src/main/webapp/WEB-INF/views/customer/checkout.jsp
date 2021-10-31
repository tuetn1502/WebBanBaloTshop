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
<title>Đặt hàng</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<form action="${base }/cart/checkout" method="POST">
		<div class="row m-0 checkout">
		
			<div class="col-md-5 ">
				<div><span><h4>Thông tin người nhận</h4></span></div>
					<c:if test="${isLogined }">
		                <div class="form-group">
		                    <input type="text" class="form-control " id="fullname" name="customerFullName"  placeholder="Họ và tên *" value="${userLogined.fullname }" disabled> 
		                </div>
		                <div class="form-group">
		                    <input type="email" class="form-control" id="email" name="customerEmail" aria-describedby="emailHelp" value="${userLogined.id }" placeholder="Email *" disabled>
		                </div>
		                <div class="form-group">
		                    <input type="email" class="form-control" id="email" name="customerEmail" aria-describedby="emailHelp" value="${userLogined.email }" placeholder="Email *" disabled>
		                </div>
		                <div class="form-group">
		                    <input type="text" class="form-control" id="phone" name="customerPhone" placeholder="Số điện thoại *" value="${userLogined.phone }" disabled>
		                </div>
		                <div class="form-group">
		                    <input type="text" class="form-control" id="address" name="customerAddress"  placeholder="Địa chỉ *" value="${userLogined.address }" disabled>
		                </div>
					</c:if>
					<c:if test="${isLogined ==false }">
	                	<div class="form-group">
		                    <input type="text" class="form-control" id="fullname" name="customerFullName"  placeholder="Họ và tên *" required>
		                </div>
		                <div class="form-group">
		                    <input type="email" class="form-control" id="email" name="customerEmail" aria-describedby="emailHelp" placeholder="Email *" required>
		                </div>
		                <div class="form-group">
		                    <input type="text" class="form-control" id="phone" name="customerPhone" placeholder="Số điện thoại *" required>
		                </div>
		                <div class="form-group">
		                    <input type="text" class="form-control" id="address" name="customerAddress"  placeholder="Địa chỉ *" required>
		                </div>
					</c:if>
					
	                <div class="form-group">
	                    <textarea class="form-control" id="custom_note" rows="6" name="customerNote" placeholder="Ghi chú đơn hàng*" ></textarea>
	                </div>
	            
			</div>
			<div class="col-md-7 border-left">
				<div><span><h4>Hoá đơn đặt hàng</h4></span></div>
				<div class="table-responsive shopping-cart m-0 order">
			        <table class="table">
			            <thead>
			                <tr class="table-light">
			                    <th>Sản phẩm</th>
			                    <th class="text-center">Số lượng</th>
			                    <th class="text-center">Số tiền</th>
			                </tr>
			            </thead>
			            <tbody>
			            	
							<c:forEach items="${cart.cartItems }" var="o">
				                <tr class="table-light">
				                    <td>
				                        <div class="product-item">
				                            <div class="product-info">
				                                <h4 class="product-title"><a href="#" class="text-dark d-inline-block align-middle">${o.productName }</a></h4>
				                            </div>
				                        </div>
				                    </td>
				                    <td class="text-center">
				                        <div class="count-input">
				                            <strong>${o.quality }</strong>
				                        </div>
				                    </td>
				                    <td class="text-center text-lg text-medium">
				                    	<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${o.quality*o.priceUnit }" type="currency" />
				                    </td>
				                </tr>
			                </c:forEach>
			                <tr class="table-light ">
			                	<th >Tạm tính</th>
			                	<th></th>
			                	<th class="text-center">
			                		<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${cart.totalPrice }" type="currency" />
			                	</th>
			                </tr>
			                <c:if test="${cart.cartItems!=null }">
			                	<tr class="table-light">
				                	<td>Phí Vận Chuyển</td>
				                	<td></td>
				                	<td class="text-center">
				                		<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${shipFee }" type="currency" />
				                	</td>
				                </tr>
				                <tr class="table-light">
				                	<th>Tổng cộng:</th>
				                	<th></th>
				                	<th class="text-center">
				                		<div class="totalMoneyOfOrder" id="totalMoneyOfOrder">
				                			<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${cart.totalPrice + shipFee }" type="currency" />
				                		</div>
				                		
									</th>
				                </tr>
			                </c:if>
			                <c:if test="${cart.cartItems ==null }">
			                	<tr class="table-light">
				                	<td>Phí Vận Chuyển</td>
				                	<td></td>
				                	<td class="text-center">
				                		<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="0" type="currency" />
				                	</td>
				                </tr>
				                <tr class="table-light">
				                	<th>Tổng cộng:</th>
				                	<th></th>
				                	<th class="text-center">
				                		<div class="totalMoneyOfOrder" id="totalMoneyOfOrder">
				                			<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="0" type="currency" />
				                		</div>
				                		
									</th>
				                </tr>
			                </c:if>
			                
			                
			            </tbody>
			        </table>
			        <div class="shopping-cart-footer bg-light">
				        <div class="column d-flex">
				            <input class="form-control form-control-sm" type="text" placeholder="Mã khuyến mại *">
				            <button class="btn btn-outline-primary btn-sm" type="button">Áp dụng</button>
				        </div>
				        <div class="column ">
				        	<select>
				        		<option>Chọn phương thức thanh toán</option>
				        		<option>Thanh toán khi nhận hàng</option>
				        	</select>
				        </div>
				    </div>
			        <div class="text-center bg-light p-3">
			        	<button class="btn btn-success" type="submit" id="saveOrder" >Thanh toán</button>
			        </div>
			    </div>
			</div>
		
		</div>
	</form>
	
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</html>