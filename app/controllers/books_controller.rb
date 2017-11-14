class BooksController < ApplicationController
  
  include BorrowingBooks

  before_action :get_categories, only:[:new, :edit]
  def index
    if Category.count > 0
      @books = Book.where(active: 1).paginate(page: params[:page], per_page: 5)
    else
      redirect_to root_path, notice: 'Need to create at least one category'
    end
  end

  def new
    @book = Book.new
  end

  def create
    begin
      @book = Book.new(book_params)
      @book.status = 'available'
      pry
      if @book.save
        redirect_to books_path, notice: 'Created book'
      else
        flash[:notice] = 'book not created'
        redirect_to new_book_path, flash: { error: @book.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to new_book_path, flash: { error: e.message }
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    begin
      if @book.update(book_params)
        redirect_to books_path, notice: 'book updated'
      else
        redirect_to edit_book_path, flash: { error: @book.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to edit_book_path, flash: { error: e.message }
    end
  end

  def cancel
    @book = Book.find(params[:book_id])
    begin
      if @book.user_id.empty? && @book.categories.empty? && @book.update_attribute(:active, 0)
        redirect_to books_path, notice: 'book cancelled'
      else
        redirect_to books_path, flash: { error: 'Only can delete books without vategories and not borrowed' }
      end
    rescue Exception => e
      redirect_to books_path, flash: { error: e.message }
    end
  end

  def get_categories
    @categories = Category.where(active: 1)
  end

  def listing_users
    @book = Book.find(params[:book_id])
    @users = User.where('active = 1')
  end

  def borrowing_book
    @book = Book.find(params[:book_id])
    begin
      if borrow_book
        redirect_to books_path
      else
        redirect_to book_listing_users_path(@book), flash: { error: @book.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to book_listing_users_path(@book), flash: { error: e.message }
    end
  end

  private

    def book_params
      params.require(:book).permit(
        :name, 
        :author,
        :user_id,
        :category_ids => []
      )
    end

end
