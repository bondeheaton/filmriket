# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Initiate slideshow for club uploaded images
$(document).on 'ready page:load', ->
  $('#thumbs a').touchTouch();

$(document).on 'click', '.seen-movies-link', ->
  masonryLoad('#masonry-container-club')

$(document).on 'click', '.club-movies-reviews-link', ->
  masonryLoad('#masonry-container-club-movies-reviews')

$(document).on 'click', '.club-events-link', ->
  masonryLoad('#masonry-container-club-events')

masonryLoad = (div) ->
  setTimeout (->
    $(div).masonry ->
      itemSelector: '.item',
      isFitWidth: true
      return
  ), 500