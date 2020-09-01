class BasicQrCodesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @basic_qr_code = policy_scope(BasicQrCode)
    authorize @basic_qr_code
  end
end
