class ApplicationController < ActionController::Base
  skip_forgery_protection

  helper_method :current
  helper_method :admin

  def current
    Player.unscoped.find_by(id: session[:player_id])
  end

  def admin
    Player.unscoped.where(is_admin: true).first
  end

  protected

  def select_player!
    redirect_to players_path, notice: 'Select a player' if current.nil?
  end

  def admin!
    redirect_to players_path, notice: 'Not authorized' unless current&.is_admin
  end
end
