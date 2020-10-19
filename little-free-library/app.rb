# Checklist

# All Books have a Title and a Page Count
# The Library can have a maximum of 18 Books
# A User can Look inside the Library
# A User can Take a Book from the Library
# A User can Place a Book in the Library
# All input is checked, and validated

class Library
  def initialize
    @books = []
  end

  def look
    @books.each { |book| book.print_book }
  end

  def place book_to_add
    if (book_to_add.class == Book && @books.length <= 18)
      @books.push(book_to_add)
    end
  end

  def take book_to_remove
    @books.delete_at(@books.index(book_to_remove))
  end
end

class Book
  def initialize(title, pages)
    @title = title
    @pages = pages
  end

  def print_book
    puts "- #{@title}, with #{@pages} pages."
  end
end

lib = Library.new
b1 = Book.new("A Study in Scarlet", 200)
lib.place(b1)
b2 = Book.new("The Black Rainbow", 400)
lib.place(b2)
puts lib.take(b2)

lib.look
