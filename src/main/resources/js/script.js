function SaveContact(baseUrl) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		name: jQuery("#name").val(), // lay theo id
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
			alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.email);
			
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
			alert("Đã xoá!");
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
	
}

function change_image(image){

var container = document.getElementById("main-image");

container.src = image.src;
}



document.addEventListener("DOMContentLoaded", function(event) {

});

