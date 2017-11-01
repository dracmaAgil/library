class Category < ApplicationRecord

  has_and_belongs_to_many :books

  validates :name, presence: true
  validates :name, format: { with: /\A\D+[a-zA-Z]\z/,
    message: "just use letters please" }
end
