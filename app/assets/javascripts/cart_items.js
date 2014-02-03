$(document).ready(function(){
	
	$('#cart_item_product_id').on('change', function() {
		$('.size_select, .size_select_label, .finish_select, .finish_select_label').remove();
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/size_options",
			format: 'js',
			type: "GET",
			data: params
		})
	});

	$(document).on('change', ".size_select", function() {

		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/finish_options",
			format: 'js',
			type: "GET",
			data: params,
		})
	});

	$(document).on('change', '.finish_select', function() {
		$('#quantity_id, #quantity_id_label').remove()
		var params = "product_id=" + $('#product_id').val();
		$.ajax({url: "/quantity_options",
			format: 'js',
			type: "GET",
			data: params,
		})
	});

	// $(document).on('change', '#quantity_id', function() {
	// 	$.ajax({
	// 		url: "/submit_options",
	// 		format: 'js',
	// 		type: "GET",
	// 	})
	// });


});