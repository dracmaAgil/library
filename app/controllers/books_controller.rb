class BooksController < ApplicationController
  
  def index
    if Category.count > 0
      @books = @books.all
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

  private

    def book_params
      params.require(:book).permit(
        :name, 
        :author,
        :category_ids => []
      )
    end

end
