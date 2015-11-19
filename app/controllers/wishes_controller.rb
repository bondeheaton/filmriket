class WishesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_admin!, only: [:index]

  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wishes_params)
    @wish.user_id = current_user.id
    @wish.save
    redirect_to :back
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy
    redirect_to :back
  end

  private

  def wishes_params
    params.require(:wish).permit(:message, :user_id)
  end
end
