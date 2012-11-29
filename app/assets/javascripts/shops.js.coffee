# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.clickable-shop').click ->
    shop_id = objIDOnly $(this).attr("id")
    window.location.href = $("#sidebar").data("shopurl") + "/" + shop_id
  $(document).click ->
    $('select').filter(->
      @id.match /shop_ownerships_attributes_*/
    ).each (index) ->
      $(this).chosen()
  $(document).click ->
    $('select').filter(->
      @id.match /shop_accountabilities_attributes_*/
    ).each (index) ->
      $(this).chosen()
