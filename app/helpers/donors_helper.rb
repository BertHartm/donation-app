module DonorsHelper
  def render_donation_type(donation_type)
    if donation_type.is_a?(PhysicalDonation)
      render(:partial => "donations/physical", :object => donation_type)
    elsif donation_type.is_a?(VoucherDonation)
      render(:partial => "donations/voucher", :object => donation_type)
    elsif donation_type.is_a?(ExperienceDonation)
      render(:partial => "donations/experience", :object => donation_type)
    end
  end
end
