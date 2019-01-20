class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :product, index: true

      t.integer    :quantity, null: false, default: 0
      t.decimal    :total,    null: false, default: 0
    end
  end
end
