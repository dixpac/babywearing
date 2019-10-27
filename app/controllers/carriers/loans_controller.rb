class Carriers::LoansController < ApplicationController
  before_action :set_carrier

  def new
    @loan = @carrier.loans.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @loan = @carrier.loans.new(loan_params)
    @loan.lender_id = current_user.id

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @carrier, notice: 'Checkout performed successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_carrier
      @carrier = Carrier.find(params[:carrier_id])
    end

    def loan_params
      params.require(:loan).permit(:borrower_id, :due_date)
    end
end
