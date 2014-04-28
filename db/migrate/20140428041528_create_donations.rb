class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.string :description
      t.references :donation_type, polymorphic: true
      t.references :donor
      t.timestamps
    end
  end
end
