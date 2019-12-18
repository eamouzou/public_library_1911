require './lib/book'

class Author
  attr_reader :name, :books, :first_name, :last_name

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @name = info[:first_name] + " " + info[:last_name]
    @books = []
  end

  def write(name, date)
    book = Book.new({author_first_name: @first_name, author_last_name: @last_name,
       title: name, publication_date: date})
    @books << book
    book
  end
end
