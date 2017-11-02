class DashboardController < ApplicationController
  def index
    @users = User.all.limit(5)
    @categories = Category.all.limit(5)
    @books = Book.all.limit(5)
  end
end
