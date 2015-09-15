# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


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


header = $('#admin_log')
$(window).scroll ->
  scroll = $(window).scrollTop()
  if scroll >= window.innerHeight - 100
    $('#menu').addClass 'fixed'
  else
    $('#menu').removeClass 'fixed'
  return
