# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :text, null: false
      t.text :answer
      t.references :article, null: false, foreign_key: true
    end
  end
end
