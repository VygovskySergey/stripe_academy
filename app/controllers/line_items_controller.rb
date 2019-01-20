class LineItemsController < ApplicationController
  before_action :set_order, only: :create

  def create
    order.line_items << LineItem.new(line_item_params)

    if order.save
      render json: order, status: 200
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end

  private

  attr_reader :order

  def set_order
    @order = current_user.order || current_user.orders.build
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
