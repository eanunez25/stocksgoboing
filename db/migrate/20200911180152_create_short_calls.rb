class CreateShortCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_calls do |t|
      t.decimal "ceiling1", precision: 8, scale: 2
      t.decimal "ceiling2", precision: 8, scale: 2
      t.decimal "strike", precision: 8, scale: 2
      t.date "expiration"
      t.string "asset"
      t.integer "user_id"

      t.timestamps
    end
  end
end
