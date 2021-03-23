class AttachmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[destroy]
  before_action :only_admin!

  def destroy
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @dom_id = "image-#{params[:id]}"
    if @image.attachments.first.present?
      @image.attachments.first.purge
    else
      @image.purge
    end
    respond_to do |format|
      format.js
      format.turbo_stream
    end
  end  
end