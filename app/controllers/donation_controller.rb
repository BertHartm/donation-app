class DonationController < ApplicationController
  before_action :authenticate_donor!

  def show
    @d = current_donor
    return
  end
end
