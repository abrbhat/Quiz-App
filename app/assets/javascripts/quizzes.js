$(document).ready(function() {
	var option
	$('#quiz-form').submit(function() { 
	    // submit the form 
	    $(this).ajaxSubmit({
			xhr: function()
			  {
			    var xhr = new window.XMLHttpRequest();
			    //Upload progress
			    xhr.upload.addEventListener("progress", function(evt){
			      if (evt.lengthComputable) {
			        var percentComplete = ((evt.loaded / evt.total) * 100).toString();
			        //Do something with upload progress
			        $(".progress-bar").data("transitiongoal",percentComplete);
			        console.log("upload:percentComplete");
			        console.log(percentComplete);
			      }
			    }, false);
			    //Download progress
			    xhr.addEventListener("progress", function(evt){
			      if (evt.lengthComputable) {
			        var percentComplete = ((evt.loaded / evt.total) * 100).toString();
			        //Do something with upload progress
			        $(".progress-bar").attr("data-transitiongoal",percentComplete);
			        $(".progress-bar").progressbar(); 
			        //Do something with download progress
			        console.log($(".progress-bar").data("transitiongoal"));
			        console.log(percentComplete);
			      }
			    }, false);
			    return xhr;
			},
	    	error: function(){
				alert('Oopsy!'); 				
			},
			success: function(data){	
				$("#result-container").show();
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
	$('.progress .progress-bar').progressbar(); 
});
