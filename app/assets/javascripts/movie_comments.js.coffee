# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('#new_movie_comment').submit (e) ->
    e.preventDefault()
    $.ajax
      url: $(this).attr('action')
      data: $(this).serialize()
      method: 'POST'
      success: ->
    return
  return
