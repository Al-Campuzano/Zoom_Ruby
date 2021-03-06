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
    puts "#{self.class} list of books:"
    @books.each { |book| book.print_book }
  end

  def place book_to_add
    if (book_to_add.class == Book && @books.length <= 18)
      @books.push(book_to_add)
    else
      puts "Library error - Was not able to add the book. Check that it is a Book object and there are less than 18 books in the Library"
    end
  end

  def take book_to_remove
    if @books.index(book_to_remove)
      @books.delete_at(@books.index(book_to_remove))
    else
      puts "#{self.class} Error! Could not take the book - The book was not found"
    end
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

class User < Library
  def initialize
    @books = []
  end
  
  def place book_to_add
    if book_to_add.class == Book
      @books.push(book_to_add)
    else
      puts "User error - Was not able to add the book. Check that it is a Book object"
    end
  end
end

##### Testing #####
lib = Library.new
user = User.new

b1 = Book.new("A Study in Scarlet", 200)
lib.place(b1)

b2 = Book.new("The Black Rainbow", 400)
user.place(b2)

puts "\n---- Starting state ----"
lib.look
user.look

puts "\n---- User takes a book from Library ----"
user.place(lib.take(b1))
lib.look
user.look

puts "\n---- User places a different book into Library ----"
lib.place(user.take(b2))
lib.look
user.look

puts "\n---- User tries to place a book into Library that they don't currently have ----"
lib.place(user.take(b2))
lib.look
user.look

puts "\n---- The end. ----"
