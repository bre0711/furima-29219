class AddFirstKanaNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_kana_name, :string
  end
end
