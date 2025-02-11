class User < ApplicationRecord
  has_many :borrowings
  has_many :books, through: :borrowings

  # Ensure Devise authentication is included
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin
  end
end