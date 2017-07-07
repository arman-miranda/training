module PostsHelper
  def formatted_post_creation_time(non_formatted_time)
    non_formatted_time.strftime("%B %e %Y @ %l:%M %p")
  end
end
