class TopController < ApplicationController
  respond_to :html, :json

  # GET /
  def index
  end

  def jsonsample
    require 'open-uri'
    url = "http://b.hatena.ne.jp/search/text?q=Slideshare%7CSpeakerDeck&users=5&sort=recent&mode=rss"
    buffer = open(url).read
    # なんどもHTTPアクセスしたくない場合(開発用)
    # $ wget http://b.hatena.ne.jp/search/text?q=Slideshare%7CSpeakerDeck&users=5&sort=recent&mode=rss -O tmp/hoge.rss
    # buffer = open(Rails.root+"tmp/hoge.rss")
    require 'rss'
    rss = RSS::Parser.parse(buffer, true)
    i = 0
    items = rss.items
    items.delete_if do |item|
      ! %r{^http://www.slideshare.net/}.match item.link
    end
    sample_hash = rss.items.map do |item|
      i = i+1
      {
        id: i.to_s,
        title: item.title,
        href: item.link,
        img: {
          src: "",
        }
      }
    end
    respond_with sample_hash.to_json, :callback => params[:callback]
  end

end
