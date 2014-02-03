$(document).ready(function(){
	
	$('#product_id').on('change', function() {
		$('#size_id, #size_id_label, #finish_id, #finish_id_label, #quantity_id, #quantity_id_label').remove();
		var params = "product_id=" + $('#product_id').val();
		$.ajax({
			url: "/size_options",
			format: 'js',
			type: "GET",
			data: params,
		})
	});

	$(document).on('change', "#size_id", function() {
		$('#finish_id, #finish_id_label, #quantity_id, #quantity_id_label').remove();
		var params = "product_id=" + $('#product_id').val();
		$.ajax({
			url: "/finish_options",
			format: 'js',
			type: "GET",
			data: params,
		})
	});

	$(document).on('change', '#finish_id', function() {
		$('#quantity_id, #quantity_id_label').remove()
		var params = "product_id=" + $('#product_id').val();
		$.ajax({url: "/quantity_options",
			format: 'js',
			type: "GET",
			data: params,
		})
	});

	$(document).on('change', '#quantity_id', function() {
		$.ajax({
			url: "/submit_options",
			format: 'js',
			type: "GET",
		})
	});


});