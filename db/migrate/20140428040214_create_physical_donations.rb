class CreatePhysicalDonations < ActiveRecord::Migration
  def change
    create_table :physical_donations do |t|
      t.integer :height
      t.integer :width
      t.integer :weight

      t.timestamps
    end
  end
end
