class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album
 
  def index
    @photos=@album.photos
    @photo = @album.photos.build
  end

  def new
    @photo=@album.photos.build
  end

  def create
    @photo=@album.photos.build(photo_params)

    if @photo.save
      redirect_to album_photos_path(@album),notice: "Photos uploaded successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy_image
    album=current_user.albums.find(params[:album_id])
    photo=album.photos.find(params[:id])
    image=photo.images.find(params[:image_id])
    image.purge

    redirect_back fallback_location: album_photos_path(album)
  end

  private

  def set_album
    @album=current_user.albums.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:title,images:[])
  end
end



