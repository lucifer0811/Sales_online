class Admin::CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :load_product

  def new
  end

  def create
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.product = Product.find_by id: params[:product_id]
    respond_to do |format|
      if @comment.save
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @category.errors.full_messages,
          status: :unprocessable_entity}
      end
    end
  end

  def index
    @comments = @product.comments.order("created_at DESC")
  end

  def destroy
  end

  private
  def load_product
    @product = Product.find_by id: params[:product_id]
  end

  def comment_params
    params.require(:comment).permit :content, :user_id, :product_id
  end
end
