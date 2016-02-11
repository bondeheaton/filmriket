class PressesController < ApplicationController
  before_action :set_press, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin!

  respond_to :html

  def index
    @presses = Press.all
    respond_with(@presses)
  end

  def show
    respond_with(@press)
  end

  def new
    @press = Press.new
    respond_with(@press)
  end

  def edit
  end

  def create
    @press = Press.new(press_params)
    @press.save
    # Save first for uploaded file to move from temp to the right place
    unless @press.text_file.url.nil?
      @press.link = "http://filmriket.nu" + @press.text_file.url
    end
    @press.save
    redirect_to presses_path
  end

  def update
    @press.update(press_params)
    unless @press.text_file.url.nil?
      @press.link = "http://filmriket.nu" + @press.text_file.url
    end
    @press.save
    redirect_to presses_path
  end

  def destroy
    @press.destroy
    respond_with(@press)
  end

  private
    def set_press
      @press = Press.find(params[:id])
    end

    def press_params
      params.require(:press).permit(:text, :link, :text_file, :press_date)
    end
end
