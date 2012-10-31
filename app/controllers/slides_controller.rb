class SlidesController < ApplicationController
  respond_to :html, :json

  def index
    HatenaLoader.new.load

    slides = Slide.all
    response = slides.map do |slide|
      {
        id: slide.id,
        title: slide.title,
        image: {
          src: slide.image,
        }
      }
    end
    respond_with response, :callback => params[:callback]
  end

end
