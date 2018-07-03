# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
readyfunc = ->
  $(document).on 'change', '#guest_edit_select', (evt) ->
    $.ajax 'guest_grab_info',
      type: 'GET'
      dataType: 'script'
      data: {
        id: $("#guest_edit_select option:selected").val()
      }
$(document).ready(readyfunc)
$(document).on('tubolinks:load', readyfunc)
