class MovieCommentsController < ApplicationController
  before_action :set_movie_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @movie_comments = MovieComment.all
    respond_with(@movie_comments)
  end

  def show
    respond_with(@movie_comment)
  end

  def new
    @movie_comment = MovieComment.new
    respond_with(@movie_comment)
  end

  def edit
  end

  def create
    @movie_comment = MovieComment.new(movie_comment_params)
    @movie_comment.save
    respond_with(@movie_comment)
  end

  def update
    @movie_comment.update(movie_comment_params)
    respond_with(@movie_comment)
  end

  def destroy
    @movie_comment.destroy
    respond_with(@movie_comment)
  end

  private
    def set_movie_comment
      @movie_comment = MovieComment.find(params[:id])
    end

    def movie_comment_params
      params.require(:movie_comment).permit(:message, :user_id, :movie_id)
    end
end
