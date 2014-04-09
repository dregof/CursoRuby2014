module CategoriesHelper

  def category_link(category = Category.new(name: "todas", key: "todas"))
    content_tag :li do
      link_to "Ver #{category.name}", categories_url(category.key)
    end
  end

  def categories_link
    html = category_link
    Category.all.collect { |category|
      html += category_link(category)
    }
    html
  end
end
