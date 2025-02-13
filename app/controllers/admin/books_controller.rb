class Admin::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def new
    @book = Book.new  # ✅ Ensure a new book instance is available
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_path, notice: "Book added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def check_admin
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :available)
  end
end
