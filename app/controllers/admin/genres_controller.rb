class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def create
      @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを追加しました！"
      redirect_back(fallback_location: admin_genres_path)
    else
      @genres=Genre.all
      render :index
    end
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path(@genre.id)
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
