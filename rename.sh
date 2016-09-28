#!/usr/bin/env ruby

posts = Dir.entries('_posts')

posts.each do |post|
  next if [".", "..", ".DS_Store"].include?(post)
  old_date = post[0..7]
  year = old_date[0..3]
  month = old_date[4..5]
  day = old_date[6..7]

  new_date = "#{year}-#{month}-#{day}"

  new_name = new_date + post.slice(8,99)

  File.rename("_posts/" + post, "_posts/" + new_name)
end
