module ApplicationHelper
  def nav_li_link_to(text, path)
    klass = :active if current_page? path
    content_tag(:li, class: klass) do
      link_to text, path
    end
  end
end
