class UsersController < ApplicationController

  def index
    @users = User.where(active: 1).paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    begin
      @user = User.new(user_params)
      @user.active = 1
      if @user.save
        redirect_to users_path, notice: 'Created user'
      else
        flash[:notice] = 'User not created'
        redirect_to new_user_path, flash: { error: @user.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to new_user_path, flash: { error: e.message }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    begin
      if @user.update(user_params)
        redirect_to users_path, notice: 'user updated'
      else
        redirect_to edit_user_path, flash: { error: @user.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to edit_user_path, flash: { error: e.message }
    end
  end

  def cancel
    @user = User.find(params[:user_id])
    begin
      if @user.books.empty? && @user.update_attribute(:active, 0)
        redirect_to users_path, notice: 'user cancelled'
      else
        redirect_to users_path, flash: { error: 'Only delete users without books' }
      end
    rescue Exception => e
      redirect_to users_path, flash: { error: e.message }
    end
  end

  def list_books
    @user = User.find(params[:user_id])
    @books = Book.where('active = ? and status = ?', 1, 'borrowed')

  end

  def create_wish_list
    @user = User.find(params[:user_id])
    begin
      if @user.update(user_params)
        redirect_to users_path, notice: 'wish list created'
      else
        redirect_to user_list_books_path, flash: { error: @user.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to user_list_books_path, flash: { error: e.message }
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :name, 
        :email, 
        :cellphone,
        wish_lists_attributes: [:user_id, :book_id, :_destroy]
      )
    end
end
