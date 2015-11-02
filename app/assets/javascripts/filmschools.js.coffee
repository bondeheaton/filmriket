# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.close-movie-modal', ->
  $('#filmschool-modal').foundation('reveal', 'close')

$(document).on 'click', '.testt', ->
  setTimeout (->
    bigscreen()
  ), 1000

bigscreen = ->
  if $(document).width() > 1200 and $(document).width() < 1700
    $('#iframe-id').width(375).height(250)
  else if $(document).width() > 1700
    $('#iframe-id').width(375).height(275)
