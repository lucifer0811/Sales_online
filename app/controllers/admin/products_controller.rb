class Admin::ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, only: [:new, :create]

  def new
  end

  def create
    @product = Product.new product_params
    respond_to do |format|
      if @product.save
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @category.errors.full_messages,
          status: :unprocessable_entity}
      end
    end
  end

  def index
    @products = Product.all.order("created_at DESC").paginate page: params[:page],
      per_page: Settings.category.per_page
  end

  private
  def load_categories
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit :name, :price, :description, :category_id,
      :sale_off
  end
end
