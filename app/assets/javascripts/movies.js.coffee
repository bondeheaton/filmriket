# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.close-movie-modal', ->
  $('#movie-modal').foundation('reveal', 'close')


$(window).load ->
  $('#masonry-container').masonry ->
    itemSelector: '.item',
    isFitWidth: true
  return
