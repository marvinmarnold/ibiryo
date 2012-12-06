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

  def food_sort_options
    [
      [t("searchbar.food.sort.newest"), 1],
      [t("searchbar.food.sort.popular"), 2],
      [t("searchbar.food.sort.name"), 3],
      [t("searchbar.food.sort.name_reverse"), 4]
    ]
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
