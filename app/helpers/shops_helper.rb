module ShopsHelper
  def stuck_class(stuck)
    base_class = "well"
    (stuck) ?  "#{base_class}" : "#{base_class} clickable-shop"
  end
end
