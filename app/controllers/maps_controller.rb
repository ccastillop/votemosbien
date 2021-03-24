class MapsController < ApplicationController
  def show
    @value_x = params[:x].to_i || Random.new.rand(20)
    @value_y = params[:y].to_i || Random.new.rand(20)
  end
end
