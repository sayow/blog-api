class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  validates :post_content, presence: true
  validates :user_id, presence: true

end
