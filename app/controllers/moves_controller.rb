class MovesController < ApplicationController
  before_action :set_move, only: [:show, :update, :destroy]

  # GET /moves
  # GET /moves.json
  def index
    @moves = Move.all

    render json: @moves
  end

  # GET /moves/1
  # GET /moves/1.json
  def show
    render json: @move
  end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(move_params)

    if @move.save
      render json: @move, status: :created, location: @move
    else
      render json: @move.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /moves/1
  # PATCH/PUT /moves/1.json
  def update
    @move = Move.find(params[:id])

    if @move.update(move_params)
      head :no_content
    else
      render json: @move.errors, status: :unprocessable_entity
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
    @move.destroy

    head :no_content
  end

  private

    def set_move
      @move = Move.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:name, :type, :pp, :power, :accuracy, :effect)
    end
end
