class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :tag
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
    add_index :equipment, :tag
  end
end
