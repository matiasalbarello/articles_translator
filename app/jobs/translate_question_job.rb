# frozen_string_literal: true

class TranslateQuestionJob < ApplicationJob
  def perform(question_id:)
    logger = Logger.new(STDOUT)
    logger.info("Performing #{self.class}")
    question = Question.find(question_id)
    question_translated = translate_question(question)

    translation = QuestionTranslation.find_by(question: question) || QuestionTranslation.new(question: question)

    translation.update(
      text: question_translated[:text_translated],
      answer: question_translated[:answer_translated],
      language_code: translator_service.target_language_code
    )
  end

  private

  def translator_service
    @translator_service = TranslationService.new
  end

  def translate_question(question)
    {
      text_translated: translator_service.translate(question.text).translated_text,
      answer_translated: translator_service.translate(question.answer).translated_text
    }
  end
end
