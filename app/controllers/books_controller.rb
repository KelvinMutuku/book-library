class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow, :return]
  before_action :set_book, only: [:show, :borrow, :return]

  def index
    @books = Book.all
  end

  def show
  end

  def borrow
    if @book.available?
      current_user.borrowings.create!(book: @book, borrowed_at: Time.zone.now, returned: false)
      redirect_to user_profile_path, notice: "Book borrowed successfully!"
    else
      redirect_to @book, alert: "This book is already borrowed!"
    end
  end

  def return
    borrowing = current_user.borrowings.find_by(book: @book, returned: false)
    if borrowing
      borrowing.update(returned: true)
      redirect_to user_profile_path, notice: "Book returned successfully!"
    else
      redirect_to @book, alert: "You haven't borrowed this book!"
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end