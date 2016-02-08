# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  if getURL('club_movies')
    masonry()
    bigscreen()
  return

$(document).on 'page:change page:load', ->
  if getURL('club_movies')
    masonry()
    bigscreen()
  return

masonry = ->
  setTimeout (->
    $('#masonry-container').masonry ->
    itemSelector: '.item',
    isFitWidth: true
    return
  ), 500

# Change grid on full hd screens
bigscreen = ->
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