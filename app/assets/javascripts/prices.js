 $(document).ready(function () {
	$( ".price-button" ).on( "click", function(event) {
		cell = $( this ).parent()[0];
		id = cell.id;

		price = $("#input-field-" + id).val();
		product_id = $('#' + id).data("product");
		size_id = $('#' + id).data("size");
		finish_id = $('#' + id).data("finish");
		quantity_id = $('#' + id).data("quantity");

		$.ajax({
			url: "prices",
			format: 'js',
			type: "POST",
			data: { price: price, product_id: product_id, size_id: size_id, finish_id: finish_id, quantity_id: quantity_id, id: id }
		})
		event.preventDefault();
	});

	$(document).on('click', '.edit-price-button', function(event) {
		cell = $( this ).parent()[0];
		row_id = cell.id;
		price = $("#price-val-" + row_id).html();
		product_id = $('#' + row_id).data("product");
		size_id = $('#' + row_id).data("size");
		finish_id = $('#' + row_id).data("finish");
		quantity_id = $('#' + row_id).data("quantity");



		$.ajax({
			url: "prices/" + 1 + "/edit",
			format: 'js',
			type: "GET",
			data: { 
				row_id: row_id,
				price: price,
				product_id: product_id,
				size_id: size_id,
				finish_id: finish_id,
				quantity_id: quantity_id
			}
		})
		event.preventDefault();
	});

	$(document).on('click', ".update-price-button", function(event) {
		cell = $( this ).parent()[0];
		row_id = cell.id;
		price = $("#updated-price-field-" + row_id).val();
		product_id = $('#' + row_id).data("product");
		size_id = $('#' + row_id).data("size");
		finish_id = $('#' + row_id).data("finish");
		quantity_id = $('#' + row_id).data("quantity");

		$.ajax({
			url: "prices/update",
			format: 'js',
			type: "PUT",
			data: { 
				row_id: row_id,
				price: price,
				product_id: product_id,
				size_id: size_id,
				finish_id: finish_id,
				quantity_id: quantity_id
			}
		})
		event.preventDefault();
	});
});