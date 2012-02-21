// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery

$(document).ready(function() {
     $('#myButton').click(function(e) {
          e.preventDefault();
	  $('#myModal').reveal();
     });
});

$(document).ready(function() {

  $("a[rel=iframe]").fancybox({
    'titlePosition'	: 'over',
	'transitionIn'    :    'none',
    'transitionOut'    :    'none',
    
    'overlayShow'    :    true
  });

  $("a.iframe_defaults").fancybox();
 
 $("#various1").fancybox({
				'Position'	: 'inside',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none',
				'type'				: 'inline'
			});
 
 
});




$(document).ready(function() {

 var params1 = {
    loaderClass : "loading_bar",
    debug       : true,
    speed       : 'fast'
  };

 $.fn.nimbleLoader.setSettings(params1);



 function hideGlobalLoader(){
    $("body").nimbleLoader("hide");
  }

  $("#Find").click(function(){
    $("body").nimbleLoader("show", params1);
    setTimeout(hideGlobalLoader, 2000);
  });


});


$('.submittable').live('change', function() {
  $(this).parents('form:first').submit();
});

