# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'ready page:load', ->
  $('.pagination a').click ->
    $.get @href, null, null, 'script'
    false
  return

$(window).on 'orientationchange', ->
  tabletfix()

$(document).on 'ready page:load', ->
  tabletfix()

tabletfix = ->
  if $(document).width() > 760 and $(document).width() < 800
    $('.tablet-fix').addClass('medium-centered')
  else
    $('.tablet-fix').removeClass('medium-centered')