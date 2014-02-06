$(document).ready(function(){
	
	$('#cart_item_product_id').on('change', function(event) {
		
		$('#cart_item_finish_id, #cart_item_quantity_id').prop('disabled', true);
		$('#cart_item_finish_id, #cart_item_quantity_id').val(''); 

		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/size_options",
			format: 'js',
			type: "GET",
			data: params
		})
		event.preventDefault()
	});

	$(document).on('change', "#cart_item_size_id", function(event) {
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/finish_options",
			format: 'js',
			type: "GET",
			data: params,
		})
		event.preventDefault()
	});

	$(document).on('change', '#cart_item_finish_id', function(event) {

		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({url: "/quantity_options",
			format: 'js',
			type: "GET",
			data: params,
		})
		event.preventDefault()
	});

	// //add price when prices worked out

	// $(document).on('change', '#quantity_id', function(event) {
	// 	$.ajax({
	// 		url: "/submit_options",
	// 		format: 'js',
	// 		type: "GET",
	// 	})
	// 	event.preventDefault()
	// });


});