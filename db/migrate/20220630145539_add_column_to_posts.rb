# frozen_string_literal: true

class AddColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comment_id, :integer
  end
end
