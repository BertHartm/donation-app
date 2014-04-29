require 'spec_helper'

describe Donor do
  before :each do
    @donor = Donor.create(:email => 'testuser@berthartmann.com', :password => 'password')
    @donor.donations << Donation.new(:title => "donation 1", :description => "none", :donation_type => PhysicalDonation.new(:height => 12, :width => 13, :weight => 14))
    @donor.donations << Donation.new(:title => "donation 2", :description => "none", :donation_type => PhysicalDonation.new(:height => 12, :width => 13, :weight => 14))
  end

  it "lists all donations" do
    expect(@donor.donations.length == 2)
  end

  it "sets donor on donations" do
    expect(@donor.donations[0].donor).to eq @donor
    expect(@donor.donations[0].donation_type.donor).to eq @donor
  end
end
