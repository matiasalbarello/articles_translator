# frozen_string_literal: true

class TranslationService
  class CouldNotTemporarilyTranslateError < StandardError
    def initialize
      super('Translation Service temporarily unavailable.')
    end
  end
end
