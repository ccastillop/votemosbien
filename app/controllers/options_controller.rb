class OptionsController < ApplicationController
  before_action :set_question
  before_action :set_option, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  # GET /options or /options.json
  def index
    @options = @question.options.all
  end

  # GET /options/1 or /options/1.json
  def show
  end

  # GET /options/new
  def new
    @option = @question.options.new
    authorize(@option)
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options or /options.json
  def create
    @option = @question.options.new(option_params)
    authorize(@option)
    respond_to do |format|
      if @option.save
        format.html { redirect_to question_options_url(@option.question), notice: "Option was successfully created." }
        format.json { render :show, status: :created, location: question_options_url(@option.question) }
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
        format.html { redirect_to question_options_url(@option.question), notice: "Option was successfully updated." }
        format.json { render :show, status: :ok, location: question_options_url(@option.question) }
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
      format.html { redirect_to question_options_url(@option.question), notice: "Option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find_by(id: params[:question_id])
    end
    
    def set_option
      @option = Option.find(params[:id])
      authorize(@option)
    end

    # Only allow a list of trusted parameters through.
    def option_params
      params.require(:option).permit(:name, :description, :value_x, :value_y)
    end
end
