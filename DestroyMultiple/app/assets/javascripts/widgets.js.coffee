$(document).ready ->
  $("a#new-widget").click (event) ->
    event.preventDefault()
    $form=$("#new-widget-form")
    $form.fadeIn(1000)

$(document).ready ->
  $(".edit-widget a").click (event) ->
    event.preventDefault()
    $link=$(this)
    console.log($link.parent())

    $row=$($link.parent().parent())
    id=$row[0].id
    element_name="widget_"+id
    
    row_to_hide=$("tr[name=" + element_name + "]")
    to_show=$(row_to_hide).children('td:hidden')
    to_hide=$(row_to_hide).children('td:visible')
    
    to_show.fadeIn()
    to_hide.fadeOut()