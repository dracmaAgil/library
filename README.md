# library
It's a programming test

* Ruby 2.3.1

* Rails 5.1.4

* Run test suit: $ rspec spec

The application has three cruds:

User: we can create, modify, desactivate and see user details. There is an option in the user index where we can add a borrowed books wishlist for users (list icon).

book: we can create, modify, desactivate and see book details. Book has habtm relation with category There is an option in the user index where we can add a borrowed books wishlist for users. Before to access to a books index we need to create categories. There is an option in the books index where we can borrow the book to a user(book icon).

Categories: we can create, modify, desactivate and see category details. There is a habtm relation between book and category.

