class Donation < ActiveRecord::Base
  belongs_to :donor
  belongs_to :donation_type, polymorphic: true

  validates_presence_of :donor, :donation_type, :title, :description
  validates_associated :donation_type
end
