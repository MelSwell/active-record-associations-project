class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books
  has_many :categories, through: :books
  has_many :authors, through: :books

  def check_out_book(book_title)
    book = Book.find_by(title: book_title)
    if book == nil
      "We're sorry, we do not carry that book at this time."
     elsif !Book.currently_available.include?(book_title) #UserBook.find_by(book_id: book.id) == nil || UserBook.find_by(book_id: book.id).returned == true  
      "Sorry, that book has been checked out by another user."
    else
      UserBook.create(user_id: self.id, book_id: book.id)
    end
  end

  def currently_checked_out_books
    self.user_books.select { |ub| ub.returned == false }
      .map { |ub| ub.book.title } 
  end

  def return_book(book_title)
    book = self.books.find_by(title: book_title)
    if book == nil
      "We cannot find that book in your list of currently checked out books."
    elsif self.user_books.find_by(book_id: book.id).returned == false
      UserBook.find_by(book_id: book.id).update(returned: true)
      self.user_books.find_by(book_id: book.id).update(returned: true)
    else
      "You have already returned this book. Thank you for your patronage!"
    end
  end
end