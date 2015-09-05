# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $(".new_booking").on("ajax:success", (e, data, status, xhr) ->
	  $("#book_button").hide();
	  $(this).parent().find("#booked_button").show
	  $("#booked_button").show();
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_booking").append "error"