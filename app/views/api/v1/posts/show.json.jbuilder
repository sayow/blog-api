json.extract! post, :post_content
json.comments @posts.comments do |comment|
  json.extract! comment, comment_content
end
