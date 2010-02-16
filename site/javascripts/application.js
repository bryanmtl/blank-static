(function($) {

  // Google  
  $(function() {

    function addWatermark() {
      if ($('#cse-search-box input.text').val() == '') {
        $('#cse-search-box input.text').css("background-image", "url(http://www.google.com/coop/intl/en/images/google_custom_search_watermark.gif)");
      };  
    }

    addWatermark();

    $("#cse-search-box input.text").bind('focus', function(event) {
      $("#cse-search-box input.text").css("background-image", "none" );
    });

    $("#cse-search-box input.text").bind('blur', function(event) {
      addWatermark();
    });

  });
    
}) (jQuery);