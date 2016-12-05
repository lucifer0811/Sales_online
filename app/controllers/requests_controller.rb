class RequestsController < ApplicationController
  load_and_authorize_resource

  def create
    @request = current_user.requests.build request_params
    if @request.save
      respond_to do |format|
        format.json {head :no_content}
        format.js
        format.html do
          flash[:success] = t "views.request.created"
          redirect_to requests_path
        end
      end
    else
      format.json {render json: @product.errors.full_messages,
          status: :unprocessable_entity}
      format.js
      format.html do
        flash[:danger] = t "request.fail"
        redirect_to root_path
      end
    end
  end

  def destroy
  end

  def index
    @user = current_user
    @requests = @user.requests.order(updated_at: :desc).paginate page: params[:page]
    @request = @user.requests.build
  end

  def show
  end

  private
  def request_params
    params.require(:request).permit :product_name, :price, :user_id
  end
end
