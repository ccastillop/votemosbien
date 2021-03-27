module Answereable
  extend ActiveSupport::Concern
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
end