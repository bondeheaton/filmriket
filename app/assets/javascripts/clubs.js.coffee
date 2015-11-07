# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('#thumbs a').touchTouch();


$(document).on 'click', '.seen-movies-link', ->
  setTimeout (->
    $('#masonry-container-club').masonry ->
      itemSelector: '.item',
      isFitWidth: true
    return
  ), 200

$(document).on 'click', '.club-movies-reviews-link', ->
  setTimeout (->
    $('#masonry-container-club-movies-reviews').masonry ->
      itemSelector: '.item',
      isFitWidth: true
    return
  ), 500




$(document).on 'click', '.test-link', ->
  $('#seen-movies').foundation 'reveal', 'close'
  $('#movie-modal').html "<%= render '/movies/show' %>"
  $('#movie-modal').foundation 'reveal', 'open'

