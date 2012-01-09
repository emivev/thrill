/**
 * nimbleLoader 1.0 - Display loading bar where you want with ease
 * Version 1.0
 * @requires    jQuery v1.3.2 (tested with jquery 1.5.2)
 * @description Display a loading bar in whatever block element you want
 *
 *
 ***********************************************************************************************************************
 *                                                                                                          Use case ? *
 ***********************************************************************************************************************
 *
 * Most of the time the nimbleLoader is used when sending ajax request, to warn users that there is something
 * happening in the page :
 * - A form submission is being performed
 * - Update a block content by getting information with ajax request
 * - Upload / Download a file
 * - ...
 *
 ***********************************************************************************************************************
 *                                                                                                  How to configure ? *
 ***********************************************************************************************************************
 *
 * 1- Choose your params
 * @option   String          loaderClass         (optional)  default:"loading_bar"  | CSS class for the element which will display your loading bar (string)
 * @option   Boolean         debug               (optional)  default:false          | useful to display debug info (boolean)
 * @option   String/Numeric  speed               (optional)  default:"fast"         | The speed you want tour loading bar to appear/disappear (numeric or 'slow', 'fast'...)
 * @option   String/Numeric  needRelativeParent  (optional)  default:true           | Automatically set the CSS property "position" of the loading bar parent to "relative"
 *
 *    Example : 
 *    var params = {
 *      loaderClass        : "loading_bar",
 *      debug              : false,
 *      speed              : 'fast',
 *      needRelativeParent : true
 *    }
 *
 * 2- Set your params
 *
 *    2.1 Global way
 *      $.fn.nimbleLoader.setSettings(params);
 *
 *    2.2 Specific way
 *      $("#myDiv").nimbleLoader("show", otherParams);
 *
 * 3- Don't forget to set the css of your loading bar : see the demo to have an example (style/loader.css)
 * 
 *
 * 
 ***********************************************************************************************************************
 *                                                                                                        How to use ? *
 ***********************************************************************************************************************
 *
 * => Showing a loading bar in <div id="myDiv"></div>
 * $("#myDiv").nimbleLoader("show");
 *
 * => Hiding the loading bar
 * $("#myDiv").nimbleLoader("hide");
 *
 */

if(jQuery)(function($){
  
  // Extend JQuery function : adding nimbleLoader
  $.extend($.fn,{
    
    nimbleLoader: function(method, options){
      
      /*************************************************************************
       *  Plugin Methods
       ************************************************************************/

      // Clone the global settings. $.extend is needed : we extend a new object with global settings
      var settings = $.extend( true, {}, $.fn.nimbleLoader.settings);

      // Catch settings given in parameters
      if(options){ jQuery.extend(settings, options); }

      // Function to init the loader
      function init($nimbleLoader, settings){
        var loader = new LoadingHandlerGenerator($nimbleLoader, settings);
        $nimbleLoader.data("loader", loader);
      }

      // Function to show the loading bar
      var show = function(){

        return this.each(function(){
          var $nimbleLoader = $(this);
          if($nimbleLoader.data("loader", loader) !== undefined){
            var loader = $nimbleLoader.data("loader", loader);
            loader.showLoading();
          }
          else{
            init($nimbleLoader, settings);
            $nimbleLoader.nimbleLoader('show');
          }
        });
      };

      // Function to hide the loading bar
      var hide = function(){
        return this.each(function(){
          var $nimbleLoader = $(this);
          if($nimbleLoader.data("loader", loader) !== undefined){
            var loader = $nimbleLoader.data("loader", loader);
            loader.hideLoading();
          }
        });
      };

      var methods = {
        show         : show,
        hide         : hide
      };
      
      /*************************************************************************
      *  Execution when calling .nimbleLoader()
      ************************************************************************/
      if(methods[method]){
        return methods[method].apply( this, Array.prototype.slice.call( arguments, 1));
      }
      else if(!method){
        return methods.show.apply(this , Array.prototype.slice.call( arguments, 1));
      }
      else{
        if(window && window.console){
          console.log("[jquery.nimble.loader] -> no method '"+method+"' to apply ");
        }
        return false;
      }

      /**
       * Closure function which define a loading bar element
       */
      function LoadingHandlerGenerator($parentSelector, params){

        /**
         * Vars init
         * $loadingBar         : the loading bar JQuery element
         * debug               : debug option to display in console how many times the loading bar has been called
         * speed               : animation speed when showing/hiding the loading bar
         * needRelativeParent  : true if your loader has an absolute position : so you need its parent relative
         * countNbCall         : the counter
         */

        var $loadingBar;
        var debug              = params.debug;
        var speed              = params.speed;
        var needRelativeParent = params.needRelativeParent;
        var countNbCall        = 0;
        var waitForAnimation   = {
          isAnimated  : false,
          callStack   : []
        };


        // Init the loader : set html and place it
        function initLoading(){

          // If the loader doesn't exists, we create and init it
          if(!$loadingBar){

            // Define loading bar element
            $loadingBar = $('<div></div>').addClass(params.loaderClass);

            // Prepend the loading bar in its parent
            if($parentSelector !== undefined && $parentSelector.length){
              $parentSelector.prepend($loadingBar);
            }

            // Set the css "position" property as "relative" of the loader if needed
            if(needRelativeParent){
              $parentSelector.css("position", "relative");
            }
          }
        }

        // Log counter element in the loading bar : useful to show the number of time a loading bar has been call
        function logCounter(nbCall){
          if(window && window.console){
            var idAttr    = $parentSelector.attr("id");
            var classAttr = $parentSelector.attr("class");
            var params    = [];
            if(idAttr    != ""){params.push("#"+idAttr);}
            if(classAttr != ""){params.push("."+classAttr);}
            console.log("[jquery.nimble.loader] -> $("+params.join(" ")+").logCounter : "+nbCall);
          }
        }

        // Decrease the call counter and change the debug display if needed
        function decreaseCounter(){
          var ret = -1;
          if(countNbCall > 0){
            countNbCall--;
            ret = countNbCall;
          }
          if(debug){logCounter(ret);}
          return ret;
        }

        // Increase the call counter and change the debug display if needed
        function increaseCounter(){
          countNbCall++;
          if(debug){logCounter(countNbCall);}
          return countNbCall;
        }

        // Check if there is an action to do in the callStack and do the one of the top of the stack
        function callStack(){
          if(waitForAnimation.callStack.length > 0){
            if(!waitForAnimation.isAnimated) {
              var actionToDo = waitForAnimation.callStack.pop();

              if(actionToDo == "hideLoading"){
                processHide();
              }
              else if(actionToDo == "showLoading"){
                processShow();
              }
            }
          }
        }

        function showLoading() {
          unshiftAction("showLoading");
        }
        function hideLoading() {
          unshiftAction("hideLoading");
        }

        function unshiftAction(action){
          waitForAnimation.callStack.unshift(action);
          callStack();
        }

        // Show the loading bar element
        function processShow(){
          if(increaseCounter() == 1) { // Check if we have to show the loader it's the first
            initLoading();

            // We set a param to know that the animation to hide has begin
            waitForAnimation.isAnimated = true;
            $loadingBar.fadeIn(speed, function(){

              // We set a param to know that the animation to show is finished
              waitForAnimation.isAnimated   = false;

              // During destroying, calls can be made to show the loader. So we let's the loader disappear and then we show it again
              callStack();

            });
          }
          else{
            callStack();
          }
        }

        // Hide the loading bar element
        function processHide(){
          // Check if we have to destroy the loader (it happens when the counter is equal to 0)
          if(decreaseCounter() == 0){ // If countNbCall == 0 decreaseCounter() returns -1

            // We set a param to know that the animation to hide has begin
            waitForAnimation.isAnimated = true;

            // We animate the loader to make it disappear
            $loadingBar.fadeOut(speed, function(){

              // We set a param to know that the animation to hide is finished
              waitForAnimation.isAnimated = false;

              // We destroy the loader
              destroyLoading();

              // During destroying, calls can be made to show the loader. So we let's the loader disappear and then we show it again
              callStack();
            });
          }
          else{
            callStack();
          }
        }

        // Destroy the loading bar element
        function destroyLoading(){
          // Remove the HTML element
          $loadingBar.remove();
          // Re-init the loading bar to force a re-initialisation at its next call
          $loadingBar = undefined;
        }

        // Body of the closure function
        return  {
          showLoading : showLoading,
          hideLoading : hideLoading,
          init        : initLoading
        };

      }
      
    }
  });

  $.extend($.fn.nimbleLoader,{
    settings:{
      loaderClass        : "loading_bar",
      debug              : false,
      speed              : 'fast',
      needRelativeParent : true
    },
    setSettings: function(options){
      $.extend($.fn.nimbleLoader.settings, options);
    }
  });

})(jQuery);


