class CreateBullPutSpreads < ActiveRecord::Migration[6.0]
  def change
    create_table :bull_put_spreads do |t|
      t.decimal "floor1", precision: 8, scale: 2
      t.decimal "floor2", precision: 8, scale: 2
      t.decimal "strike", precision: 8, scale: 2
      t.date "expiration"
      t.integer "user_id"
      t.string "asset"

      t.timestamps
    end
  end
end
