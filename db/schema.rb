# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_121_194_556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'articles', force: :cascade do |t|
    t.string 'name', null: false
  end

  create_table 'question_translations', force: :cascade do |t|
    t.text 'text', null: false
    t.text 'answer'
    t.string 'language_code'
    t.bigint 'question_id', null: false
    t.index ['question_id'], name: 'index_question_translations_on_question_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'text', null: false
    t.text 'answer'
    t.bigint 'article_id', null: false
    t.index ['article_id'], name: 'index_questions_on_article_id'
  end

  add_foreign_key 'question_translations', 'questions'
  add_foreign_key 'questions', 'articles'
end
