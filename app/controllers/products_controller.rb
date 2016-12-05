class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    @products = Product.all.order("created_at DESC").paginate page: params[:page],
      per_page: Settings.category.per_page
  end
end
