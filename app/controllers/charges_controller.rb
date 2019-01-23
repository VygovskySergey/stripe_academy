class ChargesController < ApplicationController
  before_action :set_order, only: :create

  def new
    @amount   = params[:amount].to_f
    @order_id = params[:order_id]
  end

  def create
    charge = Stripe::Charge.create(
      amount:      params[:amount],
      description: 'Rails Stripe customer',
      source:      params[:stripeToken],
      currency:    'usd'
    )

    order.update(state: 'completed')

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  attr_reader :order

  def set_order
    @order = Order.find(params[:order_id])
  end
end
