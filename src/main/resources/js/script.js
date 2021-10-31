function SaveContact(baseUrl) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		fullname: jQuery("#fullname").val(), // lay theo id
		email: jQuery("#email").val(), // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
//		url: baseUrl + "/ajax/contact", //->action
		url: baseUrl + "/homepage",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			alert("sadfsa");
			
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}
function SaveNewsLetter(){
	let data = {
		email: jQuery("#newsletter").val()
	};
	jQuery.ajax({
		url: "/ajax/newsletter",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
//			alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.email);
			document.getElementById('message_line').innerHTML= 'Bạn đã đăng ký thành công!';
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
	
}

// Thêm sản phẩm vào trong giỏ hàng
function addToCart(productId, quality) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
		quality: quality, // lay theo id
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url:"/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
//			alert("Đã thêm sản phẩm thành công");
			$( "#totalproductsInCart" ).html(jsonResult.totalItems);
			$([document.documentElement, document.body]).animate({
			    scrollTop: $("#totalproductsInCart").offset().top
			}, 300);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			alert("lỗi");
		}
	});
}

//$('#saveOrder').on('click',function(){
//	$('#saveOrder').document.
//	alert("dsjfj");
//});
$('.visibility-cart').on('click',function(){
       
  var $btn =  $(this);
  var $cart = $('.cart');
  console.log($btn);
  
  if ($btn.hasClass('is-open')) {
     $btn.removeClass('is-open');
     $btn.text('O')
     $cart.removeClass('is-open');     
     $cart.addClass('is-closed');
     $btn.addClass('is-closed');
  } else {
     $btn.addClass('is-open');
     $btn.text('X')
     $cart.addClass('is-open');     
     $cart.removeClass('is-closed');
     $btn.removeClass('is-closed');
  }

                  
});


//doi don vi tien VN
function formatCash(str) {
 	return str.split('').reverse().reduce((prev, next, index) => {
 		return ((index % 3) ? next : (next + '.')) + prev
 	})
}
function deleteCartItems(x,productId){
	var tr =x.parentElement.parentElement;
	tr.remove();
	
	let data = {
		productId: productId
	};
	jQuery.ajax({
		url: "/ajax/deleteCartItems",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			alert("Đã xoá sản phẩm khỏi giỏ hàng!");
			$('body').load('/cart/view');
//			var strTotalPrice= jsonResult.totalPrice+'';
//			var totalPrice = formatCash(strTotalPrice)+' ₫';
//			$( "#totalproductsInCart" ).html(jsonResult.totalItems);
//			$( "#totalPrice" ).html(totalPrice);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
	
}
function signup(){
	var  fullname=document.getElementById('fullname').value;
	var  birthday =document.getElementById('birthday').value;
//	var	 gender1 = document.getElementById('maleGender').value;
//	var	 gender2 = document.getElementById('femaleGender').value;
	var checkbox = document.getElementsByName("gender");
	var  gender = '';
	for(var i = 0; i < checkbox.length; i++){
		if(checkbox[i].checked == true){
			gender = checkbox[i].value;
		}
	}
	var  phone=document.getElementById('phoneNumber').value;
	var  email=document.getElementById('emailAddress').value;
	var  address=document.getElementById('address').value;
	var  username=document.getElementById('username').value;
	var  password=document.getElementById('password').value;
	var  re_password=document.getElementById('re_password').value;

//	alert(fullname+" "+birthday+" "+gender+" "+phone+" "+ email+" "+ address+" "+username+" "+password+" "+re_password);
	
	
	if(fullname != '' && birthday != '' && phone != '' && email != '' && address != '' && username !='' && password !='' && re_password !=''){
		if(password != re_password){ 
			alert("Mật khẩu không trùng khớp!");
		}
		else{
			var data={fullname: fullname,birthday: birthday,gender: gender,phone: phone,email: email,address: address,username: username,password: password};
			jQuery.ajax({
				url: "/ajax/signup",
				type: "post",
				contentType: "application/json",
				data: JSON.stringify(data),
		
				dataType: "json", // kieu du lieu tra ve tu controller la json
				success: function(jsonResult) {
					alert("Tạo tài khoản thành công!");
					$('body').load('/homepage');
				},
				error: function(jqXhr, textStatus, errorMessage) {
		
				}
			});
		
		}
	}else{
		if (fullname == '') {
			$('#fullname').attr('placeholder','Vui lòng nhập họ tên');
		}
		if (birthday == '') {
			$('#birthday').attr('placeholder','Vui lòng chọn ngày sinh');
		}
		if (phone == '') {
			$('#phoneNumber').attr('placeholder','Vui lòng nhập số điện thoại');
		}
		if (email == '') {
			$('#emailAddress').attr('placeholder','Vui lòng nhập email');
		}
		if (address == '') {
			$('#address').attr('placeholder','Vui lòng nhập địa chỉ');
		}
		if (username == '') {
			$('#username').attr('placeholder','Vui lòng nhập tên đăng nhặp');
		}
		if (password == '') {
			$('#password').attr('placeholder','Vui lòng nhập mật khẩu');
			$('#re_password').attr('placeholder','Vui lòng nhập lại mật khẩu');
		}
	}
}


function change_image(image){

	var container = document.getElementById("main-image");

	container.src = image.src;
}



document.addEventListener("DOMContentLoaded", function(event) {

});
$(document).ready(function(){
  $('.owl-carousel').owlCarousel({
    center: true,
    items:2,
    loop:true,
    margin:25,
    responsive:{
        600:{
            items:5
        }
    }
	});
//	function clickNextItem(id){
//	var owl = $("'#"+id+"'");
//	owl.owlCarousel();
//	// Go to the next item
//	owl.trigger('next.owl.carousel');
//	
//}
//function clickPreviousItem(id){
//	var owl = $("'#"+id+"'");
//	owl.owlCarousel();
//	owl.trigger('prev.owl.carousel', [300]);
//}
//	var owl = $('.owl-carousel');
//	owl.owlCarousel();
//	// Go to the next item
//	$('.customNextBtn').click(function() {
//	    owl.trigger('next.owl.carousel');
//	})
//	// Go to the previous item
//	$('.customPrevBtn').click(function() {
//	    // With optional speed parameter
//	    // Parameters has to be in square bracket '[]'
//	    owl.trigger('prev.owl.carousel', [300]);
//	});

});

function clickNextItem(id){
	var owl = $("#"+id);
	owl.owlCarousel();
	// Go to the next item
	owl.trigger('next.owl.carousel');
	
}
function clickPreviousItem(id){
	var owl = $("#"+id);
	owl.owlCarousel();
	owl.trigger('prev.owl.carousel', [300]);
}
