class Admin::ItemsController < ApplicationController
    def index
     @item = Item.all
    end
    
    def new
     @item = Item.new
    end
    
    def create
        @item = Item.new(admin_item_params)
        @item.genre_id = @item.id
        @item.save
        redirect_to admin_items_path
    end
    
  private

  def admin_item_params
    params.require(:item).permit(:name, :introduction, :genre, :price, :is_active, :image)
  end
  
end
