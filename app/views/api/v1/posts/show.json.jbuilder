json.extract! @post, :post_content, :user, :created_at
json.user @post.user.name
json.created_at @post.created_at.strftime("%F")

# _____________________________________________________________________________
json.comments @post.comments do |comment|
  json.extract! comment, :comment_content, :user, :created_at
  json.user comment.user.name
  json.created_at comment.created_at.strftime("%F")
    json.comments @post.comments do
    json.extract! @subcomment, :subcomment_content, :user, :created_at
    json.user @subcomment.user.name
    json.created_at @subcomment.created_at.strftime("%F")
    end
end
