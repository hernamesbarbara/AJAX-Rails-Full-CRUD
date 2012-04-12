$(document).ready ->
  $("a#new-widget").click (event) ->
    event.preventDefault()
    $form=$("#new-widget-form")
    $form.fadeIn(300)
    
  $("a#cancel").click (event) ->
    event.preventDefault()
    $form=$("#new-widget-form")
    $form.hide()

