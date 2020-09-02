class QrCodesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @qr_codes = policy_scope(QrCode)
    authorize @qr_codes
  end

  def create
    @qr = RQRCode::QRCode.new( qr_code_params[:text], size: 4)
  end

  private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end

end
