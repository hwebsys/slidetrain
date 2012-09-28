class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :json

  # GET /
  def top
  end

  def jsonsample
    sample_hash = [
                   {
                     'id' => 'slide1',
                     'title' => '5 Reasons Why Social Media Was Born For SMEs',
                     'href' => 'http://www.slideshare.net/tomorrow_people/5-reasons-why-social-media-was-born-for-sm-es',
                     'img' => {
                       'src' => '//cdn.slidesharecdn.com/ss_thumbnails/5reasonswhysocialmediawasbornforsmes-120925085917-phpapp02-thumbnail-2.jpg?1348649444',
                     },
                   },
                   {
                     'id' => 'slide2',
                     'title' => 'Doodle Type Information for my Real Estate Business',
                     'href' => 'http://www.slideshare.net/iprorand/listing-presentation-total-market-overview',
                     'img' => {
                       'src' => '//cdn.slidesharecdn.com/ss_thumbnails/rand-120925181223-phpapp02-video-thumbnail-2.jpg?1348676282',
                     },
                   },
                  ]
    respond_with sample_hash.to_json, :callback => params[:callback]
  end
end
