class AddCommentsToBps < ActiveRecord::Migration[6.0]
  def change
    add_column :bull_put_spreads, :open_comments, :text
    add_column :bull_put_spreads, :close_comments, :text

    add_column :bear_call_spreads, :open_comments, :text
    add_column :bear_call_spreads, :close_comments, :text

    add_column :short_calls, :open_comments, :text
    add_column :short_calls, :close_comments, :text

    add_column :short_puts, :open_comments, :text
    add_column :short_puts, :close_comments, :text
  end
end
