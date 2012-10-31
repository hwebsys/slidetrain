class HatenaLoader
  def load
    require 'open-uri'
    url = "http://b.hatena.ne.jp/search/text?q=Slideshare%7CSpeakerDeck&users=5&sort=recent&mode=rss"
    buffer = open(url).read
    # なんどもHTTPアクセスしたくない場合(開発用)
    # $ wget http://b.hatena.ne.jp/search/text?q=Slideshare%7CSpeakerDeck&users=5&sort=recent&mode=rss -O tmp/hoge.rss
    # buffer = open(Rails.root+"tmp/hoge.rss")
    require 'rss'
    rss = RSS::Parser.parse(buffer, true)
    items = rss.items
    items.delete_if do |item|
      ! %r{^http://www.slideshare.net/}.match item.link
    end
    rss.items.each do |item|
      slide = Slide.find_by_url(item.link)
      if slide.nil?
        Slide.create({title: item.title,
                  url: item.link,
                  image: "",
                  })
      end
    end
  end
end
