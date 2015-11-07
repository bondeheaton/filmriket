class FilmschoolsController < ApplicationController
  before_action :set_filmschool, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @filmschools = Filmschool.all
    respond_with(@filmschools)
  end

  def show
    @filmschool = Filmschool.find(params[:id])
    @filmschool_comment = FilmschoolComment.new
    @filmschool_comments = FilmschoolComment.where("filmschool_id = ?", params[:id]).reverse
    respond_to do |format|
      format.js
    end
  end

  def new
    @filmschool = Filmschool.new
    respond_with(@filmschool)
  end

  def edit
  end

  def create
    @filmschool = Filmschool.new(filmschool_params)
    @filmschool.save
    respond_with(@filmschool)
  end

  def update
    @filmschool.update(filmschool_params)
    respond_with(@filmschool)
  end

  def destroy
    @filmschool.destroy
    respond_with(@filmschool)
  end

  private
    def set_filmschool
      @filmschool = Filmschool.find(params[:id])
    end

    def filmschool_params
      params.require(:filmschool).permit(:title, :description, :videolink)
    end
end