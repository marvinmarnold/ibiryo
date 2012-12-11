module SearchbarHelper
  def hotel_date(time)
    time.strftime("%m/%d/%y")
  end

  def browse_food_content
    render "layouts/searchbar/food/browse_content"
  end

  def browse_food_title
    render "layouts/searchbar/food/browse_title"
  end

  def search_view_path
    if food_scope?
      return "food_searches"
    end
  end

  def searching?
    controller.controller_name == "food_searches"
  end
end
