class WelcomeController < ApplicationController
  before_action :select_player!, only: %i[next reset]

  def index
    @rank = State.first.rank
    @max = Question.maximum('rank')
    redirect_to players_path, notice: 'Choose a player' unless current
  end

  def next
    state = State.first
    state.update(rank: state.rank + 1)
    question = Question.find_by(rank: state.rank)
    redirect_to question
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
