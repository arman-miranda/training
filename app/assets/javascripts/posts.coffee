# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('[data-toggle="tooltip"]').tooltip()
  $('#post_btn').prop('disabled', true);
  $('#post_post').keyup ->
  $('#post_post').keyup ->
    $('#post_btn').prop 'disabled', if @value == '' then true else false
    return
