class CompetitionResultsController < ApplicationController
  before_action :set_competition_result, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin!, except: [:create]

  respond_to :html

  def index
    @competition_results = CompetitionResult.all
    respond_with(@competition_results)
  end

  def show
    respond_with(@competition_result)
  end

  def new
    @competition_result = CompetitionResult.new
    respond_with(@competition_result)
  end

  def edit
  end

  def create
    @competition_result = CompetitionResult.new(competition_result_params)
    @competition_result.save
    respond_with(@competition_result)
  end

  def update
    @competition_result.update(competition_result_params)
    respond_with(@competition_result)
  end

  def destroy
    @competition_result.destroy
    respond_with(@competition_result)
  end

  private
    def set_competition_result
      @competition_result = CompetitionResult.find(params[:id])
    end

    def competition_result_params
      params.require(:competition_result).permit(:user_id, :competition_id, :score, :answers, :email)
    end
end
