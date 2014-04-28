class ExperienceDonation < ActiveRecord::Base
  has_one :donation, as: :donation_type
  has_one :donor, :through => :donation

  validates_presence_of :latitude, :longitude
end
