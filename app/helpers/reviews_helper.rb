module ReviewsHelper

  def check_if_private(review)
    @video_url = review.videolink
    @client = YouTubeIt::Client.new(:username => "shorts@live.se", :password =>  "filmriket", :dev_key => "AI39si5QCJpA99I-VxTU1Q-wiggLXaAdT2n1WKw-fJqlIhyrGxjdeDK5gMgoCX1wbSbku2CLBPg8BWaDMsNhr6L0hzD148Lnog")
    return @client.my_video(@video_url).perm_private
  end

  def review_embed(review_url)
    if review_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      review_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="YouTube video player" width="950" height="600" src="http://www.youtube.com/embed/#{review_url}?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>}
  end

  def reviews_embed(review_url)
    if review_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      review_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="YouTube video player" width="290" height="185" src="http://www.youtube.com/embed/#{review_url}?rel=0&amp;showinfo=0;controls=0&amp;" frameborder="0" allowfullscreen></iframe>}
  end

  def small_reviews_embed(review_url)
    if review_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      review_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="YouTube video player" width="305" height="172" src="http://www.youtube.com/embed/#{review_url}?rel=0&amp;showinfo=0;controls=0&amp;" frameborder="0" allowfullscreen></iframe>}
  end

end
