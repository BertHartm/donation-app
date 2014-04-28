class DonationsController < ApplicationController
  before_action :authenticate_donor!

  def create
    pd = PhysicalDonation.new(physical_params)
    vd = VoucherDonation.new(voucher_params)
    ed = ExperienceDonation.new(experience_params)

    donation = Donation.create(donation_params)
    donation.donor = current_donor

    donation.donation_type = ed
    current_donor.donations << donation
    redirect_to :controller => :donors, :action => :show and return
  end

  private
  def physical_params
    params[:donation].require(:physical_donation).permit(:height, :width, :weight)
  end

  def voucher_params
    params[:donation].require(:voucher_donation).permit(:expiration_date)
  end

  def experience_params
    params[:donation].require(:experience_donation).permit(:contact, :latitude, :longitude)
  end

  def donation_params
    params.require(:donation).except!(:donation_type, :physical_donation, :voucher_donation, :experience_donation).permit(:title, :description)
  end
end
