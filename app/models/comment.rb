# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :subcomments

  validates :comment_content, presence: true, length: { minimum: 1 }
end
