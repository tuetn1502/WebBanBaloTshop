<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="${base }/admin/index" class="brand-link"> <img
		src="${base }/dist/img/tshop.png" alt="AdminLTE Logo"
		class="brand-image  elevation-3" style="opacity: .8"> <span
		class="brand-text font-weight-light">Tshop admin</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="${base }/dist/img/anh.jpg" class="img-circle " alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">Tạ Ngọc Tuệ</a>
			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <li class="nav-item">
		            <a  class="nav-link">
		              <i class="nav-icon fas fa-copy"></i>
		              <p>
		                Quản lý tài khoản
		                <i class="fas fa-angle-left right"></i>
		              </p>
		            </a>
		            <ul class="nav nav-treeview"> 		            	
						<c:forEach items="${roleUsers.getData() }" var="o">
		              		<li class="nav-item"  id="categoryId">
		                		<a href="${base }/admin/account/${o.name}" class="nav-link ">
		                		<i class="far fa-circle nav-icon"></i>
		                  			<p value="${o.id }">${o.name }</p>
		                		</a>
		              		</li>
	              		</c:forEach>
	            	</ul>
	          	</li>
				<li class="nav-item">
		            <a href="${base }/admin/category/list" class="nav-link">
		              <i class="nav-icon fas fa-copy"></i>
		              <p>
		                Quản lý danh mục
		                <i class="fas fa-angle-left right"></i>
		              </p>
		            </a>
	          	</li>
	          	<li class="nav-item">
		            <a href="" class="nav-link">
		              <i class="nav-icon fas fa-copy"></i>
		              <p>
		                Quản lý sản phẩm
		                <i class="fas fa-angle-left right"></i>
		              </p>
		            </a>
		            <ul class="nav nav-treeview"> 
<!-- 		            	<li class="nav-item"> -->
<%-- 	                		<a href="${base }/admin/product/addOrUpdate" class="nav-link"> --%>
<!-- 	                  			<i class="far fa-circle nav-icon"></i> -->
<!-- 	                  			<p>Thêm sản phẩm</p> -->
<!-- 	                		</a> -->
<!-- 	              		</li> -->
		            	
						<c:forEach items="${categoryParent.getData() }" var="o">
		              		<li class="nav-item"  id="categoryId">
		                		<a href="${base }/admin/category/${o.seo}" class="nav-link ">
		                		<i class="far fa-circle nav-icon"></i>
		                  			<p value="${o.id }">${o.name }</p>
		                		</a>
		              		</li>
	              		</c:forEach>
	            	</ul>
	          	</li>
	          	<li class="nav-item">
		            <a href="${base }/admin/saleOrder/list" class="nav-link">
		              <i class="nav-icon fas fa-copy"></i>
		              <p>
		                Quản lý hoá đơn
		                <i class="fas fa-angle-left right"></i>
		              </p>
		            </a>
		        </li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>