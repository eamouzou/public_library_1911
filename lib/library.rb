class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    author.books.each {|book| @books << book}
    @authors << author
  end

  def publication_time_frame_for(author)
    years_int = author.books.map {|book| book.publication_year.to_i}

    time_frame = author.books.reduce({}) do |acc, book|
      if years_int.count == 1
        acc[:start] = years_int[0].to_s
        acc[:end] = years_int[0].to_s
      else
        if book.publication_year.to_i == years_int.min
          acc[:start] = years_int.min.to_s
        elsif book.publication_year.to_i == years_int.max
          acc[:end] = years_int.max.to_s
        end
      end
      acc
    end
  end

  def checkout(book)
    if @books == [] || @books.find {|lib_book| lib_book == book} != book
      false
    elsif @checked_out_books.find {|lib_book| lib_book == book} == book
      false
    else
      @checked_out_books << book
      true
    end
  end


end
