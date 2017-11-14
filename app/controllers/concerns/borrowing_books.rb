module BorrowingBooks
  extend ActiveSupport::Concern

  def borrow_book
    # pry
    unless book_params[:user_id].empty?
      flash[:notice] = 'Book is borrowed successfully'
    else
      flash[:notice] = 'Book available again'
    end
    @book.update_attributes(status: 'available', user_id: book_params[:user_id])
  end

end