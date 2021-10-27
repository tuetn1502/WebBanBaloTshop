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
<title>Contact us</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	
	<section class="jumbotron ">
		
	    <div class="container">
	        <h1 class="jumbotron-heading">E-COMMERCE CONTACT</h1>
	        <p class="lead text-muted mb-0">Contact Page build with Bootstrap 4 !</p>
	    </div>
	    
		<div class="container">
		    <div class="row">
		        <div class="col">
		            <div class="card">
		                <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Contact us.
		                </div>
		                <div class="card-body">
		                    <form>
		                        <div class="form-group">
		                            <label for="name">Name</label>
		                            <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name" required>
		                        </div>
		                        <div class="form-group">
		                            <label for="email">Email address</label>
		                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" required>
		                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		                        </div>
		                        <div class="form-group">
		                            <label for="message">Message</label>
		                            <textarea class="form-control" id="message" rows="6" required></textarea>
		                        </div>
		                        <div class="mx-auto">
		                        <button type="submit" class="btn btn-primary text-right">Submit</button></div>
		                    </form>
		                </div>
		            </div>
		        </div>
		        <div class="col-12 col-sm-4">
		            <div class="card bg-light mb-3">
		                <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-home"></i> Address</div>
		                <div class="card-body">
		                    <p>Hà Nội</p>
		                    <p>Email : tangoctue1502@gmail.com</p>
		                    <p>Phone: 0967325834</p>
		
		                </div>
		
		            </div>
		        </div>
		    </div>
		</div>
	</section>

	
	<!--Section: Contact v.2-->
	<%-- <section class="mx-5">

		<!--Section heading-->
		<h2 class="h1-responsive font-weight-bold text-center my-4">Contact
			us</h2>
		<!--Section description-->
		<p class="text-center w-responsive mx-auto mb-5">${DuLieuBanNhapLa}</p>

		<p class="text-center w-responsive mx-auto mb-5">${contactModel.thongBao}</p>
		<!-- 		html form -->
		<div class="row">

			<!--Grid column-->
			<div class="col-md-9 mb-md-0 mb-5">
				<form id="contact-form" name="contact-form" action="${base }/contact"
					method="POST">

					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<input type="text" id="name" name="name" class="form-control">
								<label for="name" class="">Your name</label>
							</div>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<input type="text" id="email" name="email" class="form-control">
								<label for="email" class="">Your email</label>
							</div>
						</div>
						<!--Grid column-->

					</div>
					<!--Grid row-->

					<!--Grid row-->
					<div class="row">
						<div class="col-md-12">
							<div class="md-form mb-0">
								<input type="text" id="subject" name="subject"
									class="form-control"> <label for="subject" class="">Subject</label>
							</div>
						</div>
					</div>
					<!--Grid row-->

					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-12">

							<div class="md-form">
								<textarea type="text" id="message" name="message" rows="2"
									class="form-control md-textarea"></textarea>
								<label for="message">Your message</label>
							</div>

						</div>
					</div>
					<!--Grid row-->

				</form>

				<div class="text-center text-md-left">
					<a class="btn btn-primary"
						onclick="document.getElementById('contact-form').submit();">Send</a>
				</div>
				<div class="status"></div>
			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-md-3 text-center">
				<ul class="list-unstyled mb-0">
					<li><i class="fas fa-map-marker-alt fa-2x"></i>
						<p>San Francisco, CA 94126, USA</p></li>

					<li><i class="fas fa-phone mt-4 fa-2x"></i>
						<p>+ 01 234 567 89</p></li>

					<li><i class="fas fa-envelope mt-4 fa-2x"></i>
						<p>contact@mdbootstrap.com</p></li>
				</ul>
			</div>
			<!--Grid column-->

		</div>
		<!-- 		spring form -->
		<div class="row">

			<!--Grid column-->
			<div class="col-md-9 mb-md-0 mb-5">
				<sf:form id="contact-Spring-form" name="contact-form" action="${base}/contact"
					method="POST" modelAttribute="contact">

					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<sf:input type="text" id="firstName" name="firstName" path="firstName" class="form-control"></sf:input>
								<label for="firstName" class="">First name</label>
							</div>
						</div>
						<!--Grid column-->
						<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<sf:input type="text" id="lastName" name="lastName" path="lastName" class="form-control"></sf:input>
								<label for="lastName" class="">Last name</label>
							</div>
						</div>
						<!--Grid column-->
						<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<sf:input type="text" id="email" name="email" path="email" class="form-control"></sf:input>
								<label for="email" class="">Your email</label>
							</div>
						</div>
						<!--Grid column-->

					</div>
					<!--Grid row-->

					<!--Grid row-->
					<div class="row">
<!-- 						<div class="col-md-6"> -->
<!-- 							<div class="md-form mb-0"> -->
								<sf:input type="text" id="subject" name="subject" path="subject"
									class="form-control"></sf:input>
<!-- 									 <label for="subject" class="">Subject</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
					</div>
					<!--Grid row-->

					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-12">

							<div class="md-form">
								<sf:textarea type="text" id="message" name="message" path="message" rows="2"
									class="form-control md-textarea"></sf:textarea>
								<label for="message">Your message</label>
							</div>

						</div>
					</div>
					<!--Grid row-->

				</sf:form>

				<div class="text-center text-md-left">
					<a class="btn btn-primary"
						onclick="document.getElementById('contact-Spring-form').submit();">Send via springframework</a>
					<a class="btn btn-primary"onclick="SaveContact('${base}');">Send via ajax</a>

				</div>
				<div class="status"></div>
			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-md-3 text-center">
				<ul class="list-unstyled mb-0">
					<li><i class="fas fa-map-marker-alt fa-2x"></i>
						<p>San Francisco, CA 94126, USA</p></li>

					<li><i class="fas fa-phone mt-4 fa-2x"></i>
						<p>+ 01 234 567 89</p></li>

					<li><i class="fas fa-envelope mt-4 fa-2x"></i>
						<p>contact@mdbootstrap.com</p></li>
				</ul>
			</div>
			<!--Grid column-->

		</div>

	</section> --%>
	<!--Section: Contact v.2-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</html>