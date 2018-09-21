class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    redirect_to category_url(@category)
  end
end
