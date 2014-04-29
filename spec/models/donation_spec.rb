require 'spec_helper'

describe Donation do
  before :each do
    @donor = Donor.create(:email => 'testuser@berthartmann.com', :password => 'password')
  end

  it "accepts Physical Donations" do
    p = PhysicalDonation.new(:height => 12, :width => 13, :weight => 14)
    d = Donation.create!(:title => "physical donation", :description => "physics", :donation_type => p, :donor => @donor)

    expect(d.donation_type).to eq(p)
  end

  it "accepts Voucher Donations" do
    v = VoucherDonation.new(:expiration_date => Time.now)
    d = Donation.create!(:title => "voucher donation", :description => "experience", :donation_type => v, :donor => @donor)

    expect(d.donation_type).to eq(v)
  end

  it "accepts Experience Donations" do
    e = ExperienceDonation.new(:contact => "bert", :latitude => "47", :longitude => "12")
    d = Donation.create!(:title => "experience donation", :description => "experience", :donation_type => e, :donor => @donor)

    expect(d.donation_type).to eq(e)
  end
end
