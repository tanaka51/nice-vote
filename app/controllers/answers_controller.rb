class AnswersController < ApplicationController
  before_action :set_vote
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @vote.items.each do |item|
      @answer.items.build(vote_item: item)
    end
  end

  # GET /answers/1/edit
  def edit
    exists_vote_item_ids = @answer.items.pluck(:vote_item_id)
    @vote.items.each do |item|
      @answer.items.build(vote_item: item) unless exists_vote_item_ids.include?(item.id)
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

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

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
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

  # DELETE /answers/1
  # DELETE /answers/1.json
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
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:user_name, :comment, items_attributes: [:id, :vote_item_id, :rank])
  end
end
