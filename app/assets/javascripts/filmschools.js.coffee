# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.filmschool-link', ->
  setTimeout (->
    video_size()
  ), 1000

# Change filmschool video size depending on screen size
video_size = ->
  if $(document).width() > 1200 and $(document).width() < 1700
    $('#iframe-id').width(375).height(250)
  else if $(document).width() > 1700
    $('#iframe-id').width(375).height(275)