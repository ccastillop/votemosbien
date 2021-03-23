module ApplicationHelper
  include Pagy::Frontend

  def alert_class_for flash_type
    { success: "success", error: "error", alert: "alert", notice: "success", success_new: "success_new" }[flash_type.to_sym] || flash_type.to_s
  end

  def edit_buttons(object)
    render "shared/manipulate_buttons", object: object
  end

  def new_button(klass, options = {})
    render "shared/new_button", klass: klass
  end

  def google_analytics_tag
    <<~HEREDOC
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BR8DWGL2RL"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-BR8DWGL2RL');
    </script>
    HEREDOC
  end
end