class QuestionsController < ApplicationController
  before_action :select_player!
  before_action :set_question, only: %i[show edit update destroy check]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @rank = State.first.rank
    @max = Question.maximum('rank')
    @players = Player.all.order(points: :desc)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check
    @answer = params[:answer] || ''
    @players = Player.all.order(points: :desc).to_a
    @player = Player.unscoped.find(params[:player])
    Answer.create(player: @player, question: @question, answer: @answer)
    respond_to do |format|
      format.js {}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = params[:rank] ? Question.find_by(rank: params[:rank]) : Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:body, :a, :b, :c, :d, :answer, :rank)
  end
end
