class User < ApplicationRecord

  has_many :books

  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: true}
  validates :name, format: { with: /\A\D+[a-zA-Z]\z/,
    message: "just use letters please" }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: "write a valid email format" }

end
