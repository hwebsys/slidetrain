class HatenaLoader
  @@cache_file = File.join(Rails.root,"tmp","hatena.rss")

  def load
    return loading unless File.exist? cache_file

    if File.ctime(cache_file) < 1.hour.ago
      return loading
    end
  end

  def cache_file
    @@cache_file
  end

  def loading
    require 'open-uri'
    url = "http://b.hatena.ne.jp/search/text?q=Slideshare%7CSpeakerDeck&users=5&sort=recent&mode=rss"
    buffer = open(url).read
    open(cache_file,"w").write buffer

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
