class CreateBearCallSpreads < ActiveRecord::Migration[6.0]
  def change
    create_table :bear_call_spreads do |t|
      t.decimal "ceiling1", precision: 8, scale: 2
      t.decimal "ceiling2", precision: 8, scale: 2
      t.decimal "strike", precision: 8, scale: 2
      t.date "expiration"
      t.integer "user_id"
      t.string "asset"

      t.timestamps
    end
  end
end
