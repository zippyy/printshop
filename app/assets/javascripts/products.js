$(document).on('change', "#product_custom", function(event) {
	
	var custom_choice = $(this).val();

	if (custom_choice == "true"){
		$('#product-attributes').slideUp();		
	} else if (custom_choice == "false") {
		$('#product-attributes').slideDown();		
	}
	event.preventDefault();
});