# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
readyfunc = ->
  $(document).on 'change', '#group_select', (evt) ->
    $.ajax 'update_guests',
      type: 'GET'
      dataType: 'script'
      data: {
        id: $("#group_select option:selected").val()
      }
  $(document).on 'change', '#guest_select', (evt) ->
    $.ajax 'update_guest_form',
      type: 'GET'
      dataType: 'script'
      data: {
        id: $("#guest_select option:selected").val()
      }
$(document).ready(readyfunc)
$(document).on('tubolinks:load', readyfunc)
