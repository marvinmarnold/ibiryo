module SearchbarHelper
  def food_scope?
    not hotels_scope?
  end

  def hotels_scope?
    params[:scope] == "hotels"
  end

  def hotel_date(time)
    time.strftime("%m/%d/%y")
  end
end
