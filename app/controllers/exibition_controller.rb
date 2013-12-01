class ExibitionController < ApplicationController
  
  def create
    @photo = Photo.find(params[:photo])
    @name = @photo.tags.map(&:name).join(',')
    @exibition = Exibition.new(:name => @name, :price => @photo.price, :image_id => @photo.id)

    respond_to do |format|
      if @exibition.save
        format.html { redirect_to @exibition, alert: 'Photo added for exibition' }
        format.json { render json: @exibition, status: :created, location: @exibition  }
      else
        format.json { render json: @exibition.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
end
