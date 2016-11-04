class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def index
    @categories = Category.order("created_at DESC").paginate page: params[:page],
      per_page: Settings.category.per_page
  end

  def new
  end

  def create
    @category = Category.new category_params
    respond_to do |format|
      if @category.save
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @category.errors.full_messages,
          status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update_attributes category_params
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @category.errors.full_messages,
          status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to categories_url}
      format.json {head :no_content}
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
end
