function deleteProduct(x,idProduct){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={id: idProduct};
	jQuery.ajax({
		url:"/admin/product/delete",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Đã xoá sản phẩm!");
			$('body').load('/admin/product/list');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}

function deleteCategories(x,idCategory){
	var tr = x.parentElement.parentElement;
	tr.remove();
	var data={id: idCategory};
	jQuery.ajax({
		url:"/admin/category/delete",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Đã xoá!");
			$('body').load('/admin/category/list');
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
function deleteAccount(x,idUser,seo){
//	var tr = x.parentElement.parentElement;
//	tr.remove();
	var data={id: idUser};
	jQuery.ajax({
		url:"/admin/account/delete",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		success: function(jsonResult){
			alert("Đã xoá!");
			$('body').load('/admin/account/'+seo);
		},
		error: function(jqXhr,textStatus,errorMessage){}
	});
}
$(document).ready(function() {
    $('#detail_description').summernote({
      placeholder: 'Enter content....',
      tabsize: 2,
      height: 200,
      minHeight: 100,
      maxHeight: 300,
      focus: true,
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']],
      ],
      popover: {
        image: [
          ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
          ['float', ['floatLeft', 'floatRight', 'floatNone']],
          ['remove', ['removeMedia']]
        ],
        link: [
          ['link', ['linkDialogShow', 'unlink']]
        ],
        table: [
          ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
          ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
        ],
        air: [
          ['color', ['color']],
          ['font', ['bold', 'underline', 'clear']],
          ['para', ['ul', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture']]
        ]
      },
      codemirror: {
        theme: 'monokai'
      }
    });
  
});
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
});


