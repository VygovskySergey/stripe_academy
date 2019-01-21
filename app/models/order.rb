class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items

  def total
    line_items.sum(:total)
  end
end
