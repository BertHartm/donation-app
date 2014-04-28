class CreateExperienceDonations < ActiveRecord::Migration
  def change
    create_table :experience_donations do |t|
      t.string :contact
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
