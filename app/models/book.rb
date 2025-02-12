class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :users, through: :borrowings

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  def available?
    !borrowings.exists?(returned: false)
  end
end
