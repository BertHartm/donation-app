class CreateVoucherDonations < ActiveRecord::Migration
  def change
    create_table :voucher_donations do |t|
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
