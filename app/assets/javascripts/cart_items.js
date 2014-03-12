$(document).ready(function(){
	
	$('#cart_item_product_id').on('change', function(event) {
		
		$('#cart_item_finish_id, #cart_item_quantity_id').prop('disabled', true);
		$('#cart_item_finish_id, #cart_item_quantity_id').val(''); 
		$('.button-element').remove();
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/printshop/product_type",
			format: 'js',
			type: "GET",
			data: params
		})
		event.preventDefault()
	});

	$(document).on('change', "#cart_item_size_id", function(event) {

		$('#cart_item_finish_id, #cart_item_quantity_id').prop('disabled', true);
		$('#cart_item_quantity_id').val(''); 
		$('.button-element').remove();

		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({
			url: "/printshop/finish_options",
			format: 'js',
			type: "GET",
			data: params,
		})
		event.preventDefault()
	});

	$(document).on('change', '#cart_item_finish_id', function(event) {
		$('#cart_item_quantity_id').prop('disabled', true);
		$('#cart_item_quantity_id').val(''); 
		$('.button-element').remove();
		var params = "product_id=" + $('#cart_item_product_id').val();
		$.ajax({url: "/printshop/quantity_options",
			format: 'js',
			type: "GET",
			data: params,
		})
		event.preventDefault()
	});

	$(document).on('change', '#cart_item_quantity_id', function(event) {
		$('.button-element').remove();

		 var product_id = $('#cart_item_product_id').val()
		 var size_id = $('#cart_item_size_id').val();
		 var finish_id = $('#cart_item_finish_id').val();
		 var quantity_id = $('#cart_item_quantity_id').val();

		$.ajax({
			url: "/printshop/submit_options",
			format: 'js',
			type: "GET",
			data: {product_id: product_id, size_id: size_id, finish_id: finish_id, quantity_id: quantity_id},
		})
		event.preventDefault()
	});
});


