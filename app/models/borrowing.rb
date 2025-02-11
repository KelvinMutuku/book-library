class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # Ensure a book cannot be borrowed if it's already borrowed
  validate :book_availability

  private

  def book_availability
    if book.borrowings.where(returned_at: nil).exists?
      errors.add(:book, "is already borrowed")
    end
  end
end