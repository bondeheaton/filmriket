class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :check_admin!, only: [:edit, :update, :destroy]
  respond_to :html

  def index
    @news = News.paginate(:page => params[:page], :per_page => 1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
      format.js
    end
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    respond_with(@news)
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    respond_with(@news)
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :content, :category)
    end
end
