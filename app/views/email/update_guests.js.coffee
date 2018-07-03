$("#guest_select").empty()
  .append("<%= escape_javascript(render(:partial => @guests)) %>")
$("#guest_select").trigger("change")
