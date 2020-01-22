# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
end
