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
end
