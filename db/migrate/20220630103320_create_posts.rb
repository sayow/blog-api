# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :post_content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
