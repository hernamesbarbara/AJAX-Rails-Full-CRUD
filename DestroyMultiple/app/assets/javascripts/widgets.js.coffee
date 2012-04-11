$(document).ready ->
  $("a#new-widget").click (event) ->
    event.preventDefault()
    $form=$("#new-widget-form")
    $form.fadeIn(1000)

