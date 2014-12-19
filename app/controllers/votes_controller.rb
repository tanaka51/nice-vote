class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :require_access_right, only: %i(show update)

  def show
  end

  def new
    @vote = Vote.new
    20.times { @vote.items.build }
  end

  def edit
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      session["vote_#{@vote.id}"] = true

      redirect_to @vote, notice: 'Vote was successfully created.'
    else
      (20 - @vote.items.size).times { @vote.items.build }
      render :new
    end
  end

  def update
    if @vote.update(vote_params_for_update)
      redirect_to @vote
    else
      render :edit
    end
  end

  private

  def set_vote
    @vote = Vote.find_by!(uuid: params[:id])
  end

  def vote_params
    params.require(:vote).
      permit(
        :title,
        :description,
        :password,
        :closed,
        items_attributes: [:name, :addition]
    )
  end

  def vote_params_for_update
    params.require(:vote).
      permit(
        :title,
        :description,
        :password,
        :closed
    )
  end
end
