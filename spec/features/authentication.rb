require 'spec_helper'

describe "signup", :type => :feature do
  it "signs me up" do
    visit '/donors/sign_up'
    within("#new_donor") do
      fill_in 'donor_email', :with => 'testuser_signup@berthartmann.com'
      fill_in 'donor_password', :with => 'password'
      fill_in 'donor_password_confirmation', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome, testuser_signup@berthartmann.com'
  end
end

describe "signin", :type => :feature do
  before :each do
    Donor.create(:email => 'testuser@berthartmann.com', :password => 'password')
  end

  it "signs me in" do
    visit '/donors/sign_in'
    within("#new_donor") do
      fill_in 'donor_email', :with => 'testuser@berthartmann.com'
      fill_in 'donor_password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Welcome, testuser@berthartmann.com'
  end

  it "signs me out" do
    visit '/donors/sign_in'
    within("#new_donor") do
      fill_in 'donor_email', :with => 'testuser@berthartmann.com'
      fill_in 'donor_password', :with => 'password'
    end
    click_button 'Sign in'
    visit '/'
    click_link 'Sign out'
    expect(page).to have_content "Sign in"
  end

  it "fails for non-users" do
    visit '/donors/sign_in'
    within("#new_donor") do
      fill_in 'donor_email', :with => 'fakeuser@berthartmann.com'
      fill_in 'donor_password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content "Sign in"
  end
end
