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
  end

  def source_language_code
    ENV['SOURCE_LANGUAGE_CODE']
  end

  def target_language_code
    ENV['TARGET_LANGUAGE_CODE']
  end
end
