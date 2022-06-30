class Comment < ApplicationRecord
  belongs_to :user
  has_many :subcomments

  validates :comment_content, presence: true, length: { minimum: 1 }
end
