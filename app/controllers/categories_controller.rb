class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    Category.new(params[:category]).save
    redirect_to action: :index and return
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to action: :index and return
  end
end
