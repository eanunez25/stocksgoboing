class ChangeCommentToNote < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :comment, :note
  end
end
