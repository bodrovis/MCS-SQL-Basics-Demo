class AddLanguageIdToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :language_id if column_exists? :users, :language_id
    add_reference :users, :language, null: true, foreign_key: true
  end
end
