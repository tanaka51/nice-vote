class AnswersController < ApplicationController
  before_action :set_vote
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :check_vote, only: [:edit, :create, :update]
  before_action :require_access_right, only: [:index, :destroy]

  def index
    @answers = @vote.answers
  end

  def show
  end

  def new
    @answer = @vote.answers.build
    @vote.items.each do |item|
      @answer.items.build(vote_item: item)
    end
  end

  def edit
    exists_vote_item_ids = @answer.items.pluck(:vote_item_id)
    @vote.items.each do |item|
      @answer.items.build(vote_item: item) unless exists_vote_item_ids.include?(item.id)
    end
  end

  def create
    @answer = @vote.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@vote, @answer], notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to [@vote, @answer], notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to vote_answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_vote
    @vote = Vote.find_by!(uuid: params[:vote_id])
  end

  def set_answer
    @answer = @vote.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:user_name, :comment, items_attributes: [:id, :vote_item_id, :rank])
  end

  def check_vote
    return unless @vote.closed

    if @answer
      redirect_to [@vote, @answer]
    else
      redirect_to action: :new
    end
  end
end
