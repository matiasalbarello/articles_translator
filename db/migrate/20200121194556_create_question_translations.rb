# frozen_string_literal: true

class CreateQuestionTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :question_translations do |t|
      t.text :text, null: false
      t.text :answer
      t.string :language_code
      t.references :question, null: false, foreign_key: true
    end
  end
end
