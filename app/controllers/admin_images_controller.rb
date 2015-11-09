class AdminImagesController < ApplicationController

  def index
    @admin_images = AdminImage.all.order(id: :desc)
    @admin_image = AdminImage.new
  end

  def create
    @admin_image = AdminImage.new(admin_image_params)
    @admin_image.save
    redirect_to :back
  end

  def destroy
    @admin_image = AdminImage.find(params[:id])
    @admin_image.destroy
    redirect_to :back
  end

  private

  def admin_image_params
    params.require(:admin_image).permit(:img)
  end

end
