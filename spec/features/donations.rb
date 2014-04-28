require 'spec_helper'

describe "add donation", :type => :feature do
  before :each do
    Donor.create(:email => 'testuser@berthartmann.com', :password => 'password')
    visit '/donors/sign_in'
    within("#new_donor") do
      fill_in 'donor_email', :with => 'testuser@berthartmann.com'
      fill_in 'donor_password', :with => 'password'
    end
    click_button 'Sign in'
  end

  it "adds physical donations" do
    visit "/"
    within("#new_donation") do
      fill_in "donation_title", :with => "Physical donation test"
      fill_in "donation_description", :with => "Test item for physical donations"
      choose "donation_type_physical"
      fill_in "donation_physical_donation_height", :with => "12"
      fill_in "donation_physical_donation_width", :with => "13"
      fill_in "donation_physical_donation_weight", :with => "14"
    end
    click_button "Create Donation"
    expect(page).to have_content "Physical donation test"
    expect(page).to have_content "Test item for physical donations"
    expect(page).to have_content "12cm"
  end

  it "adds voucher donations" do
    visit "/"
    within("#new_donation") do
      fill_in "donation_title", :with => "Voucher donation test"
      fill_in "donation_description", :with => "Test item for voucher donations"
      choose("Voucher")
    end
    click_button "Create Donation"
    expect(page).to have_content "Voucher donation test"
    expect(page).to have_content "Test item for voucher donations"
  end

  it "adds experience donations" do
    visit "/"
    within("#new_donation") do
      fill_in "donation_title", :with => "Experience donation test"
      fill_in "donation_description", :with => "Test item for experience donations"
      choose("Experience")
      fill_in "donation_experience_donation_contact", :with => "Experience Contact"
      fill_in "donation_experience_donation_latitude", :with => "40.75"
      fill_in "donation_experience_donation_longitude", :with => "74.03"
    end
    click_button "Create Donation"
    expect(page).to have_content "Experience donation test"
    expect(page).to have_content "Test item for experience donations"
    expect(page).to have_content "Experience Contact"
  end
end
