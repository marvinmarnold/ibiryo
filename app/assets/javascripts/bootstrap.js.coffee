jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $(window).load ->
    setHeights()
  $(document).click ->
    setHeights()
setHeights = () ->
  max_height = if $("#mainbar").height() > $("#sidebar").height() then $("#mainbar").height() else $("#sidebar").height()
  $("#mainbar").height(max_height)
  $("#sidebar").height(max_height)
  #alert($("#mainbar").height())
