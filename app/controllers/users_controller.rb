class UsersController < ApplicationController

  def index
    @users = @users.all
  end

  def new
    @user = User.new
  end

  def create
    begin
      @user = User.new(user_params)
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

  private

    def user_params
      params.require(:user).permit(
        :name, 
        :email, 
        :cellphone
      )
    end
end
