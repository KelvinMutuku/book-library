class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :book_availability

  private

  def book_availability
    if book.borrowings.where(returned_at: nil).exists?
      errors.add(:book, "is already borrowed")
    end
  end
end