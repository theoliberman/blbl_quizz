class WelcomeController < ApplicationController
  before_action :select_player!, only: [:next, :reset]

  def index
    @rank = State.first.rank
    @max = Question.maximum('rank')
    if current&.is_admin
      render 'admin'
    else
      render 'index'
    end
  end

  def next
    rank = State.first.rank
    State.first.update(rank: rank + 1)
    redirect_to root_path
  end

  def reset
    State.first.update(rank: 0)
    redirect_to root_path
  end

  def rank
    respond_to do |format|
      format.json { render json: State.first.rank }
    end
  end
end
