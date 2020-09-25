class AddUserIdToEquities < ActiveRecord::Migration[6.0]
  def change
    add_column :equities, :user_id, :integer
  end
end
