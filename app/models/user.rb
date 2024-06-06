class User < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :received_items

  def authenticate(password)
    BCrypt::Password.new(encrypted_password) == password
  end
end
