class Public::ItemsController < ApplicationController
  before_action :set_genres

  def index
    if params[:genre_id].present?
      @items = Item.serch_genre(params[:genre_id]).page(params[:page]).per(8)
      @title = params[:genre_name]
    else
      @items = Item.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart = CartItem.new
  end

  private
    def set_genres
      @genres = Genre.all
    end
end
