require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build :category }
  subject { category }

  context 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :description }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'category with invalid and valid name ' do
    
    it 'name format is invalid' do
      category1 = User.new(name: 'ci3ncia f1cción')
      category1.valid?
      expect(category1.errors[:name]).to include('just use letters please')
    end

    it 'name with valid format' do
      category.valid?
      expect(category).to be_valid
    end

  end

  context 'category with many books' do
    it 'category have many books' do
      category1 = create :category
      book1= create :book
      book2= create :book
      book3= create :book
      category1.books = [book1, book2, book3]
      category1.save
      expect(category1.books.count()).to be(3)
    end
  end
end
