module CartsHelper
  def shopping?
    @cart.present? and
    @cart.shopping? and
    controller.controller_name == "shops" and
    controller.action_name == "show"
  end
end
