class CreateSignIns < ActiveRecord::Migration
  def change
    create_table :sign_ins do |t|
      t.integer :admin_id
      t.integer :request_id

      t.timestamps null: false
    end
    add_index :sign_ins, :admin_id
    add_index :sign_ins, :request_id
    add_index :sign_ins, [:admin_id, :request_id], unique: true
  end
end
