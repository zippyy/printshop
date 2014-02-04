$(document).ready(function(){
	
	$('#cart_item_product_id').on('change', function(event) {
		$('.size_select, .size_select_label, .finish_select, .finish_select_label, .quantity_select, .quantity_select_label').remove();
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/size_options",
			format: 'js',
			type: "GET",
			data: params
		})
		event.preventDefault()
	});

	$(document).on('change', ".size_select", function(event) {
		$('.finish_select, .finish_select_label, .quantity_select, .quantity_select_label').remove();
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/finish_options",
			format: 'js',
			type: "GET",
			data: params,
		})
		event.preventDefault()
	});

	$(document).off('change').on('change', '.finish_select', function(event) {
		$('.quantity_select, .quantity_select_label').remove();
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({url: "/quantity_options",
			format: 'js',
			type: "GET",
			data: params,
		})
		event.preventDefault()
	});

	//add price when prices worked out

	$(document).on('change', '#quantity_id', function(event) {
		$.ajax({
			url: "/submit_options",
			format: 'js',
			type: "GET",
		})
		event.preventDefault()
	});


});