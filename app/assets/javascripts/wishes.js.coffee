# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#wish-link', ->
  $('#wish-message').val('')
  $('.wish-form').toggle()
  windowHeight = $(window).height()
  elementOffset = $('#wish-container').offset().top
  elementHeight = $('#wish-container').height()
  if $(document).width() > 1024
    $('html, body').animate({ scrollTop: elementOffset - windowHeight + elementHeight }, 'fast')
  else
    $("#sidebar").animate({scrollTop:$("#sidebar")[0].scrollHeight}, 'fast')
    #Detta buggar för admin i mobil eftersom de har fler länkar efter önskelådan.

$(document).on 'click', '#wish-button', ->
  $('.wish-notice').show().html('Tack för ditt önskemål!')
  $('.wish-notice').delay(2000).fadeOut('fast')
  $('.wish-form').delay(2000).fadeOut('fast')