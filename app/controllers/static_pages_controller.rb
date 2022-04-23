class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new ENV['flickr_key'], ENV['flickr_secret']
    begin
      @photos = flickr.photos.search user_id: params[:id]
    rescue Flickr::FailedResponse
      @photos = flickr.photos.getRecent
    end
  end

  private

  def static_pages_params
    params.require(:static_pages).permit(:id)
  end
end
