class ChangeColumnToComments < ActiveRecord::Migration[5.2]
  def up
    change_column_null :comments, :article_id, false
  end

  def down
    change_column_null :comments, :article_id, true
  end
end
