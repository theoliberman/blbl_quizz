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
    redirect_to '/questions/' + state.rank.to_s
  end

  def reset
    State.first.update(rank: 0)
    Player.all.each do |player|
      player.update(points: 0)
    end
    Answer.delete_all
    redirect_to root_path
  end

  def rank
    respond_to do |format|
      format.json { render json: State.first.rank }
    end
  end
end
