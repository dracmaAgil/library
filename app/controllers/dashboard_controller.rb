class DashboardController < ApplicationController
  def index
    @users = User.where('active = 1').limit(5)
    @categories = Category.where('active = 1').limit(5)
    @books = Book.where('active = 1').limit(5)
  end
end
