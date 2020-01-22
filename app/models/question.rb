# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :article
  has_one :translation, class_name: 'QuestionTranslation', dependent: :destroy

  def enqueue_translation
    TranslateQuestionJob.perform_later(question_id: id)
  end
end
