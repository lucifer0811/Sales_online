class Admin::CategoryController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def index
    @categories = Category.order("created_at DESC").paginate
      page: params[:page], per_page: Settings.category.per_page
  end
end
