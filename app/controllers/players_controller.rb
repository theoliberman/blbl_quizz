class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy select authenticate]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show; end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit; end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select
    if @player.is_admin
      respond_to do |format|
        format.js {}
      end
    else
      session[:player_id] = @player.id
      respond_to do |format|
        format.html { redirect_to root_url, notice: "You have selected #{@player.name}" }
        format.json { head :no_content }
      end
    end
  end

  def logout
    session[:player_id] = nil
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'You have been disconnected' }
      format.json { head :no_content }
    end
  end

  def authenticate
    session[:player_id] = params[:password] == 'password' ? @player.id : nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: notice }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.unscoped.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:name, :points)
  end
end
