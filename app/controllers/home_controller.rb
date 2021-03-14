class HomeController < ApplicationController
  def show
    params[:page] ||= "index"
    if valid_page?
      render template: "home/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end
  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/home/#{params[:page]}.html.slim"))
  end
end