class OptionsController < ApplicationController
  before_action :set_option, only: %i[ show edit update destroy ]

  # GET /options or /options.json
  def index
    @options = Option.all
  end

  # GET /options/1 or /options/1.json
  def show
  end

  # GET /options/new
  def new
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options or /options.json
  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: "Option was successfully created." }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1 or /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: "Option was successfully updated." }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1 or /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: "Option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def option_params
      params.require(:option).permit(:question_id, :name, :description, :value_x, :value_y)
    end
end
