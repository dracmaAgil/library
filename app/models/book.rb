class Book < ApplicationRecord
  
  # belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, :author, presence: true
  validates :name, :author, format: { with: /\A\D+[a-zA-Z]\z/,
    message: "just use letters please" }
  # validates_associated :user
  # validate :has_category?

  def has_category?
    errors.add(:categories, "Book must have at least one category.") if self.categories.blank?
  end

  def is_available?
    self.status == 'available' ? true : false
  end

end
