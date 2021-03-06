class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :check_admin!, except: [:create]

  respond_to :html

  def index
    @uploads = Upload.all
    respond_with(@uploads)
  end

  def show
    respond_with(@upload)
  end

  def new
    @upload = Upload.new
    respond_with(@upload)
  end

  def edit
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.club_id = current_user.club_id unless current_user.access == 2
    @upload.save
    redirect_to :back
  end

  def update
    @upload.update(upload_params)
    respond_with(current_user.club)
  end

  def destroy
    @upload.destroy
    redirect_to :back
  end

  private
    def set_upload
      @upload = Upload.find(params[:id])
    end

    def upload_params
      params.require(:upload).permit(:club_id, :image)
    end
end


