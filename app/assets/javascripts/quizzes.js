function showMoreQuizzesButton() {
    $("#view-more-quizzes-button-container").show();
	$("#view-more-quizzes-button-container").delay(3000).fadeTo("slow",1);
    return null;          
}
$(document).ready(function() {
	if ($.cookie("viewer_name")){
		$("#named-greeting").show();
		$("#viewer-name").html(jQuery.cookie("viewer_name"));
	}
	else{
		$("#enter-viewer-name-textbox-container").show();
	}

	$('#quiz-form').submit(function() {
		var submitme = true;
		var nam, question;
	    $(':radio').each(function() { // loop through each radio button
	        nam = $(this).attr('name'); // get the name of its set
	        $(this).closest('.question-container').css("background-color", "transparent");
	        if (!$(':radio[name="'+nam+'"]:checked').length) { 
	            $(this).closest('.question-container').css("background-color", "rgba(255,255,255,0.25)");
	            if (submitme){
	            	$('html, body').animate({
				        scrollTop: $(this).closest('.question-container').offset().top
				    }, 500);
	            }
	            submitme = false;
	        }
	    });
	    if (submitme){
		    $(this).ajaxSubmit({
		    	beforeSend:function(){
		    		$("#quiz-submit-button").fadeTo("slow",0);
		    		$("#quiz-submit-button").hide();
		    		$(".progress").show();
		    		$(".progress").fadeTo("slow",1);
		    	},
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
				        $('.progress-bar').progressbar();
						//Do something with download progress
				      }
				    }, false);
				    return xhr;
				},
		    	error: function(){
					alert('Oopsy!'); 				
				},
				success: function(data){	

					$("#result-title").html(data["result_prefix"]+" "+data["title"]);
					$("#result-description").html(data["description"]);
					$("#result-image-container").html("<img src = "+ data["image_url"] +">");
					
				},
		    }); 
		}
		else{
		}
	    // return false to prevent normal browser submit and page navigation 
	    return false; 
	});
	$('#viewer-name-form').submit(function() {
		$(this).ajaxSubmit({
	    	beforeSend:function(){
	    		
	    	},
	    	error: function(){
				alert('Oopsy!'); 				
			},
			success: function(data){	
				var viewerName = data["name"];
				$("#enter-viewer-name-textbox-container").hide();
				$("#named-greeting").show();
				$("#viewer-name").html(viewerName);
				$.cookie('viewer_name', viewerName, { expires: 1000, path: '/' });
			}
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
		var image_width = $(this).width();
		if (!($(this).find('.store-info-card').data('visible'))) {
			$(this).find('.store-info-card').animate({
		   		left: "+="+image_width+"px"}, 1500);
			$(this).find('.store-info-card').data('visible',true);
		}
			
	});
	$('.option-card').hover(  
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

	$('.progress-bar').progressbar({
        update: function(current_percentage) { 
	        if (current_percentage == 100){
	    		$("#result-container").show();
				$("#result-container").fadeTo("slow",1);
				$("html, body").animate({ scrollTop: $(document).height() }, 1000);
				showMoreQuizzesButton();				
			}
        }
    });
});

