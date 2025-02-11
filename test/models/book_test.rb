require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    @book = books(:one) # Assuming you have a fixture for books
    @user = users(:one) # Assuming you have a fixture for users
  end

  test "book is available when not borrowed" do
    assert @book.available?
  end

  test "book is not available when borrowed" do
    Borrowing.create(book: @book, user: @user, due_date: 2.weeks.from_now)
    assert_not @book.available?
  end
end