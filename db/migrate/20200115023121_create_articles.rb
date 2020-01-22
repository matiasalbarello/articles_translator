# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false
    end
  end
end
