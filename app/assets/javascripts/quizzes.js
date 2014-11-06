$(document).ready(function() {
	var option
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
	$('.option-card').click(function(){		
		var optionListContainer = $(this).parent().parent();
		var options = optionListContainer.children();
		options.each(function(option) { 
			$(this).find('.option-selected-bar').hide(500); 
			$(this).find('.curtain').stop().fadeTo('slow', 0.1);  
			$(this).find('.option-selected-bar-holder').stop().fadeTo('slow', 1);  
		});
		$(this).find('.option-selected-bar').show();
		$(this).find('.curtain').hide();
		$(this).find('.option-selected-bar-holder').hide();
		$(this).find('.option-selector-radio').prop("checked", true);
	})
	$('.curtain-container').hover(  
	   function(){  
	      $(this).find('.curtain').stop().fadeTo('slow', 0);  
	   },  
	   function(){ 
	   if($(this).find('.option-selector-radio').is(':checked')) { 
	   } 
	   else{
	   		//If not selected then pull curtain down on mouseout
	      	$(this).find('.curtain').stop().fadeTo('slow', 0.1);  
	   }	
	});  
});
