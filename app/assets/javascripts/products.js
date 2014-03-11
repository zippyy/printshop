$(document).ready(function(){
	if ($('#product_custom').val() == "false" ) {
		$('#product-attributes').hide()
	};
});

$(document).on('change', "#product_custom", function(event) {
	var custom_choice = $(this).val();
	if (custom_choice == "true"){
		$('#product-attributes').slideDown();		
	} else if (custom_choice == "false") {
		$('#product-attributes').slideUp();		
	}
	event.preventDefault();
});