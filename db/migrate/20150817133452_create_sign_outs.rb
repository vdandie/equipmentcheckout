class CreateSignOuts < ActiveRecord::Migration
  def change
    create_table :sign_outs do |t|
      t.integer :admin_id
      t.integer :request_id

      t.timestamps null: false
    end
    add_index :sign_outs, :admin_id
    add_index :sign_outs, :request_id
    add_index :sign_outs, [:admin_id, :request_id], unique: true
  end
end
