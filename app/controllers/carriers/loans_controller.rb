class Carriers::LoansController < ApplicationController
  before_action :set_carrier

  respond_to :html, :json

  def new
    @loan = @carrier.loans.new
    respond_modal_with @loan
  end

  def create
    @loan = @carrier.loans.create(loan_params)
    respond_modal_with @loan, location: carrier_path(@carrier)
  end

  private
    def set_carrier
      @carrier = Carrier.find(params[:carrier_id])
    end

    def loan_params
      params.require(:loan).permit(:borrower_id, :due_date)
    end
end
