# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $(".new_booking").on("ajax:success", (e, data, status, xhr) ->
	  alert 'Filmen är bokad!'
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_booking").append "error"


$(document).on 'ready page:load', ->
  $('.bookings_box .access').click (e) ->
    e.preventDefault()
    $.ajax
      url: $(this).attr('href')
      method: 'PUT'
      success: ->
    return
  return

$(document).on 'ready page:load', ->
  $('.footable').footable()
  return
