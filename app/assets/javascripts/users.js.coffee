# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Ajax call for user changes for admin control panel
$(document).ready ->
  $('.users_box .access').click (e) ->
    e.preventDefault()
    $.ajax
      url: $(this).attr('href')
      method: 'PUT'
      success: ->
    return
  return

$(document).on 'ready page:load', ->
  $('.footable').footable breakpoints:
    tiny: 100
    medium: 555
    big: 2048