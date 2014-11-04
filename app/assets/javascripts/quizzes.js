$(document).ready(function() {
	$('#quiz-form').submit(function() { 
	    // submit the form 
	    $(this).ajaxSubmit({
	    	error: function(){
				alert('Oopsy!'); 				
			},
			success: function(data){	
				$("#result-title").html(data["result_prefix"]+" "+data["title"]);
				$("#result-description").html(data["description"]);
				$("#result-image-container").html("<img src = "+ data["image_url"] +">");
			},
	    }); 
	    // return false to prevent normal browser submit and page navigation 
	    return false; 
	});
});
