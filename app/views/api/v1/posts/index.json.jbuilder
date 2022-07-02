# frozen_string_literal: true

json.array! @posts do |post|
  json.extract! post, :post_content, :user, :created_at
  json.user post.user.name
  json.created_at post.created_at.strftime('%F')
end
