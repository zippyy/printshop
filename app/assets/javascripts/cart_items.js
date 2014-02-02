$(document).ready(function(){
	
	$('#product_id').on('change', function() {
		var params = "product_id=" + $('#product_id').val();
		  $.ajax({
	    url: "/size_options",  
	    format: 'js',
	    type: "GET",
	    data: params,
  	})
	});

	$(document).on('change', "#size_id", function() {
		var params = "product_id=" + $('#product_id').val();
		  $.ajax({
	    url: "/finish_options",  
	    format: 'js',
	    type: "GET",	
	    data: params,
  	})
	});

	$(document).on('change', '#finish_id', function() {
		var params = "product_id=" + $('#product_id').val();
		  $.ajax({
	    url: "/quantity_options",  
	    format: 'js',
	    type: "GET",
	    data: params,
		})
	});
});