class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_access_right
    unless @vote
      Rails.logger.warn "Should not reach! @vote has nothing"

      redirect_to root_path
    end

    unless session["vote_#{@vote.id}"]
      session[:return_to] = request.original_url

      redirect_to new_vote_session_path(vote_id: @vote.uuid)
    end
  end
end
