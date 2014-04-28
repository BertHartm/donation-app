class DonationsController < ApplicationController
  before_action :authenticate_donor!

  def create
    current_donor.donations << Donation.create(:title => params[:title], :description => params[:description], :donor => current_donor)
    redirect_to :controller => :donors, :action => :show and return
  end
end
