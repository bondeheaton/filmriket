module ReviewsHelper

  def check_if_private(review)
    video_url = review.videolink
    client = YouTubeIt::Client.new(:username => "filmriket@gmail.com", :password => "", :dev_key => "")
    return client.my_video(video_url).perm_private
  end
  
end
