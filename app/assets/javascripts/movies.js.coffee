# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.close-movie-modal', ->
  $('#movie-modal').foundation('reveal', 'close')

$(window).load ->
  masonry()
  bigscreen()

$(document).on 'ready page:load', ->
  masonry()
  bigscreen()

masonry = ->
  setTimeout (->
    $('#masonry-container').masonry ->
    itemSelector: '.item',
    isFitWidth: true
    return
  ), 200

bigscreen = ->
  if $(document).width() > 1700
    $('.large-block-grid-3').addClass('large-block-grid-4')
  else
    $('.large-block-grid-3').removeClass('large-block-grid-4')

