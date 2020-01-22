# frozen_string_literal: true

describe Article do
  describe 'attributes' do
    it { should have_attribute(:name) }
  end

  describe 'associations' do
    it { should have_many(:questions) }
  end
end
