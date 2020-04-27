require "./lib/library.rb"
require "./lib/person.rb"
require "yaml"

describe Library do
  let(:username) { instance_double("Robin") }

  subject { described_class.new }

  it "Checks if the library collection is not empty" do
    expect(subject.collection).to_not eq nil
  end

  it 'Checks if the library has the book "Alfons och soldatpappan"' do
    expect(subject.collection[0][:item][:title]).to include("Alfons och soldatpappan")
  end

  it "Checks if you can search for a book by the author" do
    expected_output = [{ :item => { :title => "Pippi Långstrump", :author => "Astrid Lindgren" }, :available => true, :return_date => nil, :loaned_by => nil }, { :item => { :title => "Pippi Långstrump går ombord", :author => "Astrid Lindgren" }, :available => true, :return_date => nil, :loaned_by => nil }]
    expect(subject.search_author("Astrid")).to eq expected_output
  end

  it "Checks if you can search for a book by title" do
    expected_output = [{ :item => { :title => "Skratta lagom! Sa pappa Åberg", :author => "Gunilla Bergström" }, :available => true, :return_date => nil, :loaned_by => nil }]
    expect(subject.search_title("Åberg")).to eq expected_output
  end

  it "Gives only the list of available books" do
    expect(subject.list_of_available_books).to be_truthy
  end

  it "Gives a list of unavailable books" do
    expect(subject.list_of_unavailable_books).to be_truthy
  end

  it "Checks if you can change availible status on a book once borrowed" do
    subject.change_availability(0)
    expect(subject.collection[0][:available]).to eq false
  end

  it "Checks that a return date is set for 30 days once book has been borrowed" do
    subject.set_return_date(0)
    expect(subject.collection[0][:return_date]).to eq Date.today.next_day(30).strftime("%Y-%m-%d")
  end

  it "Checks if a book is available when it is returned" do
    subject.book_returned(0)
    expect(subject.collection[0][:available]).to eq true
  end

  it "Checks that return date is set to nil once book is returned" do
    subject.date_to_nil(0)
    expect(subject.collection[0][:return_date]).to eq nil
  end

  it "Checks if the receipt has a return date, title and that it is not available anymore" do
    expected_output = { title: "Alfons och soldatpappan", available: false, return_date: Date.today.next_day(30).strftime("%Y-%m-%d"), loaned_by: @username }
    expect(subject.lend_book(0, @username)).to eq expected_output
    subject.return_book(0)
  end
end
