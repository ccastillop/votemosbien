module ApplicationHelper
  include Pagy::Frontend

  def alert_class_for flash_type
    { success: "success", error: "error", alert: "alert", notice: "success", success_new: "success_new" }[flash_type.to_sym] || flash_type.to_s
  end

  def edit_buttons(object)
    render "shared/manipulate_buttons", object: object
  end

  def new_button(klass, options = {})
    render "shared/new_button", klass: klass
  end
end