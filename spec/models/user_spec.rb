require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build :user }
  subject { user }

  context 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
  end

  context 'associations' do
    it { is_expected.to have_many(:books) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context 'user with invalid and valid email ' do
    
    it 'email with invalid format is invalid' do
      user1 = User.new(name: 'alejandro', email: 'alejandro')
      user1.valid?
      expect(user1.errors[:email]).to include('write a valid email format')
    end

    it 'email with valid format' do
      user.valid?
      expect(user).to be_valid
    end

  end

  context 'user with many books' do

    def creating_books(user)
      book =  build :book, user_id: user.id
      book.save
    end

    it 'user have many books' do
      user1 = create :user
      3.times{ creating_books(user1) } 
      expect(user1.books.count).to be 3
    end
  end

  context 'user with many whishlists' do

    def creating_books(user)
      book =  build :book, user_id: user.id
      book.save
    end

    def creating_wishlists(user1, user2)
      user1.books.each do |book|
        wish = create :wish_list, user:user2, book_id: book.id
      end
    end

    it 'user have many wishlists' do
      user1 = create :user
      user2 = create :user
      3.times{ creating_books(user1) } 
      creating_wishlists(user1, user2)
      expect(user2.wish_lists.count).to be 3
    end
  end

end
