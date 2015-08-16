class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :sid
      t.references :equipment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
