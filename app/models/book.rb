class Book < ApplicationRecord

  has_and_belongs_to_many :categories
  has_many :wish_lists

  validates :name, :author, presence: true
  validates :name, :author, format: { with: /\A\D+[a-zA-Z]\z/,
    message: "just use letters please" }

  def is_available?
    self.status == 'available' ? true : false
  end

end
