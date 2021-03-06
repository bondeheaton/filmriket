# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Navigation for admin log on mobile
$(document).on 'click', '#to_top', ->
  $('html, body').animate({ scrollTop: 0 }, 'fast');
  return

$(document).on 'click', '#to_reviews', ->
  $('html, body').animate({ scrollTop: $('#reviews').offset().top }, 'fast');
  return

$(document).on 'click', '#to_clubmovies', ->
  $('html, body').animate({ scrollTop: $('#clubmovies').offset().top }, 'fast');
  return

$(document).on 'click', '#to_comments', ->
  $('html, body').animate({ scrollTop: $('#comments').offset().top }, 'fast');
  return

$(document).on 'click', '#to_uploads', ->
  $('html, body').animate({ scrollTop: $('#uploads').offset().top }, 'fast');
  return  

# Enable sticky menu for admin log on mobile
$(window).scroll ->
  scroll = $(window).scrollTop()
  if scroll >= window.innerHeight - 200
    $('#menu').addClass 'fixed'
  else
    $('#menu').removeClass 'fixed'
  return

btn = false
$(document).on "click", ".btn", ->
  if btn
    $('.sidebar').hide()
    btn = false
  else
    $('.sidebar').show()
    btn = true
  return

# Layout fix for larger mobile devices
$(window).on 'orientationchange', ->
  if $('.menu-btn').is(":visible")
    $('#js-fix').removeClass('medium-10')
    $('#js-fix').addClass('medium-12')
  else
    $('#js-fix').removeClass('medium-12')
    $('#js-fix').addClass('medium-10')

$(document).on 'ready page:load', ->
  if $('.menu-btn').is(":visible")
    $('#js-fix').removeClass('medium-10')
    $('#js-fix').addClass('medium-12')

# Resize google map popup to prevent it from being grey 
$(document).on 'click', '.link-fix', ->
  center = handlerr.getMap().getCenter()
  setTimeout (->
    google.maps.event.trigger handler.getMap(), 'resize'
    handler.map.centerOn(center)
    return
  ), 200
  
$(document).on 'click', '#competition', ->
  result = []
  score = 0
  i=0
  while i<questions
    value = $('input[name=' + i + ']:checked', '#competition-form').val()
    if value == 'true'
      score++
    result.push value
    i++
  $("#competition_result_user_id").val(user_id)
  $("#competition_result_competition_id").val(competition_id)
  $("#competition_result_score").val(score)
  $("#competition_result_email").val($('input[name=email]').val())
  $('#competition').hide()
  alert('Du fick ' + score + ' av ' + result.length + ' rätt!')
  i = 0
  while i<questions
    $('input[name=' + i + '][value="true"]', '#competition-form').parent().css("color", "lightgreen")
    $('input[name=' + i + '][value="true"]', '#competition-form').parent().css("text-decoration", "underline")
    i++
  
  