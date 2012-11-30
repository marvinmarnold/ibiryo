# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  adjustCartForm()

adjustCartForm = () ->
  $("#cart_billed_method_cash").click ->
    $("#credit-card").hide()
    $("#paypal-checkout").hide()
    $("#standard-checkout").show()
  $("#cart_billed_method_credit_card").click ->
    $("#credit-card").show()
    $("#paypal-checkout").hide()
    $("#standard-checkout").show()
  $("#cart_billed_method_paypal_express").click ->
    $("#credit-card").hide()
    $("#paypal-checkout").show()
    $("#standard-checkout").hide()
