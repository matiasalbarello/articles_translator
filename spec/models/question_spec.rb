# frozen_string_literal: true

describe Question do
  describe 'attributes' do
    it { should have_attribute(:text) }
    it { should have_attribute(:answer) }
  end

  describe 'associations' do
    it { should belong_to(:article) }
    it { should have_one(:translation) }
  end
end
