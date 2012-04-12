// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .

  //this method will toggle an individual 
  //checkbox between checked and unchecked
  $(function() {
    return $(".checkbox").click(function() {
      var $checkbox = $(this)[0];
      if ($checkbox.checked === true) {
        return $($checkbox).attr("checked", "checked");
      } else {
        return $($checkbox).removeAttr("checked");
      }
    });
  });

  //this method will toggle ALL checkboxes 
  //from checked to unchecked
  $(function() {
    return $("#check-all").click(function() {
      if ($(this).attr("checked") != null) {
        var $all = $(':checkbox');
        return $.each($($all), function(index, box) {
          var $box=$(box);
          return $box.attr("checked", "checked");
        });
      } else {
          var $all = $(':checkbox');
          return $.each($($all), function(index, box) {
          var $input;
            var $box=$(box);
          return $box.removeAttr('checked');
        });
      }
    });
  });