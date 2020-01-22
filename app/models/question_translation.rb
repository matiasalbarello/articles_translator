# frozen_string_literal: true

class QuestionTranslation < ApplicationRecord
  belongs_to :question

  delegate :article, to: :question
end
