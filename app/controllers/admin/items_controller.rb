class Admin::ItemsController < ApplicationController
    def index
        @item = Item.page(params[:page])
    end
    
    def new
        @item = Item.new
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(admin_params)
        redirect_to admin_item_path(@item)
    end
    
    def create
        @item = Item.new(admin_params)
        @item.genre_id = @item.id
        @item.save
        redirect_to admin_items_path
    end
    
  private

  def admin_params
    params.require(:item).permit(:name, :introduction, :genre, :price, :is_active, :image)
  end
  
end
