module ReviewsHelper

  def check_if_private(review)
    @video_url = review.videolink
    @client = YouTubeIt::Client.new(:username => "shorts@live.se", :password =>  "filmriket", :dev_key => "AI39si5QCJpA99I-VxTU1Q-wiggLXaAdT2n1WKw-fJqlIhyrGxjdeDK5gMgoCX1wbSbku2CLBPg8BWaDMsNhr6L0hzD148Lnog")
    return @client.my_video(@video_url).perm_private
  end
  
end
