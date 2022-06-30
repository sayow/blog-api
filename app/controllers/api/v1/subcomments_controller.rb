class Api::V1::SubcommentsController < ApplicationController
  before_action :set_subcomment, only: [ :show, :update, :destroy ]

  def index
    @subcomments = Subcomment.all
  end

  def show
  end

  def update
    if @subcomment.update(subcomment_params)
      render :show
    else
      render_error
    end
  end

  def create
    @subcomment = Subcomment.new(subcomment_params)
    @subcomment.user = current_user
    if @subcomment.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @subcomment.destroy
    head :no_content
  end

  private

  def set_subcomment
    @subcomment = Subcomment.find(params[:id])
  end

  def subcomment_params
    params.require(:subcomment).permit(:subcomment_content)
  end

  def render_error
    render json: { errors: @subcomment.errors.full_messages },
      status: :unprocessable_entity
  end
end
