# frozen_string_literal: true

class Subcomment < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :subcomment_content, presence: true, length: { minimum: 1 }
end
