class CreateEquities < ActiveRecord::Migration[6.0]
  def change
    create_table :equities do |t|
      t.string :ticker
      t.decimal :buy_price, precision: 8, scale: 2
      t.decimal :valuation, precision: 8, scale: 2

      t.timestamps
    end
  end
end
