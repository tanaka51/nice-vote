class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vote, notice: 'Vote was successfully created.'
    else
      render :new
    end
  end

  private

  def set_vote
    @vote = Vote.find_by!(uuid: params[:id])
  end

  def vote_params
    params.require(:vote).permit(:title, :description, :password, :closed)
  end
end
