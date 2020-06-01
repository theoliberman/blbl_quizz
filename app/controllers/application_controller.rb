class ApplicationController < ActionController::Base
  helper_method :current

  def current
    Player.find_by(id: session[:player_id])
  end
end
