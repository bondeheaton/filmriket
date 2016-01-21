class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :check_admin!, except: [:index]
  respond_to :html

  def index
    @news = News.paginate(:page => params[:page], :per_page => 3).order(id: :desc)
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
    redirect_to news_index_path
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
      params.require(:news).permit(:title, :img, :content, :category, :newsdate)
    end
end
