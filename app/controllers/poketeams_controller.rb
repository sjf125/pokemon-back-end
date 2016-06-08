class PoketeamsController < ProtectedController
  before_action :set_poketeam, only: [:show, :update, :destroy]

  # GET /poketeams
  # GET /poketeams.json
  def index
    @poketeams = Poketeam.all

    render json: @poketeams
  end

  # GET /poketeams/1
  # GET /poketeams/1.json
  def show
    render json: @poketeam
  end

  # POST /poketeams
  # POST /poketeams.json
  def create
    @poketeam = Poketeam.new(poketeam_params)

    if @poketeam.save
      render json: @poketeam, status: :created, location: @poketeam
    else
      render json: @poketeam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /poketeams/1
  # PATCH/PUT /poketeams/1.json
  def update
    @poketeam = Poketeam.find(params[:id])

    if @poketeam.update(poketeam_params)
      head :no_content
    else
      render json: @poketeam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /poketeams/1
  # DELETE /poketeams/1.json
  def destroy
    @poketeam.destroy

    head :no_content
  end

  private

    def set_poketeam
      @poketeam = Poketeam.find(params[:id])
    end

    def poketeam_params
      params.require(:poketeam).permit(:slot1, :slot2, :slot3, :slot4, :slot5, :slot6, :has_one)
    end
end
