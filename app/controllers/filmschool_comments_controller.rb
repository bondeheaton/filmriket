class FilmschoolCommentsController < ApplicationController
  before_action :set_filmschool_comment, only: [:show, :edit, :update, :destroy]

  respond_to :js, :html, :json

  def index
    @filmschool_comments = FilmschoolComment.all
    respond_with(@filmschool_comments)
  end

  def show
    respond_with(@filmschool_comment)
  end

  def new
    @filmschool_comment = FilmschoolComment.new
    respond_with(@filmschool_comment)
  end

  def edit
  end

  def create
    @filmschool_comment = FilmschoolComment.new(filmschool_comment_params)
    @filmschool_comment.user_id = current_user.id
    @filmschool_comment.save
    @filmschool_comments = Filmschool.find(@filmschool_comment.filmschool_id).filmschool_comments.order('id DESC')
    respond_to do |format|
      format.js
    end
  end

  def update
    @filmschool_comment.update(filmschool_comment_params)
    respond_with(@filmschool_comment)
  end

  def destroy
    @filmschool_comment.destroy
    respond_with(@filmschool_comment)
  end

  private
    def set_filmschool_comment
      @filmschool_comment = FilmschoolComment.find(params[:id])
    end

    def filmschool_comment_params
      params.require(:filmschool_comment).permit(:message, :user_id, :filmschool_id)
    end
end
