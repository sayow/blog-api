class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :post_content, presence: true
end
