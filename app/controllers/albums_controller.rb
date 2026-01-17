class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album, only: [:show, :update, :edit, :destroy]

  def index
    #@albums=current_user.albums
    @query = params[:query]
    @albums = current_user.albums.search(@query)
  end

  def new
    @album = current_user.albums.new
  end

  def show
  end

  def update
    if @album.update(album_params)
      @album.tags = @album.tags
      redirect_to albums_path, notice: "Album updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @album = current_user.albums.new(album_params)

    if @album.save
      @album.tags = @album.tags 
      redirect_to albums_path, notice: "Album created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    if @album.destroy
      redirect_to albums_path, notice:"Album deleted successfully"
    end
  end

  private

  def set_album
    @album = current_user.albums.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :description, tags_attributes: [:id, :name, :_destroy])
  end
end