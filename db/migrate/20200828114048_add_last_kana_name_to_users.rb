class AddLastKanaNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_kana_name, :string
  end
end
