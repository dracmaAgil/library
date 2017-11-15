module BorrowingBooks
  extend ActiveSupport::Concern
  
  included do
    include MessageSender
  end

  def borrow_book
    status = ''
    if book_params[:user_id].empty?
      sending_message
      flash[:notice] = 'Book available again'
      status = 'available'
    else
      flash[:notice] = 'Book is borrowed successfully'
      status = 'borrowed'
    end
    @book.update_attributes(status: status, user_id: book_params[:user_id])
  end

end