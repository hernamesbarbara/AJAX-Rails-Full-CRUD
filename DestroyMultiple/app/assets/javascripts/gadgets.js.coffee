# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#this method will toggle an individual 
#checkbox between checked and unchecked
$ ->
  $(".checkbox").click ->
    $checkbox = $(this)[0]
    if $checkbox.checked is true
      $($checkbox).attr "checked", "checked"
    else
      $($checkbox).removeAttr "checked"

#this method will toggle ALL checkboxes 
#from checked to unchecked
$ ->
  $("#check-all").click ->
    if $(this).attr("checked")?
      $all = $(":checkbox")
      $.each $($all), (index, box) ->
        $box = $(box)
        $box.attr "checked", "checked"
    else
      $all = $(":checkbox")
      $.each $($all), (index, box) ->
        $input = undefined
        $box = $(box)
        $box.removeAttr "checked"