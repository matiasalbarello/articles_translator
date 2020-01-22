# frozen_string_literal: true

class TranslationService
  def initialize
    @client = Aws::Translate::Client.new
  end

  def translate(text)
    @client.translate_text(
      text: text,
      source_language_code: source_language_code,
      target_language_code: target_language_code
    )
  rescue Aws::Translate::Errors::DetectedLanguageLowConfidenceException => e
    # In case that a source_language_code `auto` is selected, it retries to translate even if the confidence level is low
    Rails.logger.error e.message
    @client.translate_text(
      text: text,
      source_language_code: e.detected_language_code,
      target_language_code: target_language_code
    )
  rescue Aws::Translate::Errors::InternalServerException, Aws::Translate::Errors::ServiceUnavailableException => e
    raise CouldNotTemporarilyTranslateError
  rescue Aws::Translate::Errors::TextSizeLimitExceededException => e
    Rails.logger.error e.message
    nil
  end

  def source_language_code
    ENV['SOURCE_LANGUAGE_CODE']
  end

  def target_language_code
    ENV['TARGET_LANGUAGE_CODE']
  end
end
