class AnswersController < ApplicationController
  before_action :set_answerer
  before_action :set_answer

  def new
    render :edit
  end

  def show
  end

  def edit
  end

  def create
    update
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        @answer.answerer&.touch
        format.html { redirect_to [@answerer, @answer], notice: "Tus respuestas han sido actualizadas" }
        format.json { render :show, status: :ok, location: @answer }
        format.turbo_stream do
          @question = Question.find params[:question_id]
          render 'update'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to [@answerer, @answer], notice: "He borrado tus respuestas" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      unless @answerer.present?
        if user_signed_in?
          Answer.where(user_id: nil, session_id: session[:session_id])
            .update_all(user_id: current_user.id)
        end
        @answer = if user_signed_in? && policy_scope(Answer).any?
          policy_scope(Answer).last
        else
          policy_scope(Answer).find_or_initialize_by(session_id: session[:session_id])
        end
      else
        @answer = @answerer.answer || @answerer.build_answer
      end
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer)
        .permit(answer_lines_attributes: [:question_id, :option_id, :id])
    end

    def set_answerer
      @answerer = if params[:candidate_id]
        Candidate.find params[:candidate_id]
      elsif params[:party_id]
        Party.find params[:party_id]
      else
        nil
      end
      authorize(@answerer) if @answerer.present?
    end
end
