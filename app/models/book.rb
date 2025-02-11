class Book < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  has_many :borrowings
  has_many :users, through: :borrowings

  # Check if the book is available for borrowing
  def available?
    borrowings.where(returned_at: nil).empty?
  end
end