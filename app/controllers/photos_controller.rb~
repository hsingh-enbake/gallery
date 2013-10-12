class PhotosController < ApplicationController

  def create
    @folder = Folder.find(params[:folder_id])
    @photo = @folder.photos.create(params[:photo])
    redirect_to folder_path(@folder)
  end
  def show
    @photos = Photos.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @photo }
    end
  end
  def index
    if params[:tag]
      @photos=Photo.tagged_with(params[:tag])
      respond_to do |format|
        format.html
    end
  end
end

end
