class AddressSnapshot < ActiveRecord::Migration[7.0]
  def change
    create_table :address_snapshots do |t|
      t.integer :address_id
      t.belongs_to :block
      t.decimal :balance
      t.decimal :balance_occupied
      t.integer :ckb_transactions_count
      t.integer :dao_transactions_count
    end
  end
end
