# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :article
end