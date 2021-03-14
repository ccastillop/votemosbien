class ApplicationController < ActionController::Base
  include Pundit
  include UserSessionsHelper
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def user_not_authorized
      flash[:alert] = "No está autorizado para realizar esta acción"
      redirect_to(request.referrer || root_path)
    end

  private  
    def authenticate_user!
      unless user_signed_in?
        store_location
        flash[:error] = "Por favor inicia sesión o regístrate."
        redirect_to new_user_session_path
      end
    end

    def only_admin!
      user_not_authorized unless user_signed_in? && current_user.admin?
    end
end
