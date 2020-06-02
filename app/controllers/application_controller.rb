class ApplicationController < ActionController::Base
  helper_method :current

  def current
    Player.find_by(id: session[:player_id])
  end

  protected

  def select_player!
    redirect_to players_path, notice: 'Select a player' if current.nil?
  end
end
