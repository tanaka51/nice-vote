class SessionsController < ApplicationController
  before_action :set_vote

  def new
  end

  def create
    if @vote.password == params[:password]
      session["vote_#{@vote.id}"] = true

      return_to_url = session[:return_to] || url_for(@vote)
      session[:return_to] = nil

      redirect_to return_to_url
    else
      render :new
    end
  end

  private

  def set_vote
    @vote = Vote.find_by!(uuid: params[:vote_id])
  end
end
