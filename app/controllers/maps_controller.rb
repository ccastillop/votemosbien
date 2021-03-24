class MapsController < ApplicationController
  def show
    @value_x = params[:x] || Random.new.rand(20)
    @value_y = params[:y] || Random.new.rand(20)
    @parties = []
    Party.all.each do |party|
      if (answer = party.answer) && answer.completed?
        @parties << OpenStruct.new(
            thumb_url: helpers.thumb_url(party.logo),
            x: answer.value_x * 5,
            y: answer.value_y * 5,
            party_url: helpers.url_for(party)
          )
      end
    end
  end
end
