class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy, :add_question]
  before_filter :check_admin!

  respond_to :html

  def index
    @competitions = Competition.all
    respond_with(@competitions)
  end

  def show
    @question = Question.new
    @answer = Answer.new
    respond_with(@competition)
  end

  def new
    @competition = Competition.new
    respond_with(@competition)
  end

  def edit
  end

  def add_question
    @question = @competition.questions.build(question: params[:question][:question])
    if @question.save
      @question = Question.new
    end
    redirect_to :back
  end
  
  def add_answer
    @question = Question.find(params[:id])
    @answer = @question.answers.build(answer: params[:answer][:answer])
    if @question.save
      @question = Question.new
    end
    redirect_to :back
  end
  
  def destroy_question
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :back
  end
  
  def destroy_answer
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to :back
  end
  
  def mark_correct_answer
    @answer = Answer.find(params[:id])
    @answer.mark_as_correct
    redirect_to :back
  end
  
  def create_child
    @parent = Parent.find(params[:id])
    @child = @parent.children.build(params[:child])
    if @child.save
      @child = Child.new
    end
    render :action => :show
  end
    
  def create
    @competition = Competition.new(competition_params)
    @competition.save
    respond_with(@competition)
  end

  def update
    @competition.update(competition_params)
    respond_with(@competition)
  end

  def destroy
    @competition.destroy
    respond_with(@competition)
  end

  private
    def set_competition
      @competition = Competition.find(params[:id])
    end

    def competition_params
      params.require(:competition).permit(:title, :question)
    end
end