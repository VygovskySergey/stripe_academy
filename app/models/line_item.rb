class LineItem < ApplicationRecord
  belongs_to :product

  before_save :calculate_total

  delegate :name, :price, to: :product

  private

  def calculate_total
    self.total = quantity * product.price
  end
end
