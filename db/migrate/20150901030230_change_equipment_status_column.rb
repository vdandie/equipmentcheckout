class ChangeEquipmentStatusColumn < ActiveRecord::Migration
  def change
  	remove_column :equipment, :status
  	add_column  :equipment, :status, :integer
  end

  def data
  	Equipment.find_each do |e|
  		e.status = 2
  		e.save!
  	end
  end
end
