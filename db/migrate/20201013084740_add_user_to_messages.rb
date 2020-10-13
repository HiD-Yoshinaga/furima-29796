class AddUserToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :user, null: false, foreign_key: true
    add_reference :messages, :item, null: false, foreign_key: true
  end
end
