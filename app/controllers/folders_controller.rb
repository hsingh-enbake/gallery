class FoldersController < ApplicationController
  def index
    @folders = current_user.folders.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end
  
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end
    
  def edit
    @folder = Folder.find(params[:id])
  end
  
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to @folder, alert: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @folder = current_user.folders.new(params[:folder])

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, alert: 'Folder was successfully created.' }
        format.json { render json: @folder, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
    
  end
 
 def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @folder }
    end
  end
  
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
      end
  end
  def vote
    @folder = Folder.find(params[:id])
    if params[:type] == "like"
      value = @folder.reputation_for(:like).to_i + 1
      @folder.add_or_update_evaluation(:like, value, current_user)
    else
      value = @folder.reputation_for(:unlike).to_i + 1
      @folder.add_or_update_evaluation(:unlike, value, current_user)
    end  
    redirect_to :back, notice: "Thank you for voting"
  end
end
