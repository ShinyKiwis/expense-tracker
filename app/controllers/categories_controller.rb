class CategoriesController < ApplicationController
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if params[:commit] == 'Update'
      @category.name = category_params[:name]
      if @category.save
        flash[:notice] = "Updated category #{params[:id]}!"
      else
        flash[:alert] = @category.errors.full_messages
        return render :edit, status: :unprocessable_entity
      end
    else
      flash[:alert] = "Deleted category #{params[:id]}!"
      @category.destroy
    end
    redirect_to categories_path
  end

  def create
    category = Category.new
    category.name = category_params[:name]
    if category.save
      flash[:notice] = "Category created!"
    else
      flash[:alert] = "Category: #{category.errors.full_messages.join(', ')}"
    end
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
