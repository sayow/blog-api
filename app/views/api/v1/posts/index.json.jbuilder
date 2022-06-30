json.array! @posts do |post|
  json.extract! post, :post_content

end
