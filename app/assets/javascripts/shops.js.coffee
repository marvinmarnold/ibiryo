# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#shop_ownership_attributes_user_id').chosen()
  $('.clickable-shop').click ->
    shop_id = objIDOnly $(this).attr("id")
    window.location.href = "http://localhost:5000/shops/" + shop_id
