class DonationsController < ApplicationController
  before_action :authenticate_donor!

  def create
    donation = Donation.create(donation_params)
    donation.donor = current_donor

    case params[:donation_type]
    when "physical"
      pd = PhysicalDonation.new(physical_params)
      donation.donation_type = pd
    when "voucher"
      vd = VoucherDonation.new(voucher_params)
      donation.donation_type = vd
    when "experience"
      ed = ExperienceDonation.new(experience_params)
      donation.donation_type = ed
    end
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
    params.require(:donation).dup.except!(:physical_donation, :voucher_donation, :experience_donation).permit(:title, :description)
  end
end
