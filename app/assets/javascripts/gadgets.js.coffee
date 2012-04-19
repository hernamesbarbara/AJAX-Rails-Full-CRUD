x = $(document).ready ->
  $("a#new-gadget").click (event) ->
    event.preventDefault()
    $form=$("#new-gadget-form")
    $form.fadeIn(300)
    
  $("a#cancel").click (event) ->
    event.preventDefault()
    $form=$("#new-gadget-form")
    $form.hide()