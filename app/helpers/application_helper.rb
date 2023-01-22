module ApplicationHelper
  # ￥priceで表示する
  def to_total_currnecy(price)
    number_to_currency(price, unit:'￥', strip_insignificant_zeros: true)
  end
  
  def add_items_title
    if @title.present?
      "#{@title}一覧"
    else
      "商品一覧"
    end
  end
end
