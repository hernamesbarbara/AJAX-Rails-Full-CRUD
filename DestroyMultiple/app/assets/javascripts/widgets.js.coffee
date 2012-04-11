$(document).ready ->
  $("a#new-widget").click (event) ->
    event.preventDefault()
    $form=$("#new-widget-form")
    $form.fadeIn(1000)

$(document).ready ->
  $(".edit-widget a").click (event) ->
    event.preventDefault()
    $link=$(this)

    $row=$($link.parent().parent())
    id=$row[0].id
    element_name="widget_"+id
    
    row_to_hide=$("tr[name=" + element_name + "]")

    $(row_to_hide).prepend("<%= #{escape_javascript(render :partial => 'widgets/edit')}%>")
    $.each $($($(row_to_hide)).children()), (i, e) ->
      $(e).hide()
      

#$('#widgets-table tr:last').before("<%= #{escape_javascript(render :partial => 'widgets/widget', :object => @widget)}%>");

#$.each $(".checkbox:checked"), (index, checkbox) ->