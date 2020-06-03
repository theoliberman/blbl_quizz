class WelcomeController < ApplicationController
  def index
    render 'admin' if current&.is_admin
  end
end
