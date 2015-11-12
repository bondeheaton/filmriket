# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

$(document).on 'click', '#book_button', ->
  $('#book_button').html('Filmen är nu bokad!')