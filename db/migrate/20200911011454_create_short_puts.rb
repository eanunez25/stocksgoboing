class CreateShortPuts < ActiveRecord::Migration[6.0]
  def change
    create_table :short_puts do |t|
      t.decimal "floor1", precision: 8, scale: 2
      t.decimal "floor2", precision: 8, scale: 2
      t.decimal "strike", precision: 8, scale: 2
      t.date "expiration"
      t.string "asset"
      t.integer "user_id"
      
      t.timestamps
    end
  end
end
