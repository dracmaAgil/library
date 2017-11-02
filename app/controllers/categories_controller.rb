class CategoriesController < ApplicationController
  def index
    @categories = @categories.all
  end

  def new
    @category = Category.new
  end

  def create
    begin
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path, notice: 'Created category'
      else
        flash[:notice] = 'category not created'
        redirect_to new_category_path, flash: { error: @category.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to new_category_path, flash: { error: e.message }
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
      @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    begin
      if @category.update(category_params)
        redirect_to categories_path, notice: 'category updated'
      else
        redirect_to edit_category_path, flash: { error: @category.errors.full_messages.to_sentence }
      end
    rescue Exception => e
      redirect_to edit_category_path, flash: { error: e.message }
    end
  end

  private

    def category_params
      params.require(:category).permit(
        :name, 
        :description
      )
    end
end
