class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :user_books

  def self.all_books
    Book.all.map { |book| book.title }
  end

  def self.currently_available
    available = []
    Book.all.each do |book|
      if book.user_books == []
        available << book.title
      elsif book.user_books.last.returned == true
        available << book.title
      end
    end
    available
  end

  def self.available?(book_title)
    book = Book.find_by(title: book_title)
    if book == nil
      "We're sorry, we do not carry that book at this time."
    elsif Book.currently_available.include?(book_title)
      "This book is available for checkout!"
    else
      "That book is currently checked out by another user."
    end
  end

end