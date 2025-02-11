class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @borrowing = current_user.borrowings.new(book: @book, due_date: 2.weeks.from_now)

    if @borrowing.save
      redirect_to @book, notice: "Book borrowed successfully."
    else
      redirect_to @book, alert: @borrowing.errors.full_messages.to_sentence
    end
  end

  def update
    @borrowing = Borrowing.find(params[:id])
    @borrowing.update(returned_at: Time.current)
    redirect_to user_path(current_user), notice: "Book returned successfully."
  end
end