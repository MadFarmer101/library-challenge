## Library Challenge
### Week 1 Ruby challenge

### Authors 
[Janko Radakovic](https://github.com/MadFarmer101/library-challenge.git)
[Robin Lillqvist](https://github.com/robin-lillqvist/library-challenge.git)
## Built with  
Ruby   
**Testing:** RSpec  

## The code   
This is a virtual library where we have created solutions for the library to store books, see documentation of the stored books and be able to search for books by title and author. We have also made it possible for the library to see a specific list for the books that are checked out to keep track of them. As well as created solutions for a customer to be able to see a list of all books and search for a certain book by both title and author. In order to loan a book of choice we have made it possible for the customer to checkout a book and then get the return date showed and also a solution for returning the book to the library.

## Getting started
### Dependencies  
* Ruby
* RSpec

The Gems used:
- rake
- rspec
- pry
- pry-byebug
- rubocop

### Setup   
For this project you should use Ruby version 2.6.3
You can check your ruby version:
>$ rvm list

If you are using the wrong version, then you need to install 2.6.3
>$ rvm install 2.6.3

And then to use the corret version
>$ rvm use 2.6.3

Then run bundle to get all the required gems.
>$ bundle

### Instructions
Load irb

>$ irb 

Load all the files that are required

>$ load ’lib/library.rb’

>$ load ’lib/customer.rb’

>$ load ’lib/search_services.rb’

Create a new Library

>$ library = Library.new

Search for a book with only part of, or the whole author's name

>$ library.search_author(”Pascal”)

Search for a book with only part of, or the whole title

>$ library.search_title(”kungen”)

Search for books that are checked out an has the status available: false

>$ library.unavailable_books



Create a new Customer

>$ customer = Customer.new

Create a list of books that aren't checked out, and has the status available: true

>$ customer.available_books

Search for a book with only part of, or the whole author's name

>$ customer.search_author(”Schulman”)

Search for a book with only part of, or the whole title

>$ customer.search_title(”brev”)

Loan a book by checking it out

>$ customer.checkout_service(1)

Return a loaned book by checking it in

>$ customer.checkin_service(1)

### User Stories
```
As a library worker
In order to see range of books 
I need to be able to see a list of all the books
```

```
As a library worker
In order to find the right book
I need to be able to search for both title and author
```

```
As a library worker
In order to see what books are checked out by customer 
I need to see a list of unvailable books
```

```
As a library
In order to get the checked out books back
We need to be able to have a time frame when it needs to be returned
```

```
As a customer
In order to see what books are available in the library
I need to be able to see a list of available books```

```
As a customer
In order to find the book I want
I need to be able to search for both title and author
```

```
As a customer
In order to borrow the book I want
I need to be able to checkout the book
```

```
As a customer
In order to know when the book has to be returned
I need to see which date the book has to be return on 
```

```
As a customer
In order to know when the book has to be returned
I need to see which date the book has to be return on 
```

```
As a customer
In order to return a book
I need to be able to check the book back in
```
 
## License  
[MIT-license](https://en.wikipedia.org/wiki/MIT_License)
### Acknowledgement  
[Craft Academy](https://craftacademy.se)  
