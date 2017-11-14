require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { build :book }
  subject { book }

  context 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :author }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:author) }
  end

  context 'book with at least one category' do
    it 'book have one category' do
      book = build :book
      book.save
      expect(book.categories.count).to be(1)
    end
  end
end
