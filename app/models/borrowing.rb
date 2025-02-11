class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book, uniqueness: { scope: :returned, message: "is already borrowed" }, unless: :returned

  before_create :set_due_date

  private

  def set_due_date
    self.due_date ||= Time.zone.now + 2.weeks  # Set due date only if it's nil
  end
end
