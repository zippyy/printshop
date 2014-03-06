 $(document).ready(function () {
	$( ".price-button" ).on( "click", function() {
		cell = $( this ).parent()[0];
		id = cell.id;
		price = $("#input-field-" + id).val();
		product_id = $('#' + id).data("product");
		size_id = $('#' + id).data("size");
		finish_id = $('#' + id).data("finish");
		quantity_id = $('#' + id).data("quantity");

		$.ajax({
			url: "/prices",
			format: 'js',
			type: "POST",
			data: { price: price, product_id: product_id, size_id: size_id, finish_id: finish_id, quantity_id: quantity_id }
		})

	});
});