# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Enable closing modal popup when clicking on background on mobile devices
$(document).on 'click tap touchstart', '.reveal-modal-bg', ->
  if $(document).width() < 600
    $('[data-reveal]').foundation('reveal', 'close')
  return 

# Load masonry and resize grid if necessary
$(window).load ->
  if getURL('movies') or getURL('filmschools') or getURL('club_movies')
    masonry()
    resize_grid()
  return

$(document).on 'page:change page:load', ->
  if getURL('movies') or getURL('filmschools') or getURL('club_movies')
    masonry()
    resize_grid()
  return

# Delay to make sure masonry loads properly
masonry = ->
  setTimeout (->
    $('#masonry-container').masonry ->
    itemSelector: '.item',
    isFitWidth: true
    return
  ), 500

resize_grid = ->
  if $(document).width() > 1700
    $('.large-block-grid-3').addClass('large-block-grid-4')
  else
    $('.large-block-grid-3').removeClass('large-block-grid-4')

# Extract and format URL 
getURL = (param) ->
  pathname = window.location.pathname.split( '/' )
  if param == pathname[1]
    return true
  else
    return false