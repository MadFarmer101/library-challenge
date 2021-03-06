require "yaml"
require "date"

class Library
  attr_accessor :collection, :Library, :lend_book

  STANDARD_LENDING_PERIOD_IN_DAYS = 30

  def initialize
    @collection = create_collection()
  end

  def create_collection
    @collection = YAML.load_file("./lib/data.yml")
  end

  def search_author(author)
    collection.select { |book| book[:item][:author].include? "#{author}" }
  end

  def search_title(title)
    collection.select { |book| book[:item][:title].include? "#{title}" }
  end

  def list_of_available_books
    collection.select { |book| book[:available] == true }
  end

  def list_of_unavailable_books
    collection.select { |book| book[:available] == false }
  end

  def book_unavailable?(book)
    self.collection[book][:available] == false
  end

  ## Book borrowed
  def change_availability(book)
    collection[book][:available] = false
    File.open("./lib/data.yml", "w") { |f| f.write collection.to_yaml }
  end

  def set_return_date(book)
    collection[book][:return_date] = Date.today.next_day(STANDARD_LENDING_PERIOD_IN_DAYS).strftime("%Y-%m-%d")
    File.open("./lib/data.yml", "w") { |f| f.write collection.to_yaml }
  end

  def set_loaner(book, username)
    collection[book][:loaned_by] = username
    File.open("./lib/data.yml", "w") { |f| f.write collection.to_yaml }
  end

  def lend_book(book, username)
    case
    when book_unavailable?(book)
      { status: false, message: "Book in unavailable", return_date: Date.today }
    else
      make_loan_of_book(book, username)
    end
  end

  def make_loan_of_book(book, username)
    set_return_date(book)
    change_availability(book)
    set_loaner(book, username)
    { title: collection[book][:item][:title], available: collection[book][:available], return_date: collection[book][:return_date], loaned_by: collection[book][:loaned_by] }
  end

  ## Book returned
  def book_returned(book)
    collection[book][:available] = true
    File.open("./lib/data.yml", "w") { |f| f.write collection.to_yaml }
  end

  def date_to_nil(book)
    collection[book][:return_date] = nil
    File.open("./lib/data.yml", "w") { |f| f.write collection.to_yaml }
  end

  def remove_loaner(book)
    collection[book][:loaned_by] = nil
    File.open("./lib/data.yml", "w") { |f| f.write collection.to_yaml }
  end

  def return_book(book)
    book_returned(book)
    date_to_nil(book)
    remove_loaner(book)
  end
end
