module ApplicationHelper
  def active_class(route)
    current_page?(route) ? "active" : ""
  end
end
