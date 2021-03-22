class PartiesController < ApplicationController
  before_action :only_admin!, except: %i[ index show ]
  before_action :set_party, only: %i[ show edit update destroy ]

  # GET /parties or /parties.json
  def index
    @parties = Party.order(:name)
  end

  # GET /parties/1 or /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties or /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: "Partido creado." }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1 or /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: "Partido actualizado." }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1 or /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: "Partido eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def party_params
      params.require(:party).permit(:name, :logo)
    end
end
